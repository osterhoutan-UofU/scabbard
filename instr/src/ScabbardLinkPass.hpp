/**
 * @file ScabbardLinkPass.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief Link time pass manager for inserting references to external library
 * @version alpha 0.0.1
 * @date 2023-05-22
 *
 * @copyright Copyright (c) 2023
 *
 */

#include <llvm/Pass.h> 
#include <llvm/IR/Module.h>
#include <llvm/IR/PassManager.h>
#include <llvm/Transforms/IPO/PassManagerBuilder.h>

namespace scabbard {
  namespace instr {

    struct ScabbardLinkPass : public llvm::PassInfoMixin<ScabbardLinkPass> {

      llvm::PreservedAnalyses run(llvm::Module &M, llvm::ModuleAnalysisManager &MAM);

    };

  } //?namespace instr
} //?namespace scabbard