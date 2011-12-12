/*
 * Devirtualization.cpp
 *
 *  Created on: Nov 16, 2011
 *      Author: vitor, brian
 */

#include "llvm/ADT/DenseMap.h"
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

#define foreach(T, L, i) for(T::iterator i = (L).begin(), __end = (L).end(); i != __end; i++)
#define foreachI(T, L, i, pre) for(T::pre i = (L).begin(), __end = (L).end(); i != __end; i++)

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
    foreachI (ClassSet, parents, i, const_iterator) {
      ferrs() << (*i)->name << ' ';
    }
    ferrs() << name << "\nChildren: ";
    foreachI (ClassSet, children, i, const_iterator) {
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
  DIType Type;
};
typedef llvm::SmallPtrSet<FunctionMetadata*, 3> MDSet;
typedef DenseMap<FunctionMetadata*,MDSet> SignatureEquSetMap;

FunctionMetadata FromSubprogram(DISubprogram Subprogram) {
  FunctionMetadata MD = {
    Subprogram.getFunction(),
    Subprogram.getName(),
    Subprogram.getLinkageName(),
    Subprogram.getVirtuality(),
    Subprogram.getVirtualIndex(),
    Subprogram.getContainingType(),
    Subprogram.getType(),
  };
  return MD;
}

class DevirtualizationPass : public llvm::ModulePass {
public:
  static char ID;

  typedef ValueMap<MDNode*, Class*> TypeMap;

  TypeMap classes;
  StringMap<FunctionMetadata*> LinkageToMetadata;
  DenseMap<FunctionMetadata*, MDSet> SignatureEquSets;
  DICompositeType TestClass;

  DevirtualizationPass(void) : ModulePass(ID) {}
  virtual ~DevirtualizationPass(void) {
    // Clean up the pointers we new
    foreach (TypeMap, classes, i) {
      delete i->second;
    }
    foreach (StringMap<FunctionMetadata*>, LinkageToMetadata, i) {
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

    foreach (StringMap<FunctionMetadata*>, LinkageToMetadata, MDIter) {
      FunctionMetadata* MD = MDIter->second;
      if (MDSet* v = GetOrCreateEquSet(MD)) {
        v->insert(MD);
      }
    }

    foreach (Module, m, i) {
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
    foreach (Class::ClassSet, parents, i) {
      (*i)->getChildren().insert(c);
    }

    const pair<TypeMap::iterator, bool> res = classes.insert(pair<MDNode*, Class*>((MDNode*)type, c));
    return c;
  }

  void runOnFunction(Function& f) {
    foreach (Function, f, i) {
      runOnBasicBlock(*i);
    }
  }

  void runOnBasicBlock(BasicBlock& bb) {
    foreach (BasicBlock, bb, i) {
      if (CallInst* const Call = dyn_cast<CallInst>(&*i)) {
        if (const MDNode* const VirtualMD = Call->getMetadata("virtual-call")) {
          if (MDString* const LinkageNameNode =
              dyn_cast<MDString>(VirtualMD->getOperand(0))) {
            StringRef LinkageName = LinkageNameNode->getString();
            if (!LinkageToMetadata.count(LinkageName)) {
              ferrs() << "Function metadata not found: " << LinkageName << "\n";
              continue;
            }
            FunctionMetadata* MD = LinkageToMetadata[LinkageName];
            if (MD->Virtuality) {
              MDSet* EquSet = GetOrCreateEquSet(MD);
              foreach (MDSet, *EquSet, it) {
                FunctionMetadata* const NewMD = *it;
                if (NewMD->ContainingType == TestClass && NewMD->Func) {
                  Call->setArgOperand(
                    0,
                    CastInst::Create(
                      Instruction::BitCast,
                      Call->getArgOperand(0),
                      NewMD->Func->arg_begin()->getType(),
                      "",
                      Call
                    )
                  );
                  Call->setCalledFunction(NewMD->Func);
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
    FunctionMetadata* MD;
    if (LinkageToMetadata.count(LinkageName)) {
      MD = LinkageToMetadata.lookup(LinkageName);
      LinkageToMetadata.erase(LinkageName); // in order to insert new metadata
      if (!MD->Func) { MD->Func = Subprogram.getFunction(); }
      if (!MD->Virtuality) { MD->Virtuality = Subprogram.getVirtuality();
                             MD->VirtualIndex = Subprogram.getVirtualIndex(); }
      if (!MD->ContainingType.Verify())
        { MD->ContainingType = Subprogram.getContainingType(); }
    } else {
      MD = new FunctionMetadata;
      *MD = FromSubprogram(Subprogram);
    }
    LinkageToMetadata.GetOrCreateValue(Subprogram.getLinkageName(), MD);
  }

  MDSet* GetOrCreateEquSet(FunctionMetadata* MD) {
    if (MD->Virtuality) {
      foreach (SignatureEquSetMap, SignatureEquSets, EquSetIter) {
        FunctionMetadata* const BaseMD = EquSetIter->first;
        if (BaseMD->Name.equals(MD->Name) && BaseMD->Type == MD->Type) {
          return &EquSetIter->second;
        }
      }
      MDSet newSet;
      SignatureEquSets.insert(pair<FunctionMetadata*, MDSet>(MD, newSet));
      return &SignatureEquSets[MD];
    }
    return NULL;
  }
};

char DevirtualizationPass::ID= 0;
static RegisterPass<DevirtualizationPass>X("devirt", "Devirtualize virtual function calls", false, false);
}
