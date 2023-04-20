/**
 * @file scabbard.cpp
 * @author Andrew Osterhout
 * @brief 
 * 
 * @version alpha 0.0.1
 * @date 2023-03-28
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


  /**
   * @brief \em fn \c run : (llvm::Module& -> bool) \n
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
  bool runScabbardPass(llvm::Module& M);

  /**
     * @brief \em fn \c run : (llvm::Function& -> bool) \n
    *        The \c runOnFunction method must be implemented by your subclass to do the transformation 
    *         or analysis work of your pass. 
    *        As usual, a \c true value should be returned if the function is modified.
    * @param M \c llvm::Module& - The module being processed
    * @return \c bool - \c true if the module was modified \c false otherwise
    */
  bool runScabbardPass(llvm::Function& F);



  struct LegacyScabbard : public llvm::FunctionPass {
    static char ID;
  public:
    LegacyScabbard() : FunctionPass(ID) {}
    bool doInitialization(llvm::Module& M) override { return runScabbardPass(M); }
    bool runOnFunction(llvm::Function& F) override { return runScabbardPass(F); }
  };//?END class LegacyScabbard

  struct ScabbardPassPlugin : llvm::PassInfoMixin<ScabbardPassPlugin> {
    llvm::PreservedAnalyses run(llvm::Function &F, llvm::FunctionAnalysisManager &) {
      if (!runScabbardPass(F))
        return llvm::PreservedAnalyses::all();
      return llvm::PreservedAnalyses::none();
    }
    llvm::PreservedAnalyses run(llvm::Module &M, llvm::ModuleAnalysisManager &) {
      if (!runScabbardPass(M))
        return llvm::PreservedAnalyses::all();
      return llvm::PreservedAnalyses::none();
    }
  };//?END class ScabbardPassPlugin

} //?namespace instr
} //?namespace scabbard

