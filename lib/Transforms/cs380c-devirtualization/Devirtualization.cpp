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

	DevirtualizationPass(void) : ModulePass(ID) {}

  StringMap<FunctionMetadata> LinkageToMetadata;
  ValueMap<Function*, FunctionMetadata> FunctionToMetadata;
  DICompositeType TestClass;
  size_t TestVTableIndex;
	virtual bool runOnModule(Module& m) {
    TestVTableIndex = -1;
    const NamedMDNode* const sp = m.getNamedMetadata(Twine("llvm.dbg.sp"));
    if (!sp) {
      ferrs() << "No llvm.dbg.sp metadata found\n";
    }
    for (size_t i=0; i < sp->getNumOperands(); ++i) {
			if (const MDNode* const MD = dyn_cast<MDNode>(sp->getOperand(i))) {
        const DISubprogram Subprogram = DISubprogram(MD);
        const DICompositeType type = Subprogram.getContainingType();
        if (type.Verify() && type.getTag() == dwarf::DW_TAG_class_type) {
          type->dump();
          const DIArray arr = type.getTypeArray();
          for (size_t a=0; a < arr.getNumElements(); ++a) {
            const DIDescriptor elem = arr.getElement(a);
            switch (elem.getTag()) {
              case dwarf::DW_TAG_member: {
                const DIDerivedType member = DIDerivedType(&*elem);
                if (member.getName().str().substr(0,6).compare("_vptr$") == 0) {
                  if (type.getName().str().compare("A") == 0) {
                    TestClass = type;
                    TestVTableIndex = a;
                  }
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
		for (Module::iterator i = m.begin(), e = m.end(); i != e; ++i) {
			runOnFunction(*i);
		}
		return false;
	}

protected:
	void runOnFunction(Function& f) {
		for (Function::iterator i = f.begin(), e = f.end(); i != e; ++i) {
			runOnBasicBlock(*i);
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

  void UpdateLinkageToMetadata(const DISubprogram Subprogram) {
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
