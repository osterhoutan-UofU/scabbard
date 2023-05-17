/**
 * @file TestPass.hpp
 * @author osterhoutan (osterhoutan@gmail.com)
 * @brief Header file for the test pass
 * 
 * @version alpha 0.0.1
 * @date 2023-04-20
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include "Util.hpp"

#include <llvm/Pass.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/Casting.h>
#include <llvm/IR/PassManager.h>
#include <llvm/Transforms/IPO/PassManagerBuilder.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Passes/PassPlugin.h>
#include <llvm/Support/CommandLine.h>

namespace scabbard {
namespace instr {
namespace test { 

  bool runTestPass(llvm::Function& F, const std::string& origin);

  /**
   * @brief \em fn \c doInitialization : (llvm::Module& -> bool) \n
   *        The \c doInitialization method is allowed to do most of the things that \c FunctionPasses
   *         are not allowed to do. 
   *        They can add and remove functions, 
   *         get pointers to functions, \em etc. 
   *        The \c doInitialization method is designed to do simple initialization type of stuff that
   *         does not depend on the functions being processed. 
   *        The \c doInitialization method call is not scheduled to overlap with any other pass executions 
   *         (thus it should be very fast).
   * @param M \c llvm::Module& - The module being processed
   * @return \c bool - \c true if the module was modified \c false otherwise
   */
  bool runTestPass(llvm::Module& M, const std::string& origin) {
    //TODO figure out how to add code for standard instrumenting modules (probs located in libscabbard)
    // this will probably need to be done in the Umbrella or Top level header IDK if I have to do more than point to og files
    //    will probably also have to modify the LinkLibraries
    const auto delta = std::chrono::high_resolution_clock::now() - _START;
    llvm::errs() << "[scabbard::test] Module Pass was run from: `"<< origin <<"` @ " << delta << "\n"
                    "[scabbard::test]   a MODULE with the name `" << M.getModuleIdentifier() << "` was found!\n"
                    "[scabbard::test]   a MODULE targeting: `" << M.getTargetTriple() << "` was found!\n"
                    "[scabbard::test]\n";
    bool touched = false;
    for (auto& f : M.getFunctionList())
      touched |= runTestPass(f,origin + " (M->F)");
    return touched;
  }//?END fn run : (llvm::Module& -> bool)


  /**
   * @brief \em fn \c runOnFunction : (llvm::Function& -> bool) \n
   *        The \c runOnFunction method must be implemented by your subclass to do the transformation 
   *         or analysis work of your pass. 
   *        As usual, a \c true value should be returned if the function is modified.
   * @param F \c llvm::Function& - The module being processed
   * @return \c bool - \c true if the module was modified \c false otherwise
   */
  bool runTestPass(llvm::Function& F, const std::string& origin) {
    //TODO figure out how to identify if this is a __device__ or __global__ function or not
    //TODO instrument it appropriately
    //note: I will have to use different instrumentation for when called for host vs device (can we separate the two?)
    if (F.getCallingConv() != llvm::CallingConv::AMDGPU_KERNEL) 
      return false;
    const auto delta = std::chrono::high_resolution_clock::now() - _START;
    llvm::errs() << "[scabbard::test] Function Pass was run from: "<< origin <<" @ "<< delta << "\n"
                    "[scabbard::test]   a FUNCTION with the name `" << std::string(F.getName()) 
                      << "` and " << F.getInstructionCount() << " instructions was found!\n"
                    "[scabbard::test]     it has a CallingConvID of: `" << F.getCallingConv() << "`\n";
    for (const auto& bb : F.getBasicBlockList())
      for (const auto& i : bb.getInstList()) 
        if (const auto* call = llvm::dyn_cast<const llvm::CallInst>(&i)) {
          llvm::errs() << "[scabbard::test]  `call` instruction found!\n"
                          "[scabbard::test]    repr: `";
          i.print(llvm::errs());
          llvm::errs() << "`\n";
        } else if (const auto* fence = llvm::dyn_cast<const llvm::FenceInst>(&i)) {
          llvm::errs() << "[scabbard::test]  `fence` instruction found!\n"
                          "[scabbard::test]    repr: `";
                          
          i.print(llvm::errs());
          llvm::errs() << "`\n";
        } else if (const auto* store = llvm::dyn_cast<const llvm::StoreInst>(&i)) {
          llvm::errs() << "[scabbard::test]  `store` instruction found!\n"
                          "[scabbard::test]    repr: `";
                          
          i.print(llvm::errs());
          llvm::errs() << "`\n";
        } else if (const auto* load = llvm::dyn_cast<const llvm::LoadInst>(&i)) {
          llvm::errs() << "[scabbard::test]  `load` instruction found!\n"
                          "[scabbard::test]    repr: `";
                          
          i.print(llvm::errs());
          llvm::errs() << "`\n";
        } else if (const auto* atomic = llvm::dyn_cast<const llvm::AtomicRMWInst>(&i)) {
          llvm::errs() << "[scabbard::test]  ATOMIC instruction found!\n"
                          "[scabbard::test]    repr: `";
                          
          i.print(llvm::errs());
          llvm::errs() << "`\n";
        } else if (const auto* phi = llvm::dyn_cast<llvm::PHINode>(&i)) {
          llvm::errs() << "[scabbard::test]  PHI instruction found!\n"
                          "[scabbard::test]    repr: `";
                          
          i.print(llvm::errs());
          llvm::errs() << "`\n"
                          "[scabbard::test]    ops: [";
          std::string sep1 = "\n[scabbard::test]        ";
          for (const auto& U : phi->incoming_values()) {
            llvm::errs() << sep1 << "- value: `";
            U.get()->print(llvm::errs());
            llvm::errs() << '`';
            if (U.get()->getNumUses()) {
              llvm::errs() << sep1 << "  uses: [";
              std::string sep2 = sep1 + "      - `";
              for (const auto& V : U.get()->users()) {
                llvm::errs() << sep2;
                V->print(llvm::errs());
                sep2 = "`" + sep2;
              }
              llvm::errs() << '`' << sep1 << "    ]";
            }
          }
          llvm::errs() << "\n[scabbard::test]        ]\n";
        }
    llvm::errs() << "[scabbard::test]\n";
    //note: I will need to use Function::getBasicBlockList() to get the contents of the function (mostly just regions of instruction with conditionals and loops but maybe some symbol table stuff too)
    return false;
  }//?END fn run : (llvm::Function& -> bool)



  struct LegacyTestPass : public llvm::FunctionPass {
    static char ID;
    llvm::FunctionAnalysisManager FAM;
    llvm::ModuleAnalysisManager MAM;
  public:
    LegacyTestPass() : FunctionPass(ID) {}
    bool doInitialization(llvm::Module& M) override { return runTestPass(M, "legacy"); }
    bool runOnFunction(llvm::Function& F) override { return runTestPass(F,"legacy"); }
  };//?END class LegacyTestPass

  char LegacyTestPass::ID = 0;

  struct TestPassPlugin : llvm::PassInfoMixin<TestPassPlugin> {
    const std::string origin;
    TestPassPlugin(const std::string& origin_) : origin(origin_) {}
    llvm::PreservedAnalyses run(llvm::Function &F, llvm::FunctionAnalysisManager &FAM) {
      if (!runTestPass(F,origin))
        return llvm::PreservedAnalyses::all();
      return llvm::PreservedAnalyses::none();
    }
    llvm::PreservedAnalyses run(llvm::Module &M, llvm::ModuleAnalysisManager &MAM) {
      if (!runTestPass(M, origin)) {
        return llvm::PreservedAnalyses::all();
      }
      return llvm::PreservedAnalyses::none();
    }
  };//?END class TestPassPlugin


}//?namespace test
}//?namespace instr
}//?namespace scabbard

// << ========================================================================================== >> 
// <<                                   PASS PLUGIN REGISTRY                                     >> 
// << ========================================================================================== >> 

// static llvm::cl::opt<bool> ScabbardTestPassOpt("scabbard-test", llvm::cl::init(false), 
//                                               llvm::cl::desc("scabbard's test pas [dev only]"));

static llvm::RegisterPass<scabbard::instr::test::LegacyTestPass> Y("scabbard-test-leg", "scabbard test pass",
                                                                    false, false);

/* New PM Registration */
llvm::PassPluginLibraryInfo getTestPassPluginInfo() {
  using namespace llvm;
  return {LLVM_PLUGIN_API_VERSION, "scabbard-test", "alpha 0.0.2",
          [](PassBuilder& PB) {
            // PB.registerVectorizerStartEPCallback( // can find kernel functions
            //     [](llvm::FunctionPassManager &FPM, OptimizationLevel Level) {
            //       FPM.addPass(scabbard::instr::test::TestPassPlugin("VectorizerStart"));
            //     });
            // PB.registerScalarOptimizerLateEPCallback( // can find kernel functions
            //     [](llvm::FunctionPassManager &FPM, OptimizationLevel Level) {
            //       FPM.addPass(scabbard::instr::test::TestPassPlugin("ScalarOptimizerLate"));
            //     });
            // PB.registerPipelineStartEPCallback( // ~can~ NOT find kernel functions (sometimes run's twice)
            //     [](llvm::ModulePassManager &MPM, OptimizationLevel level) {
            //       MPM.addPass(scabbard::instr::test::TestPassPlugin("PipelineStart")); // 1st to run
            //     });
            // PB.registerOptimizerEarlyEPCallback( // can NOT find kernel functions (sometimes run's twice)
            //     [](llvm::ModulePassManager &MPM, OptimizationLevel level) {
            //       MPM.addPass(scabbard::instr::test::TestPassPlugin("OptimizerEarly"));
            //     });
            PB.registerOptimizerLastEPCallback( // ~can~ find kernel functions (sometimes run's twice)
                [](llvm::ModulePassManager &MPM, OptimizationLevel level) {
                  MPM.addPass(scabbard::instr::test::TestPassPlugin("OptimizerLast")); // last to run
                });
            // PB.registerPipelineParsingCallback( // can find kernal functions (conditional upon cli args)
            //     [](StringRef Name, llvm::FunctionPassManager &FPM,
            //        ArrayRef<llvm::PassBuilder::PipelineElement>) {
            //       if (Name == "scabbard-test") {
            //         FPM.addPass(scabbard::instr::test::TestPassPlugin("PipelineParsing-Function"));
            //         return true;
            //       }
            //       return false;
            //     });
            PB.registerPipelineParsingCallback( // can find kernal functions (conditional upon cli args)
                [](StringRef Name, llvm::ModulePassManager &MPM,
                   ArrayRef<llvm::PassBuilder::PipelineElement>) {
                  if (Name == "scabbard-test") {
                    MPM.addPass(scabbard::instr::test::TestPassPlugin("PipelineParsing-Module"));
                    return true;
                  }
                  return false;
                });
          }};
}
extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
  return getTestPassPluginInfo();
}



