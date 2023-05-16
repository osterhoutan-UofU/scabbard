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
#include <llvm/ADT/Triple.h>

namespace scabbard {
namespace instr {

  // << ========================================================================================== >> 
  // <<                                       MODULE STUFF                                         >> 
  // << ========================================================================================== >> 

  llvm::PreservedAnalyses ScabbardPassPlugin::run(llvm::Module &M, llvm::ModuleAnalysisManager &MAM) 
  { 
    const llvm::Triple target(M.getTargetTriple());
    if (target.isAMDGPU())  // checks for both amdgcn & r600 arch(s) (might need to restrict this to just amdgcn with `isAMDGCN()`)
      run_device(M,MAM);    //                                        To support hip on Nvidia GPUs we might need to also run this for nvptx arch(s) (this might be the same as supporting CUDA though)
    else
      run_host(M,MAM);
    //TODO process analysis invalidations and return the Preserved analysis of all changes
    return llvm::PreservedAnalyses::none(); // this will have to change after transforms are performed
    // create custom implementation of Fn llvm::PreservedAnalysis::invalidate : ( -> llvm::PreservedAnalysis) to do so
  }

  void ScabbardPassPlugin::run_device(llvm::Module& M, llvm::ModuleAnalysisManager &MAM)
  {
    //TODO make any necessary additions to the Module (i.e.inserting globals and linking references)
    //TODO process and store dgb metadata tables
    llvm::FunctionAnalysisManager& fam = MAM.getResult<llvm::FunctionAnalysisManagerModuleProxy>(M)
                                              .getManager();
    if (const auto* ctor = llvm::dyn_cast<llvm::Function>(M.getFunction("__hip_module_ctor"))) {
        run_hip_ctor(*ctor,fam);
    }
    for (auto& f : M.getFunctionList())
      if (f.getName() != "__hip_module_ctor")
        run_device(f,fam);
  }

  void ScabbardPassPlugin::run_host(llvm::Module& M, llvm::ModuleAnalysisManager &MAM)
  {
    //TODO make any necessary additions to the Module (i.e.inserting globals and linking references)
    //TODO process and store dgb metadata tables
    for (auto& f : M.getFunctionList()) {
      llvm::FunctionAnalysisManager& fam = MAM.getResult<llvm::FunctionAnalysisManagerModuleProxy>(M)
                                              .getManager();
      run_host(f,fam);
    }
  }



  // << ========================================================================================== >> 
  // <<                                      FUNCTION STUFF                                        >> 
  // << ========================================================================================== >> 

  llvm::PreservedAnalyses ScabbardPassPlugin::run(llvm::Function &F, llvm::FunctionAnalysisManager &FAM) 
  {
    if (F.getCallingConv() == llvm::CallingConv::AMDGPU_KERNEL) // figure out if this is a kernel function or not
      return run_device(F, FAM);
    return run_host(F, FAM); // this will have to change after transforms are performed
    // create custom implementation of Fn llvm::PreservedAnalysis::invalidate : ( -> llvm::PreservedAnalysis) to do so
  }


  llvm::PreservedAnalyses ScabbardPassPlugin::run_hip_ctor(const llvm::Function& F, const llvm::FunctionAnalysisManager &FAM)
  {
    for (const auto& bb : F.getBasicBlockList())
      for (const auto& i : bb.getInstList())
        if (const auto* call = llvm::dyn_cast<llvm::CallInst>(&i))
          if (call->getName() == "__hipRegisterVar") {
            if (auto* global = llvm::dyn_cast<llvm::GlobalVariable>(call->getArgOperand(2))) {
              globalDeviceMem.addNodeToList(global);
            } else {
              llvm::errs() << "\n[scabbard::WARNING] Consistency Error, `__hip_module_ctor` contains a call to `__hipRegisterVar` that is not a global variable\n\n";
            }
          } else if (call->getName() == "__hipRegisterManagedVar") {
            if (auto* global = llvm::dyn_cast<llvm::GlobalVariable>(call->getArgOperand(2))) {
              globalManagedMem.addNodeToList(global);
            } else {
              llvm::errs() << "\n[scabbard::WARNING] Consistency Error, `__hip_module_ctor` contains a call to `__hipRegisterManagedVar` that is not a global variable\n\n";
            }
          }
  }


  llvm::PreservedAnalyses ScabbardPassPlugin::run_device(llvm::Function& F, llvm::FunctionAnalysisManager &FAM)
  {
    //TODO make any necessary additions to the function (i.e. getting thread, block, tile and stream ids)
    moduleType = ModuleType::DEVICE;
    for (auto& bb : F.getBasicBlockList())
      for (auto& i : bb.getInstList())
        if (auto* store = llvm::dyn_cast<llvm::StoreInst>(&i)) {
          //TODO instrument store instructions to update trace 
        } else if (auto* load = llvm::dyn_cast<llvm::LoadInst>(&i)) {
          //TODO instrument load instructions
        } else if (auto* call = llvm::dyn_cast<llvm::CallInst>(&i)) {
          //TODO instrument calls to thread id, block id, etc.
        } else if (auto atomic = llvm::dyn_cast<llvm::AtomicRMWInst>(&i)) {
          //TODO instrument atomic readwrite instructions
        }
    moduleType = ModuleType::UNKNOWN_MODULE;
    return llvm::PreservedAnalyses::all();
  }

  llvm::PreservedAnalyses ScabbardPassPlugin::run_host(llvm::Function& F, llvm::FunctionAnalysisManager &FAM)
  {
    moduleType = ModuleType::DEVICE;
    for (auto& bb : F.getBasicBlockList())
      for (auto& i : bb.getInstList())
        if (auto* store = llvm::dyn_cast<llvm::StoreInst>(&i)) {
          //TODO instrument store instructions to update trace 
        } else if (auto* load = llvm::dyn_cast<llvm::LoadInst>(&i)) {
          //TODO instrument load instructions
        } else if (auto* call = llvm::dyn_cast<llvm::CallInst>(&i)) {
          //TODO instrument calls to hip malloc, hip copy, kernel launch and stream sync
        } else if (auto atomic = llvm::dyn_cast<llvm::AtomicRMWInst>(&i)) {
          //TODO instrument atomic readwrite instructions
        }
    moduleType = ModuleType::UNKNOWN_MODULE;
    return llvm::PreservedAnalyses::all();
  }


  
  // char LegacyScabbard::ID = 0;

} //?namespace instr
} //?namespace scabbard

