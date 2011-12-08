//===- Devirtualize.cpp ---------------------------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Example clang plugin which simply prints the names of all the top-level decls
// in the input file.
//
//===----------------------------------------------------------------------===//

#include "clang/AST/ASTConsumer.h"
#include "clang/AST/AST.h"
#include "clang/AST/RecursiveASTVisitor.h"
#include "clang/Frontend/CompilerInstance.h"
#include "clang/Frontend/FrontendPluginRegistry.h"
#include "llvm/Support/raw_ostream.h"
using namespace clang;

namespace {

class DevirtualizeConsumer : public ASTConsumer,
                             public RecursiveASTVisitor<DevirtualizeConsumer> {
public:
  virtual void HandleTranslationUnit(ASTContext &Ctx) {
    TraverseDecl(Ctx.getTranslationUnitDecl());
  }
  bool VisitCXXMemberCallExpr(CXXMemberCallExpr *C) {
    return CheckTheCall(C);
  }
  bool VisitCXXOperatorCallExpr(CXXOperatorCallExpr *C) {
    return CheckTheCall(C);
  }
  bool CheckTheCall(CallExpr *C) {
    const MemberExpr *ME = cast<MemberExpr>(C->getCallee()->IgnoreParens());
    const CXXMethodDecl* md = dyn_cast<CXXMethodDecl>(C->getDirectCallee());
    if(md && md->isVirtual()) {
      llvm::errs() << ME->hasQualifier() << "\n";
      C->dumpAll();
    }
    return true;
  }
};

class DevirtualizeAction : public PluginASTAction {
protected:
  ASTConsumer *CreateASTConsumer(CompilerInstance &CI, llvm::StringRef) {
    return new DevirtualizeConsumer();
  }

  bool ParseArgs(const CompilerInstance &CI,
                 const std::vector<std::string>& args) {
    return true;
  }
};

}

static FrontendPluginRegistry::Add<DevirtualizeAction>
X("devirt", "Devirt it");
