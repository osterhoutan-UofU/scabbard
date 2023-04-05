/**
 * @file scabbard.cpp
 * @author Andrew Osterhout
 * @brief 
 * @version 0.1
 * @date 2023-03-28
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include <clang/AST/ASTConsumer.h>
#include <clang/Frontend/FrontendPluginRegistry.h>
#include <clang/Frontend/CompilerInstance.h>
#include <llvm/Support/raw_ostream.h>

#include "Consumer.hpp"


namespace scabbard {

/**
 * @brief Primary instrumenting agent  
 */
class Action : public clang::PluginASTAction {

protected:

  /**
   * @brief Return the Actual instrumenting tool to clang for usage
   */
  std::unique_ptr<clang::ASTConsumer> CreateASTConsumer(clang::CompilerInstance &CI, llvm::StringRef) override 
  {
    return std::make_unique<Consumer>(CI);
  }

  /**
   * @brief Scabbard's argument parser
   */
  bool ParseArgs(const clang::CompilerInstance &CI, const std::vector<std::string> &args) override 
  {
    using namespace clang;
    //TODO make this work for scabbard
    for (unsigned i = 0, e = args.size(); i != e; ++i) {
      llvm::errs() << "PrintFunctionNames arg = " << args[i] << "\n";

      // Example error handling.
      DiagnosticsEngine &D = CI.getDiagnostics();
      // if (args[i] == "-an-error") {
      //   unsigned DiagID = D.getCustomDiagID(DiagnosticsEngine::Error,
      //                                       "invalid argument '%0'");
      //   D.Report(DiagID) << args[i];
      //   return false;
      // } else if (args[i] == "-parse-template") {
      //   if (i + 1 >= e) {
      //     D.Report(D.getCustomDiagID(DiagnosticsEngine::Error,
      //                                "missing -parse-template argument"));
      //     return false;
      //   }
      //   ++i;
      //   ParsedTemplates.insert(args[i]);
      // }
    }
    if (!args.empty() && args[0] == "help")
      PrintHelp(llvm::errs());

    return true;
  }

  /**
   * @brief Called when help doc for the plugin is requested from the command line
   */
  void PrintHelp(llvm::raw_ostream& ros) {
    ros << "Help for PrintFunctionNames plugin goes here\n";
  }
};


} //namespace scabbard



// << ========================================================================================== >> 
// <<                                      PLUGIN REGISTRY                                       >> 
// << ========================================================================================== >> 

static clang::FrontendPluginRegistry::Add<scabbard::Action> X("scabbard", "have scabbard perform sword style instrumenting on a source file");
