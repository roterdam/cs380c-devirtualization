/*
 * Devirtualization.cpp
 *
 *  Created on: Nov 16, 2011
 *      Author: vitor, brian
 */

#include "llvm/ADT/StringMap.h"
#include "llvm/ADT/ValueMap.h"
#include "llvm/Function.h"
#include "llvm/Module.h"
#include "llvm/Pass.h"
#include "llvm/Instructions.h"
#include "llvm/LLVMContext.h"

#include "llvm/Metadata.h"

#include "llvm/DerivedTypes.h"
#include "llvm/InstrTypes.h"

#include "llvm/Support/FormattedStream.h"
#include "llvm/Analysis/DebugInfo.h"

#include <string>

using namespace llvm;
using namespace std;

namespace {
	/*
	 * Abstraction over class types encountered in metadata. Provides a list of methods
	 * declared in the class, plus its parent and child classes
	 */
	class Class {
	public:
		typedef llvm::SmallPtrSet<Class*, 3> ClassSet;

	protected:
		ClassSet parents, children;
		StringRef name;

	public:
		Class(const StringRef& classname, const ClassSet& supers = ClassSet(), const ClassSet& subs = ClassSet())
			: name(classname), parents(supers), children(subs)
		{}
		Class(const Class& other)
			: name(classname), parents(other.parents), children(other.children)
		{}
		virtual ~Class() {}

		bool isRoot(void) {return parents.empty();}
		bool isLeaf(void) {return children.empty();}

		void dump(void) const {
			ferrs() << name;
			for (ClassSet::const_iterator i = parents.begin(); i != parents.end(); +i1)
		}
	};

struct FunctionMetadata {
  Function* Func;
  StringRef LinkageName;
  unsigned Virtuality;
  unsigned VirtualIndex;
  DICompositeType ContainingType;
};

class DevirtualizationPass : public llvm::ModulePass {
public:
	static char ID;

	ValueMap<MDNode*, Class*> classes;
	StringMap<FunctionMetadata> LinkageToMetadata;
	ValueMap<Function*, FunctionMetadata> FunctionToMetadata;

	DevirtualizationPass(void) : ModulePass(ID) {}
	virtual ~DevirtualizationPass(void) {
		// Clean up the pointers we new
		for (ValueMap::iterator i = classes.begin(); i != classes.end(); ++i) {
			delete i->second;
		}
	}

	virtual bool runOnModule(Module& m) {
		TestVTableIndex = -1;
		const NamedMDNode* const sp = m.getNamedMetadata(Twine("llvm.dbg.sp"));
		if (!sp) {
		  ferrs() << "No llvm.dbg.sp metadata found\n";
		}

		for (size_t i=0; i < sp->getNumOperands(); ++i) {
				if (const MDNode* const MD = dyn_cast<MDNode>(sp->getOperand(i))) {
			UpdateLinkageToMetadata(DISubprogram(MD));
		  }
		}

		// Build the map from Functions to Metadata from the Linkage map
		for (StringMap<FunctionMetadata>::const_iterator
			  LtoMDIter = LinkageToMetadata.begin(),
			  LtoMDEnd = LinkageToMetadata.end();
			 LtoMDIter != LtoMDEnd;
			 LtoMDIter++) {
		  FunctionMetadata MD = LtoMDIter->getValue();
		  FunctionToMetadata.insert(pair<Function*, FunctionMetadata>(MD.Func, MD));
		}

		// Build class hierarchy
		for (size_t i=0; i < sp->getNumOperands(); ++i) {
			const MDNode* const MD = sp->getOperand(i);
			const DISubprogram Subprogram = DISubprogram(MD);
			const DICompositeType type = Subprogram.getContainingType();
			if (type.Verify() && type.getTag() == dwarf::DW_TAG_class_type) {
			  type->dump();
			  Class * const c = getOrCreateHierarchy(type);
			  ferrs() << "Found class with hierarchy:\n";
			  c->dump();
			  // TODO: add the method we inspected to c's method list (if necessary)
			}
		}

		for (Module::iterator i = m.begin(), e = m.end(); i != e; ++i) {
			runOnFunction(*i);
		}

		return false;
	}

protected:
	Class* getOrCreateHierarchy(const DICompositeType& type) {
		Class* c = classes.find(*type);
		// If it's already mapped, return it
		if (c) return c;

		// Otherwise, build the hierarchy
		Class::ClassSet parents;

		// Iterate over the fields in the class
		const DIArray arr = type.getTypeArray();
		for (size_t a=0; a < arr.getNumElements(); ++a) {
			const DIDescriptor elem = arr.getElement(a);
			switch (elem.getTag()) {
			case dwarf::DW_TAG_inheritance:
				// This represents a parent type; get its Class and make it a parent of ours
				parents.insert(getOrCreateHierarchy(DICompositeType(&*elem)));
				break;
			}
		}

		return classes.insert(pair<MDNode*, Class*>(*type, new Class(type.getName(), parents)));
	}
	void runOnFunction(Function& f) {
		for (Function::iterator i = f.begin(), e = f.end(); i != e; ++i) {
			runOnBasicBlock(*i);
			ferrs() << "Function name: " << f.getName() << '\n';
		}
	}

	void runOnBasicBlock(BasicBlock& bb) {
		for (BasicBlock::iterator i = bb.begin(), e = bb.end(); i != e; ++i) {
			if (CallInst* const Call = dyn_cast<CallInst>(&*i)) {
        if (const MDNode* const VirtualMD = Call->getMetadata("virtual-call")) {
				  Call->dump();
          if (Function* const Func = // ValueMap::count doesn't like const, sad
              dyn_cast<Function>(VirtualMD->getOperand(0))) {
            if (!FunctionToMetadata.count(Func)) {
              ferrs() << "Function metadata not found:\n";
              Func->dump();
              continue;
            }
            const FunctionMetadata MD = FunctionToMetadata.lookup(Func);
            if (MD.Virtuality) {
              ferrs() << MD.LinkageName << "\n";
              Call->setCalledFunction(Func);
              Call->dump();
            }
          }
        }
			}
		}
	}

  void UpdateLinkageToMetadata(const DISubprogram& Subprogram) {
    StringRef LinkageName = Subprogram.getLinkageName();
    FunctionMetadata MD;
    if (LinkageToMetadata.count(LinkageName)) {
      MD = LinkageToMetadata.lookup(LinkageName);
      LinkageToMetadata.erase(LinkageName); // in order to insert new metadata
      if (!MD.Func) { MD.Func = Subprogram.getFunction(); }
      if (!MD.Virtuality) { MD.Virtuality = Subprogram.getVirtuality(); 
                            MD.VirtualIndex = Subprogram.getVirtualIndex(); }
      if (!MD.ContainingType.Verify())
        { MD.ContainingType = Subprogram.getContainingType(); }
    } else {
      MD = (FunctionMetadata){
        Subprogram.getFunction(),
        Subprogram.getLinkageName(),
        Subprogram.getVirtuality(),
        Subprogram.getVirtualIndex(),
        Subprogram.getContainingType(),
      };
    }
    LinkageToMetadata.GetOrCreateValue(Subprogram.getLinkageName(), MD);
  }
};

char DevirtualizationPass::ID= 0;
static RegisterPass<DevirtualizationPass>X("devirt", "Devirtualize virtual function calls", false, false);
}
