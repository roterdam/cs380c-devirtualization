/*
 * Devirtualization.cpp
 *
 *  Created on: Nov 16, 2011
 *      Author: vitor
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


using namespace llvm;

namespace {
class DevirtualizationPass : public llvm::ModulePass {
public:
	static char ID;

	DevirtualizationPass(void) : ModulePass(ID) {}

	typedef SmallVector<StringRef, 2> MDNameList;
	virtual bool runOnModule(Module& m) {
		MDNameList mds;
		m.getContext().getMDKindNames(mds);

		ferrs() << " Metadata names: \n";
		for (MDNameList::iterator i = mds.begin(), e = mds.end(); i != e; ++i) {
			ferrs() << *i << '\n';
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
			if (const CallInst* const call = dyn_cast<CallInst>(&*i)) {
				ferrs() << "Call \"";
				call->print(ferrs());
				ferrs() << "\"\nto\n";
				const Value* const v = call->getCalledValue();
				v->getType()->print(ferrs());
				ferrs() << '\n';
			}
		}
	}
};

char DevirtualizationPass::ID= 0;
static RegisterPass<DevirtualizationPass>X("devirt", "Devirtualize virtual function calls", false, false);
}
