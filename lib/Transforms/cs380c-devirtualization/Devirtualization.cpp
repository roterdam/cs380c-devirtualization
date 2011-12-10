/*
 * Devirtualization.cpp
 *
 *  Created on: Nov 16, 2011
 *      Author: vitor, brian
 */

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

namespace {
	/*
	 * Abstraction over class types encountered in metadata. Provides a list of methods
	 * declared in the class, plus its parent and child classes
	 */
	class Class {
	public:
		typedef llvm::SmallPtrSet<Class*, 3> ClassSet;
		//typedef llvm::SmallPtrSet<llvm::Function*,  8> FunctionSet;

	protected:
		ClassSet parents, children;
		//FunctionSet methods;

	public:
		Class(const ClassSet& supers = ClassSet(), const ClassSet& subs = ClassSet())
			: parents(supers), children(subs)
		{}
		Class(const Class& other)
			: parents(other.parents), children(other.children)
		{}
		virtual ~Class() {}

		bool isRoot(void) {return parents.empty();}
		bool isLeaf(void) {return children.empty();}
	};

class DevirtualizationPass : public llvm::ModulePass {
public:
	static char ID;

	DevirtualizationPass(void) : ModulePass(ID) {}
	virtual ~DevirtualizationPass(void) {}

	llvm::ValueMap nodes

  DICompositeType TestClass;
  size_t TestVTableIndex;
	virtual bool runOnModule(Module& m) {
    TestVTableIndex = -1;
    const NamedMDNode* const sp = m.getNamedMetadata(Twine("llvm.dbg.sp"));
    if (!sp) {
      ferrs() << "No llvm.dbg.sp metadata found\n";
    }
    for (size_t i=0; i < sp->getNumOperands(); ++i) {
		const MDNode* const mdnode = sp->getOperand(i);
		const DISubprogram subprogram = DISubprogram(mdnode);
		const DICompositeType type = subprogram.getContainingType();
		if (type.Verify() && (type.getTag() == dwarf::DW_TAG_class_type
											|| type.getTag() == dwarf::DW_TAG_structure_type))
		{
		  type->dump();
		  const DIArray arr = type.getTypeArray();
		  for (size_t a=0; a < arr.getNumElements(); ++a) {
			const DIDescriptor elem = arr.getElement(a);
			switch (elem.getTag()) {
			  case dwarf::DW_TAG_member: {
				const DIDerivedType member = DIDerivedType(&*elem);
				if (member.getName().str().substr(0,6).compare("_vptr$") == 0) {
				  TestClass = type;
				  TestVTableIndex = a;
				  elem->dump();
				  // map class to vtable
				}
				break;
			  }
			  case dwarf::DW_TAG_inheritance: {
				const DIDerivedType inheritance = DIDerivedType(&*elem);
				// may have to go up hierarchy to look up vtable
				break;
			  }
			}
		  }
		}
    }
		for (Module::iterator i = m.begin(), e = m.end(); i != e; ++i) {
			runOnFunction(*i);
		}
		return false;
	}

protected:
	void runOnFunction(Function& f) {
		for (Function::iterator i = f.begin(), e = f.end(); i != e; ++i) {
			runOnBasicBlock(*i);
			ferrs() << "Function name: " << f.getName() << '\n';
		}
	}

	void runOnBasicBlock(BasicBlock& bb) {
		for (BasicBlock::iterator i = bb.begin(), e = bb.end(); i != e; ++i) {
			if (const CallInst* const Call = dyn_cast<CallInst>(&*i)) {
        if (const MDNode* const VirtualMD = Call->getMetadata("virtual-call")) {
				  ferrs() << "Call \"";
				  Call->print(ferrs());
				  ferrs() << '\n';
          if (const Function* const Func =
              dyn_cast<Function>(VirtualMD->getOperand(0))) {
            //if (const MDNode* const FuncMD = Func->getMetadata("dbg")) {
            //  FuncMD->dump();
            //}
          }
        }
			}
		}
	}
};

char DevirtualizationPass::ID= 0;
static RegisterPass<DevirtualizationPass>X("devirt", "Devirtualize virtual function calls", false, false);
}
