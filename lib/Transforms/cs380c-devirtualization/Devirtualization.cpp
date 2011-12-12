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
  StringRef name;
  ClassSet parents, children;

public:
  Class(const StringRef& classname, const ClassSet& supers = ClassSet(), const ClassSet& subs = ClassSet())
  : name(classname), parents(supers), children(subs)
  {}
  Class(const Class& other)
  : name(other.name), parents(other.parents), children(other.children)
  {}
  virtual ~Class() {}

  bool isRoot(void) {return parents.empty();}
  bool isLeaf(void) {return children.empty();}

  const ClassSet& getChildren(void) const {return children;}
  ClassSet& getChildren(void) {return children;}

  void dump(void) const {
    ferrs() << name << "\nParents: ";
    for (ClassSet::const_iterator i = parents.begin(); i != parents.end(); ++i) {
      ferrs() << (*i)->name << ' ';
    }
    ferrs() << name << "\nChildren: ";
    for (ClassSet::const_iterator i = children.begin(); i != children.end(); ++i) {
      ferrs() << (*i)->name << ' ';
    }
    ferrs() << '\n';
  }
};

struct FunctionMetadata {
  Function* Func;
  StringRef Name;
  StringRef LinkageName;
  unsigned Virtuality;
  unsigned VirtualIndex;
  DICompositeType ContainingType;
};

FunctionMetadata FromSubprogram(DISubprogram Subprogram) {
  FunctionMetadata MD = {
    Subprogram.getFunction(),
    Subprogram.getName(),
    Subprogram.getLinkageName(),
    Subprogram.getVirtuality(),
    Subprogram.getVirtualIndex(),
    Subprogram.getContainingType(),
  };
  return MD;
}

class DevirtualizationPass : public llvm::ModulePass {
public:
  static char ID;

  typedef ValueMap<MDNode*, Class*> TypeMap;

  TypeMap classes;
  StringMap<FunctionMetadata> LinkageToMetadata;
  ValueMap<Function*, FunctionMetadata> FunctionToMetadata;
  ValueMap<Function*, vector<Function*> > FunctionArgEquSets;
  DICompositeType TestClass;

  DevirtualizationPass(void) : ModulePass(ID) {}
  virtual ~DevirtualizationPass(void) {
    // Clean up the pointers we new
    for (TypeMap::iterator i = classes.begin(); i != classes.end(); ++i) {
      delete i->second;
    }
  }

  virtual bool runOnModule(Module& m) {
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

    for (size_t i=0; i < sp->getNumOperands(); ++i) {
      const MDNode* const MD = sp->getOperand(i);
      const DISubprogram Subprogram = DISubprogram(MD);
      const DICompositeType type = Subprogram.getContainingType();
      if (type.Verify() && type.getTag() == dwarf::DW_TAG_class_type) {
        if (type.getName().str().compare("D") == 0) {
          TestClass = type;
        }
      }
    }

    for (ValueMap<Function*, FunctionMetadata>::const_iterator
        FuncIter = FunctionToMetadata.begin(),
        FuncEnd = FunctionToMetadata.end();
        FuncIter != FuncEnd;
        FuncIter++) {
      Function* Func = FuncIter->first;
      if (vector<Function*>* v = GetOrCreateEquSet(Func)) {
        v->push_back(Func);
      }
    }

    // Build class hierarchy
    for (size_t i=0; i < sp->getNumOperands(); ++i) {
      const MDNode* const MD = sp->getOperand(i);
      const DISubprogram Subprogram = DISubprogram(MD);
      const DICompositeType type = Subprogram.getContainingType();
      if (type.Verify() && type.getTag() == dwarf::DW_TAG_class_type) {
        Class* const c = getOrCreateHierarchy(type);
        type->dump();
        // TODO: add the method we inspected to c's method list (if necessary)
      }
    }

    for (TypeMap::const_iterator i = classes.begin(); i != classes.end(); ++i) {
      ferrs() << "Found class (" << i->second << ") with hierarchy:\n";
      (*i).second->dump();
    }

    for (Module::iterator i = m.begin(), e = m.end(); i != e; ++i) {
      runOnFunction(*i);
    }

    return false;
  }

protected:
  Class* getOrCreateHierarchy(const DICompositeType& type) {
    const TypeMap::const_iterator typeClass = classes.find(type);
    if (typeClass != classes.end()) {
      Class * const c = typeClass->second;
      ferrs() << "Existing class pointer for " << type.getName()
              << " ("<< ((MDNode*)type) << ") is " << c << '\n';
      return c;
    }


    // Otherwise, build the hierarchy
    Class::ClassSet parents;

    // Iterate over the fields in the class
    const DIArray arr = type.getTypeArray();
    for (size_t a=0; a < arr.getNumElements(); ++a) {
      const DIDescriptor elem = arr.getElement(a);
      switch (elem.getTag()) {
      case dwarf::DW_TAG_inheritance:
        // This represents a parent type; get its Class and make it a parent of ours
        DIDerivedType inh = DIDerivedType(elem);
        inh.getTypeDerivedFrom();
        Class* parent = getOrCreateHierarchy(DICompositeType(DIDerivedType(elem).getTypeDerivedFrom()));
        parents.insert(parent);
        break;
      }
    }

    Class* const c = new Class(type.getName(), parents);
    ferrs() << "New class pointer for " << type.getName()
            << " (" << ((MDNode*)type) << ") is " << c << '\n';
    for (Class::ClassSet::iterator i = parents.begin(); i !=parents.end(); ++i) {
      (*i)->getChildren().insert(c);
    }

    const pair<TypeMap::iterator, bool> res = classes.insert(pair<MDNode*, Class*>((MDNode*)type, c));
    return c;
  }

  void runOnFunction(Function& f) {
    for (Function::iterator i = f.begin(), e = f.end(); i != e; ++i) {
      runOnBasicBlock(*i);
    }
  }

  void runOnBasicBlock(BasicBlock& bb) {
    for (BasicBlock::iterator i = bb.begin(), e = bb.end(); i != e; ++i) {
      if (CallInst* const Call = dyn_cast<CallInst>(&*i)) {
        if (const MDNode* const VirtualMD = Call->getMetadata("virtual-call")) {
          if (Function* const Func = // ValueMap::count doesn't like const, sad
              dyn_cast<Function>(VirtualMD->getOperand(0))) {
            if (!FunctionToMetadata.count(Func)) {
              ferrs() << "Function metadata not found:\n";
              Func->dump();
              continue;
            }
            const FunctionMetadata MD = FunctionToMetadata[Func];
            if (MD.Virtuality) {
              vector<Function*>* EquSet = GetOrCreateEquSet(Func);
              for (vector<Function*>::const_iterator
                    it = EquSet->begin(),
                    end = EquSet->end();
                   it != end;
                   it++) {
                Function* const F = *it;
                if (FunctionToMetadata[F].ContainingType == TestClass) {
                  Call->setArgOperand(
                    0,
                    CastInst::Create(
                      Instruction::BitCast,
                      Call->getArgOperand(0),
                      F->arg_begin()->getType(),
                      "",
                      Call
                    )
                  );
                  Call->setCalledFunction(F);
                }
              }
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
      MD = FromSubprogram(Subprogram);
    }
    LinkageToMetadata.GetOrCreateValue(Subprogram.getLinkageName(), MD);
  }

  vector<Function*>* GetOrCreateEquSet(Function* Func) {
    if (FunctionToMetadata.count(Func)) {
      FunctionMetadata FuncMeta = FunctionToMetadata[Func];
      if (FuncMeta.Virtuality && Func->arg_size()) {
        Function::const_arg_iterator
        ArgIter = Func->arg_begin(),
        ArgEnd  = Func->arg_end();
        ArgIter++;
        int ArgI;
        const Type* *FuncArgs = new const Type*[Func->arg_size()];
        for (ArgI = 0; ArgIter != ArgEnd; ArgIter++, ArgI++) {
          FuncArgs[ArgI] = ArgIter->getType();
        }
        for (ValueMap<Function*, vector<Function*> >::iterator
            FuncIter = FunctionArgEquSets.begin(),
            FuncEnd = FunctionArgEquSets.end();
            FuncIter != FuncEnd;
            FuncIter++) {
          Function* const Base = FuncIter->first;
          FunctionMetadata BaseMeta = FunctionToMetadata[Base];
          if (BaseMeta.Virtuality
              && BaseMeta.Name.equals(FuncMeta.Name)
              && Base->arg_size() == Func->arg_size()) {
            ArgIter = Base->arg_begin();
            ArgEnd  = Base->arg_end();
            ArgIter++;
            bool good = true;
            for (ArgI = 0; ArgIter != ArgEnd; ArgIter++, ArgI++) {
              if (ArgIter->getType() != FuncArgs[ArgI]) {
                good = false;
                break;
              }
            }
            if (good) {
              return &FuncIter->second;
            }
          }
        }
        delete [] FuncArgs;
        vector<Function*> newSet;
        FunctionArgEquSets.insert(pair<Function*, vector<Function*> >(
            Func,
            newSet
        ));
        return &FunctionArgEquSets[Func];
      }
    }
    return NULL;
  }
};

char DevirtualizationPass::ID= 0;
static RegisterPass<DevirtualizationPass>X("devirt", "Devirtualize virtual function calls", false, false);
}
