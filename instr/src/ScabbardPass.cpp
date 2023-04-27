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

#include "ScabbardPass.hpp"

#include <llvm/IR/Instructions.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/Casting.h>

namespace scabbard {
namespace instr {

  llvm::PreservedAnalyses ScabbardPassPlugin::run(llvm::Module &M, llvm::ModuleAnalysisManager &MAM) 
  { 
    const auto target = M.getTargetTriple();
    //TODO add global references to lib fields and other data
    //TODO process and store dgb metadata tables
    for (auto& f : M.getFunctionList()) {
      llvm::FunctionAnalysisManager& fam = MAM.getResult<llvm::FunctionAnalysisManagerModuleProxy>(M)
                                              .getManager();
      run(f,fam);
    }
    return llvm::PreservedAnalyses::none(); // this will have to change after transforms are performed
    // create custom implementation of Fn llvm::PreservedAnalysis::invalidate : ( -> llvm::PreservedAnalysis) to do so
  }


  llvm::PreservedAnalyses ScabbardPassPlugin::run(llvm::Function &F, llvm::FunctionAnalysisManager &FAM) 
  {
    if (F.getCallingConv() == llvm::CallingConv::AMDGPU_KERNEL) // figure out if this is a kernel function or not
      return run_device(F, FAM);
    return run_host(F, FAM); // this will have to change after transforms are performed
    // create custom implementation of Fn llvm::PreservedAnalysis::invalidate : ( -> llvm::PreservedAnalysis) to do so
  }


  llvm::PreservedAnalyses ScabbardPassPlugin::run_device(llvm::Function& F, llvm::FunctionAnalysisManager &FAM)
  {
    //TODO make any necessary additions to the function (i.e. getting thread, block, tile and stream ids)
    for (auto& bb : F.getBasicBlockList())
      for (auto& i : bb.getInstList())
        if (auto* store = llvm::dyn_cast<llvm::StoreInst>(&i)) {
          //TODO instrument store instructions to update trace 
        } else if (auto* load = llvm::dyn_cast<llvm::LoadInst>(&i)) {
          //TODO instrument load instructions
        } else if (auto* call = llvm::dyn_cast<llvm::CallInst>(&i)) {
          //TODO instrument calls to thread id, block id, etc.
        }
    return llvm::PreservedAnalyses::all();
  }

  llvm::PreservedAnalyses ScabbardPassPlugin::run_host(llvm::Function& F, llvm::FunctionAnalysisManager &FAM)
  {
    for (auto& bb : F.getBasicBlockList())
      for (auto& i : bb.getInstList())
        if (auto* store = llvm::dyn_cast<llvm::StoreInst>(&i)) {
          //TODO instrument store instructions to update trace 
        } else if (auto* load = llvm::dyn_cast<llvm::LoadInst>(&i)) {
          //TODO instrument load instructions
        } else if (auto* call = llvm::dyn_cast<llvm::CallInst>(&i)) {
          //TODO instrument calls to hip malloc, hip copy, kernel launch and stream sync
        }
    return llvm::PreservedAnalyses::all();
  }


  // char LegacyScabbard::ID = 0;

} //?namespace instr
} //?namespace scabbard

