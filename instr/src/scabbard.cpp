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

#include <llvm/Pass.h>
#include <llvm/IR/Function.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/IR/LegacyPassManager.h> //TODO swap this to the new pass manager
#include <llvm/Transforms/IPO/PassManagerBuilder.h>


namespace scabbard {
namespace instr {

  class TestPass : public llvm::FunctionPass {

  public:
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
    bool doInitialization(llvm::Module& M) override {
      //TODO figure out how to add code for standard instrumenting modules (probs located in libscabbard)
      // this will probably need to be done in the Umbrella or Top level header IDK if I have to do more than point to og files
      //    will probably also have to modify the LinkLibraries
      llvm::errs() << "[scabbard::test::note] a MODULE with the name `" << M.getFullModuleName() << "` was found!\n";
    }//?END fn doInitialization : (llvm::Module& -> bool)


    /**
     * @brief \em fn \c runOnFunction : (llvm::Function& -> bool) \n
     *        The \c runOnFunction method must be implemented by your subclass to do the transformation 
     *         or analysis work of your pass. 
     *        As usual, a \c true value should be returned if the function is modified.
     * @param M \c llvm::Module& - The module being processed
     * @return \c bool - \c true if the module was modified \c false otherwise
     */
    bool runOnFunction(llvm::Function& F) override {
      //TODO figure out how to identify if this is a __device__ or __global__ function or not
      //TODO instrument it appropriately
      //note: I will have to use different instrumentation for when called for host vs device (can we separate the two?)
      llvm::errs() << "[scabbard::test::note] a FUNCTION with the name `" << F.getName() 
                   << "` and " << F.getInstructionCount() << " instructions was found!\n";
      //note: I will need to use Function::getBasicBlockList() to get the contents of the function (mostly just regions of instruction with conditionals and loops but maybe some symbol table stuff too)
      auto& contents = F.getBasicBlockList();

    }//?END fn runOnFunction : (llvm::Function& -> bool)

  };//?END class TestPass

} //?namespace instr
} //?namespace scabbard



// << ========================================================================================== >> 
// <<                                       PASS REGISTRY                                        >> 
// << ========================================================================================== >> 
//TODO register the pass with the pass manager

// << ========================================================================================== >> 
// <<                                      PLUGIN REGISTRY                                       >> 
// << ========================================================================================== >> 
//TODO add stuff to make this a hipcc/clang plugin too
