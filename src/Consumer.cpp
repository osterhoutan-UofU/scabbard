/**
 * @file Consumer.cpp
 * @author Andrew Osterhout
 * @brief 
 * @version 0.1
 * @date 2023-03-29
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include "Consumer.hpp"



#include <clang/AST/RecursiveASTVisitor.h>
#include <clang/AST/EvaluatedExprVisitor.h>
#include <clang/AST/Attr.h>
#include <clang/Sema/Sema.h>

namespace scabbard {

  Consumer::Consumer(clang::CompilerInstance &CI)
    : Instance(Instance)
  {}



  bool Consumer::HandleTopLevelDecl(clang::DeclGroupRef DG)
  {
    //TODO
  }



  void Consumer::HandleTranslationUnit(clang::ASTContext& context)
  {
    //TODO
  }

} //namespace scabbard
