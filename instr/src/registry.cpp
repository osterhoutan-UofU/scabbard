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
#include <llvm/Support/CommandLine.h>


// << ========================================================================================== >> 
// <<                                COMAND LINE OPTION REGISTRY                                 >> 
// << ========================================================================================== >> 

// << ======================== Test Pass Command Line Options Registry ========================= >> 
// command line option for the test pass
static llvm::cl::opt<bool> ScabbardTestPassOpt("scabbard-test", llvm::cl::init(false), 
                                              llvm::cl::desc("scabbard's test pas [dev only]"));

// << ======================= Scababrd Instrumenter CL Options Registry ======================== >> 
// command line option for the scabbard instrumentation pass
static llvm::cl::opt<bool> ScabbardPassOpt("scabbard", llvm::cl::init(false), 
                                            llvm::cl::desc("scabbard, a HIP based data race detection system's instrumenter for generating a trace generator"));



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
          [](PassBuilder& PB) {
            PB.registerVectorizerStartEPCallback( // can find kernel functions
                [](llvm::FunctionPassManager &FPM, OptimizationLevel Level) {
                  FPM.addPass(scabbard::instr::test::TestPassPlugin("VectorizerStart"));
                  FPM.addPass(scabbard::instr::ScabbardPassPlugin());
                });
            PB.registerScalarOptimizerLateEPCallback( // can find kernel functions
                [](llvm::FunctionPassManager &FPM, OptimizationLevel Level) {
                  FPM.addPass(scabbard::instr::test::TestPassPlugin("ScalarOptimizerLate"));
                  FPM.addPass(scabbard::instr::ScabbardPassPlugin());
                });
            PB.registerPipelineStartEPCallback( // ~can~ NOT find kernel functions (sometimes run's twice)
                [](llvm::ModulePassManager &MPM, OptimizationLevel level) {
                  MPM.addPass(scabbard::instr::test::TestPassPlugin("PipelineStart")); // 1st to run
                  MPM.addPass(scabbard::instr::ScabbardPassPlugin());
                });
            PB.registerOptimizerEarlyEPCallback( // can NOT find kernel functions (sometimes run's twice)
                [](llvm::ModulePassManager &MPM, OptimizationLevel level) {
                  MPM.addPass(scabbard::instr::test::TestPassPlugin("OptimizerEarly"));
                  MPM.addPass(scabbard::instr::ScabbardPassPlugin());
                });
            PB.registerOptimizerLastEPCallback( // ~can~ find kernel functions (sometimes run's twice)
                [](llvm::ModulePassManager &MPM, OptimizationLevel level) {
                  MPM.addPass(scabbard::instr::test::TestPassPlugin("OptimizerLast")); // last to run
                  MPM.addPass(scabbard::instr::ScabbardPassPlugin());
                });
            PB.registerPipelineParsingCallback( // can find kernal functions (conditional upon cli args)
                [](StringRef Name, llvm::FunctionPassManager &FPM,
                   ArrayRef<llvm::PassBuilder::PipelineElement>) {
                  if (Name == "scabbard-test") {
                    FPM.addPass(scabbard::instr::test::TestPassPlugin("PipelineParsing-Function"));
                    return true;
                  } else if (Name == "scabbard") {
                    FPM.addPass(scabbard::instr::ScabbardPassPlugin());
                    return true;
                  }
                  return false;
                });
            PB.registerPipelineParsingCallback( // can find kernal functions (conditional upon cli args)
                [](StringRef Name, llvm::ModulePassManager &MPM,
                   ArrayRef<llvm::PassBuilder::PipelineElement>) {
                  if (Name == "scabbard-test") {
                    MPM.addPass(scabbard::instr::test::TestPassPlugin("PipelineParsing-Module"));
                    return true;
                  } else if (Name == "scabbard") {
                    MPM.addPass(scabbard::instr::ScabbardPassPlugin());
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

