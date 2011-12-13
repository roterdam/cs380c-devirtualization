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
#include "llvm/Support/InstIterator.h"

#include <string>

#define foreach(T, L, i) for(T::iterator i = (L).begin(), __end = (L).end(); i != __end; i++)
#define foreachI(T, L, i, pre) for(T::pre i = (L).begin(), __end = (L).end(); i != __end; i++)


using namespace llvm;
using namespace std;

namespace {
struct FunctionMetadata {
  Function* Func;
  StringRef Name;
  StringRef LinkageName;
  unsigned Virtuality;
  unsigned VirtualIndex;
  DICompositeType ContainingType;
  DIType Type;
};

/*
 * Abstraction over class types encountered in metadata. Provides a list of methods
 * declared in the class, plus its parent and child classes
 */
class Class {
public:
  typedef llvm::SmallPtrSet<Class*, 3> ClassSet;
  typedef llvm::SmallPtrSet<FunctionMetadata*, 5> FunctionSet;

protected:
  StringRef name;

  ClassSet parents, children;
  FunctionSet methods;

public:
  Class(const StringRef& classname, const ClassSet& supers = ClassSet(),
			 const ClassSet& subs = ClassSet(), const FunctionSet& funcs = FunctionSet())
  : name(classname), parents(supers), children(subs), methods(funcs)
  {}

  Class(const Class& other)
  : name(other.name), parents(other.parents), children(other.children),
    methods(other.methods)
  {}

  virtual ~Class() {}

  bool isRoot(void) const {return parents.empty();}
  bool isLeaf(void) const {return children.empty();}

  bool isSubclassOf(Class* C) {
    if (this == C) { return true; }
    ClassSet Checked;
    vector<Class*> Workload;
    Workload.push_back(this);
    do {
      Class* next = Workload.back();
      Workload.pop_back();
      if (next->parents.count(C)) {
        return true;
      }
      Checked.insert(next);
      foreach (ClassSet, next->parents, P) {
        Class* ParentClass = *P;
        if (!Checked.count(ParentClass)) {
          Workload.push_back(ParentClass);
        }
      }
    } while (Workload.size());
    return false;
  }

  const StringRef getName(void) const {return name;}

  const ClassSet& getChildren(void) const {return children;}
  ClassSet& getChildren(void) {return children;}

  const ClassSet& getParents(void) const {return parents;}
  ClassSet& getParents(void) {return parents;}

  const FunctionSet& getMethods(void) const {return methods;}
  FunctionSet& getMethods(void) {return methods;}

  FunctionMetadata* getMethod(const StringRef name, const DIType& type) const {
    foreach (FunctionSet, methods, i) {
    	FunctionMetadata* const method = *i;
      if (method->Name == name && method->Type == type) {
        return method;
      }
    }
    foreach (ClassSet, parents, p) {
      if (FunctionMetadata* const method = (*p)->getMethod(name, type)) {
        return method;
      }
    }
    return NULL;
  }

  void dump(void) const {
    ferrs() << name << "\nParents:";
    foreachI (ClassSet, parents, i, const_iterator) {
      ferrs() << ' ' << (*i)->name;
    }
    ferrs() << "\nChildren:";
    foreachI (ClassSet, children, i, const_iterator) {
      ferrs() << ' ' << (*i)->name;
    }
    ferrs() << "\nMethods:";
    foreachI(FunctionSet, methods, i, const_iterator) {
    	const FunctionMetadata* const f = *i;
    	ferrs() << ' ' << f->Name << " (" << f->LinkageName << ')';
    }
    ferrs() << '\n';
  }
};

typedef llvm::SmallPtrSet<FunctionMetadata*, 3> MDSet;
typedef DenseMap<FunctionMetadata*,MDSet> SignatureEquSetMap;

FunctionMetadata FromSubprogram(DISubprogram Subprogram) {
  StringRef LinkageName = Subprogram.getLinkageName();
  if (LinkageName.empty()) {
    LinkageName = Subprogram.getName();
  }
  FunctionMetadata MD = {
    Subprogram.getFunction(),
    Subprogram.getName(),
    LinkageName,
    Subprogram.getVirtuality(),
    Subprogram.getVirtualIndex(),
    Subprogram.getContainingType(),
    Subprogram.getType(),
  };
  return MD;
}

struct CallEdge {
  FunctionMetadata* ToFunc;
  bool isVirtual;
  bool Unknown;
};

class DevirtualizationPass : public llvm::ModulePass {
public:
  static char ID;

  typedef ValueMap<MDNode*, Class*> TypeMap;

  TypeMap classes;
  StringMap<FunctionMetadata*> LinkageToMetadata;
  DenseMap<FunctionMetadata*, MDSet> SignatureEquSets;
  DenseMap<FunctionMetadata*, MDSet> OverriddenByMap;
  DenseMap<FunctionMetadata*, vector<CallEdge> > CallGraph;

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
      const MDNode* const MD = sp->getOperand(i);
      UpdateLinkageToMetadata(DISubprogram(MD));
    }

    ferrs() << "Linkage::\n";
    foreach (StringMap<FunctionMetadata*>, LinkageToMetadata, pair) {
      StringRef LN = pair->first();
      FunctionMetadata* MD = pair->second;
      ferrs() << LN << "," << MD->Name << "," << MD->LinkageName << "\n";
    }

    // Get Function*s from the module if the Function's not defined in the Module
    foreach(StringMap<FunctionMetadata*>, LinkageToMetadata, i) {
    	FunctionMetadata* const f = i->second;
    	if (!f->Func) {
    		f->Func = m.getFunction(f->LinkageName);
    	}
    }

    // Build class hierarchy
    for (size_t i=0; i < sp->getNumOperands(); ++i) {
      const MDNode* const MD = sp->getOperand(i);
      const DISubprogram Subprogram = DISubprogram(MD);
      const DICompositeType type = Subprogram.getContainingType();
      if (type.Verify() && type.getTag() == dwarf::DW_TAG_class_type) {
        getOrCreateHierarchy(type);
      }
    }

    // Associate functions with their defining classes
    foreachI(StringMap<FunctionMetadata*>, LinkageToMetadata, i, const_iterator) {
    	FunctionMetadata* const f = i->second;
    	const TypeMap::iterator c = classes.find(f->ContainingType);
    	ferrs() << "Found function " << f->Name << " (" << f->LinkageName
				   << ") ";
    	if (c != classes.end()) {
    		Class* const C = c->second;
    		ferrs() << "in class " << C->getName() << '\n';
        	C->getMethods().insert(f);
    	} else {
    		ferrs() << "WITH NO CLASS\n";
    	}
    }

    for (TypeMap::const_iterator i = classes.begin(); i != classes.end(); ++i) {
      ferrs() << "Found class (" << i->second << ") with hierarchy:\n";
      (*i).second->dump();
    }

    foreach (StringMap<FunctionMetadata*>, LinkageToMetadata, MDIter) {
      FunctionMetadata* MD = MDIter->second;
      if (MDSet* v = GetOrCreateEquSet(MD)) {
        v->insert(MD);
      }
    }

    foreach (StringMap<FunctionMetadata*>, LinkageToMetadata, MDIter) {
      FunctionMetadata* MD = MDIter->second;
      SetOverridenByFor(MD);
    }

    foreach (Module, m, f) {
      foreach (Function, *f, bb) {
        foreach (BasicBlock, *bb, i) {
          if (CallInst* const Call = dyn_cast<CallInst>(&*i)) {
            UpdateCallGraph(Call, f);
          }
        }
      }
    }

    foreach (Module, m, i) {
      runOnFunction(*i);
    }

    return false;
  }

protected:
  void UpdateCallGraph(const CallInst* const Call, Function* FromFunc) {
    StringRef ToLinkageName;
    CallEdge callEdge = {NULL, false, false};
    if (const MDNode* const VirtualMD = Call->getMetadata("virtual-call")) {
      if (MDString* const LinkageNameNode =
          dyn_cast<MDString>(VirtualMD->getOperand(0))) {
        ToLinkageName = LinkageNameNode->getString();
        callEdge.isVirtual = true;
        callEdge.ToFunc = LinkageToMetadata[ToLinkageName];
      }
    }
    if (!callEdge.isVirtual) {
      if (isa<Function>(Call->getCalledValue())) {
        ToLinkageName = Call->getCalledFunction()->getName();
        callEdge.ToFunc = LinkageToMetadata[ToLinkageName];
      } else {
        callEdge.Unknown = true;
      }
    }
    if (!callEdge.Unknown && !callEdge.ToFunc) {
      return; // not a real function (e.g. @llvm.dbg.declare)
    }
    FunctionMetadata* FromFuncMD = LinkageToMetadata[FromFunc->getName()];
    
    if (!CallGraph.count(FromFuncMD)) {
      vector<CallEdge> edges;
      CallGraph.insert(pair<FunctionMetadata*, vector<CallEdge> >(
        FromFuncMD,
        edges
      ));
    }
    CallGraph.lookup(FromFuncMD).push_back(callEdge);
    ferrs() << FromFuncMD->LinkageName << " calls " << callEdge.ToFunc->LinkageName << (callEdge.isVirtual?" VIRTUAL":"") << (callEdge.Unknown?" UNKNOWN":"") << "\n";
  }

  Class* getOrCreateHierarchy(const DICompositeType& type) {
    const TypeMap::const_iterator typeClass = classes.find(type);
    if (typeClass != classes.end()) {
      Class * const c = typeClass->second;
      /*ferrs() << "Existing class pointer for " << type.getName()
              << " ("<< ((MDNode*)type) << ") is " << c << '\n';*/
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
    /*ferrs() << "New class pointer for " << type.getName()
            << " (" << ((MDNode*)type) << ") is " << c << '\n';*/
    foreach (Class::ClassSet, parents, i) {
      (*i)->getChildren().insert(c);
    }

    classes.insert(pair<MDNode*, Class*>((MDNode*)type, c));
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
              ConstantInt* const IsCallOnThis =
                dyn_cast<ConstantInt>(VirtualMD->getOperand(1));
              if (CanDevirt(MD, Call, IsCallOnThis->isOne())) {
                //Call->setArgOperand(
                //  0,
                //  CastInst::Create(
                //    Instruction::BitCast,
                //    Call->getArgOperand(0),
                //    MD->Func->arg_begin()->getType(),
                //    "",
                //    Call
                //  )
                //);
                Call->setCalledFunction(MD->Func);
                ferrs() << "Devirtualized:\n";
                Call->dump();
              }
            }
          }
        }
      }
    }
  }

  void UpdateLinkageToMetadata(const DISubprogram& Subprogram) {
    StringRef LinkageName = Subprogram.getLinkageName();
    if (LinkageName.empty()) {
      LinkageName = Subprogram.getName();
    }
    FunctionMetadata* MD;
    if (LinkageToMetadata.count(LinkageName)) {
      MD = LinkageToMetadata.lookup(LinkageName);
      if (!MD->Func) { 
        MD->Func = Subprogram.getFunction();
        MD->Type = Subprogram.getType(); 
      }
      if (!MD->Virtuality) {
    	  MD->Virtuality = Subprogram.getVirtuality();
    	  MD->VirtualIndex = Subprogram.getVirtualIndex();
      }
      if (!MD->ContainingType.Verify()
    		|| MD->ContainingType.getTag() != dwarf::DW_TAG_class_type)
        {
    	  MD->ContainingType = Subprogram.getContainingType();
        }
    } else {
      MD = new FunctionMetadata;
      *MD = FromSubprogram(Subprogram);
      LinkageToMetadata.GetOrCreateValue(LinkageName, MD);
    }
  }

  void SetOverridenByFor(FunctionMetadata* MD) {
    if (!MD->Virtuality || !classes.count(MD->ContainingType)) {
      return;
    }
    Class* ThisClass = classes[MD->ContainingType];
    MDSet* SimilarFuncs = GetOrCreateEquSet(MD);
    MDSet& OverridenBySet = OverriddenByMap[MD];
    foreach (MDSet, *SimilarFuncs, FuncIter) {
      FunctionMetadata* OtherMD = *FuncIter;
      if (!OtherMD->Virtuality || !classes.count(OtherMD->ContainingType)) {
        continue;
      }
      Class* OtherClass = classes[OtherMD->ContainingType];
      if (OtherMD != MD && OtherClass->isSubclassOf(ThisClass)) {
        OverridenBySet.insert(OtherMD);
        ferrs() << MD->LinkageName << " overrided by " << OtherMD->LinkageName << "\n";
      }
    }
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

  bool CanDevirt(FunctionMetadata* MD, CallInst* Call, bool IsCallOnThis) {
    return NoOverriders(MD) || PairwiseDevirt(MD, Call, IsCallOnThis); // Can devirt by type info
  }

  bool NoOverriders(FunctionMetadata* MD) const {
    if (OverriddenByMap.count(MD)) {
      const MDSet& OverriddenBy = OverriddenByMap.lookup(MD);
      return OverriddenBy.size() == 0;
    }
    return false;
  }

  bool PairwiseDevirt(FunctionMetadata* MD, CallInst* Call, bool IsCallOnThis) {
    if (!IsCallOnThis) { return false; }
    if (!OverriddenByMap.count(MD)) { return false; }
    const MDSet& OverriddenBy = OverriddenByMap.lookup(MD);

    const Function* const InFunc = Call->getParent()->getParent();

    if (!LinkageToMetadata.count(InFunc->getName())) { return false; }
    FunctionMetadata* const InFuncMD = 
      LinkageToMetadata.lookup(InFunc->getName());
    if (!InFuncMD || !classes.count(InFuncMD->ContainingType)) { return false; }
    Class* const InFuncClass = classes.lookup(InFuncMD->ContainingType);
    Class* const CalledClass = classes.lookup(MD->ContainingType);
    
    if (   !InFuncClass->isSubclassOf(CalledClass)
        && !CalledClass->isSubclassOf(InFuncClass))
      { return false; }

    foreachI (MDSet, OverriddenBy, Overrider, const_iterator) {
      const Class* const OverriderClass = 
        classes.lookup((*Overrider)->ContainingType);
      FunctionMetadata* const NewInFuncMD =
        OverriderClass->getMethod(InFuncMD->Name, InFuncMD->Type);
      if (NewInFuncMD) {
        if (NewInFuncMD == InFuncMD) { return false; }
        if (CanCall(NewInFuncMD, InFuncMD)) { return false; }
      } else {
        return false;
      }
    }
    ferrs() << "Pair-wise Devirt\n";
    return true;
  }

  bool CanCall(FunctionMetadata* From, FunctionMetadata* To) {
    MDSet Checked;
    vector<CallEdge> Workload;
    CallEdge start = {From, false, false};
    Workload.push_back(start);
    do {
      CallEdge next = Workload.back();
      Workload.pop_back();

      if (next.Unknown) { return true; }
      if (next.ToFunc == To) { return true; }
      if (Checked.count(next.ToFunc)) { continue; }
      if (next.isVirtual) {
        const MDSet& EquSet = OverriddenByMap.lookup(next.ToFunc);
        foreach (MDSet, EquSet, DoLaterMD) {
          CallEdge DoLaterEdge = {*DoLaterMD, false, false};
          Workload.push_back(DoLaterEdge);
        }
      } else {
        if (!CallGraph.count(next.ToFunc)) { return true; }
        vector<CallEdge> Edges = CallGraph[From];
        Checked.insert(next.ToFunc);
        foreach (vector<CallEdge>, Edges, Edge) {
          Workload.push_back(*Edge);
        }
      }
    } while (Workload.size());
    return false;
  }
};

char DevirtualizationPass::ID= 0;
static RegisterPass<DevirtualizationPass>X("devirt", "Devirtualize virtual function calls", false, false);
}
