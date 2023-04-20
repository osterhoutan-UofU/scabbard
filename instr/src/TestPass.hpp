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


#include <llvm/Pass.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Function.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/IR/PassManager.h>
#include <llvm/Transforms/IPO/PassManagerBuilder.h>

namespace scabbard {
namespace instr {
namespace test {
  
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
  bool runTestPass(llvm::Module& M) {
    //TODO figure out how to add code for standard instrumenting modules (probs located in libscabbard)
    // this will probably need to be done in the Umbrella or Top level header IDK if I have to do more than point to og files
    //    will probably also have to modify the LinkLibraries
    llvm::errs() << "[scabbard::test] a MODULE with the name `" << M.getModuleIdentifier() << "` was found!\n";
    return false;
  }//?END fn run : (llvm::Module& -> bool)


  /**
   * @brief \em fn \c runOnFunction : (llvm::Function& -> bool) \n
   *        The \c runOnFunction method must be implemented by your subclass to do the transformation 
   *         or analysis work of your pass. 
   *        As usual, a \c true value should be returned if the function is modified.
   * @param M \c llvm::Module& - The module being processed
   * @return \c bool - \c true if the module was modified \c false otherwise
   */
  bool runTestPass(llvm::Function& F) {
    //TODO figure out how to identify if this is a __device__ or __global__ function or not
    //TODO instrument it appropriately
    //note: I will have to use different instrumentation for when called for host vs device (can we separate the two?)
    llvm::errs() << "[scabbard::test] a FUNCTION with the name `" << F.getName() 
                  << "` and " << F.getInstructionCount() << " instructions was found!\n"
                  << "[scabbard::test]  It contains the following attributes:";
    for (auto& attr : F.getAttributes())
      llvm::errs() << "\n[scabbard::test]    - " << attr.getAsString();
    llvm::errs() << "\n[scabbard::test]\n";
    //note: I will need to use Function::getBasicBlockList() to get the contents of the function (mostly just regions of instruction with conditionals and loops but maybe some symbol table stuff too)
    return false;
  }//?END fn run : (llvm::Function& -> bool)



  struct LegacyTestPass : public llvm::FunctionPass {
    static char ID;
  public:
    LegacyTestPass() : FunctionPass(ID) {}
    bool doInitialization(llvm::Module& M) override { return runTestPass(M); }
    bool runOnFunction(llvm::Function& F) override { return runTestPass(F); }
  };//?END class LegacyTestPass

  char LegacyTestPass::ID = 0;

  struct TestPassPlugin : llvm::PassInfoMixin<TestPassPlugin> {
    const std::string origin;
    TestPassPlugin(const std::string& origin_) : origin(origin_) {}
    llvm::PreservedAnalyses run(llvm::Function &F, llvm::FunctionAnalysisManager &) {
      llvm::errs() << "[scabbard::test] Module Pass was run from: "<< origin <<"\n";
      if (!runTestPass(F))
        return llvm::PreservedAnalyses::all();
      return llvm::PreservedAnalyses::none();
    }
    llvm::PreservedAnalyses run(llvm::Module &M, llvm::ModuleAnalysisManager &) {
      llvm::errs() << "[scabbard::test] Module Pass was run from: `"<< origin <<"`\n";
      if (!runTestPass(M))
        return llvm::PreservedAnalyses::all();
      return llvm::PreservedAnalyses::none();
    }
  };//?END class TestPassPlugin

}//?namespace test
}//?namespace instr
}//?namespace scabbard