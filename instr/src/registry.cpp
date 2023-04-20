/**
 * @file registry.cpp
 * @author osterhoutan (osterhoutan@gmail.com)
 * @brief This is where the messy code for registering a pass resides
 * 
 * @version alpha 0.0.1
 * @date 2023-04-20
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include "ScabbardPass.hpp"
#include "TestPass.hpp"

#include <llvm/Pass.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Passes/PassPlugin.h>


// << ========================================================================================== >> 
// <<                                   LEGACY PASS REGISTRY                                     >> 
// << ========================================================================================== >> 

static llvm::RegisterPass<scabbard::instr::LegacyScabbard> X("scabbard", "scabbard instrumentation pass",
                                                              false, false);
static llvm::RegisterPass<scabbard::instr::test::LegacyTestPass> Y("scabbard-test", "scabbard test pass",
                                                                    false, false);




// << ========================================================================================== >> 
// <<                           NEW PASS-MANAGER PASS PLUGIN REGISTRY                            >> 
// << ========================================================================================== >> 
/* New PM Registration */
llvm::PassPluginLibraryInfo getScabbardPassPluginInfo() {
  using namespace llvm;
  return {LLVM_PLUGIN_API_VERSION, "scabbard", "alpha 0.0.1",
          [](PassBuilder &PB) {
            PB.registerVectorizerStartEPCallback(
                [](llvm::FunctionPassManager &FPM, OptimizationLevel Level) {
                  FPM.addPass(scabbard::instr::ScabbardPassPlugin());
                });
            PB.registerPipelineStartEPCallback(
                [](llvm::ModulePassManager &MPM, OptimizationLevel level) {
                  MPM.addPass(scabbard::instr::ScabbardPassPlugin());
                });
            PB.registerPipelineParsingCallback(
                [](StringRef Name, llvm::FunctionPassManager &FPM,
                   ArrayRef<llvm::PassBuilder::PipelineElement>) {
                  if (Name == "scabbard") {
                    FPM.addPass(scabbard::instr::ScabbardPassPlugin());
                    return true;
                  }
                  return false;
                });
            PB.registerVectorizerStartEPCallback(
                [](llvm::FunctionPassManager &FPM, OptimizationLevel Level) {
                  FPM.addPass(scabbard::instr::test::TestPassPlugin("VectorizerStartEP"));
                });
            PB.registerPipelineStartEPCallback(
                [](llvm::ModulePassManager &MPM, OptimizationLevel level) {
                  MPM.addPass(scabbard::instr::test::TestPassPlugin("PipelineStartEP"));
                });
            PB.registerPipelineParsingCallback(
                [](StringRef Name, llvm::FunctionPassManager &FPM,
                   ArrayRef<llvm::PassBuilder::PipelineElement>) {
                  if (Name == "scabbard-test") {
                    FPM.addPass(scabbard::instr::test::TestPassPlugin("PipelineParsing"));
                    return true;
                  }
                  return false;
                });
          }};
}
extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
  return getScabbardPassPluginInfo();
}

