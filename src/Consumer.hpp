/**
 * @file Consumer.hpp
 * @author Andrew Osterhout
 * @brief 
 * @version 0.1
 * @date 2023-03-28
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#pragma once

#include <clang/AST/AST.h>
#include <clang/AST/ASTConsumer.h>
#include <clang/Frontend/CompilerInstance.h>


namespace scabbard {


/**
 * @brief Primary AST traverser for the instrumentation process
 */
class Consumer : public clang::ASTConsumer {

  clang::CompilerInstance &Instance;

public:

  Consumer(clang::CompilerInstance &CI);

  /**
   * @brief Handler for top level declarations
   */
  bool HandleTopLevelDecl(clang::DeclGroupRef DG) override;

  /**
   * @brief Handler for the primary node type in the AST
   */
  void HandleTranslationUnit(clang::ASTContext& context) override;

};

} //namespace scabbard
