/**
 * @file ScabbardPostPass.cpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief Link time pass manager for inserting references to external library, 
 *        that just Creates the scabbard module ctor and makes whatever final changes necessary
 * @version alpha 0.0.1
 * @date 2023-05-22
 *
 * @copyright Copyright (c) 2023
 *
 */

#include "ScabbardPostPass.hpp"

#include <scabbard/instr-names.def>

#include <llvm/Pass.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/PassManager.h>
#include <llvm/Linker/Linker.h>
#include <llvm/Bitcode/BitcodeReader.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/ADT/Triple.h>
#include <llvm/Support/Debug.h>
#include <llvm/Support/MemoryBuffer.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/Transforms/Utils/ModuleUtils.h>

#include <cstdlib>
#include <algorithm>

#define DEBUG_TYPE "scabbard"

namespace scabbard {
  namespace instr {


    ScabbardPostPass::ScabbardPostPass(MetadataHandler& metadata_)
      : metadata(metadata_)
    {}



    llvm::PreservedAnalyses ScabbardPostPass::run(llvm::Module &M, llvm::ModuleAnalysisManager &MAM)
    {
      const llvm::Triple target(M.getTargetTriple());
      // archBit = ((target.isArch64Bit()) ? 64 //ASSUMING for now this will only be used on 64 bit machines
      //             : ((target.isArch32Bit()) ? 32 
      //               : (target.isArch16Bit()) ? 16 : 0))
      if (target.isAMDGPU()) {  // checks for both amdgcn & r600 arch(s) (might need to restrict this to just amdgcn with `isAMDGCN()`)
        run_device(M, MAM);    //                                        To support hip on Nvidia GPUs we might need to also run this for nvptx arch(s) (this might be the same as supporting CUDA though)
        return llvm::PreservedAnalyses::all();
      } else {
        run_host(M, MAM);
        return llvm::PreservedAnalyses::none();
      }
    }

    void ScabbardPostPass::run_device(llvm::Module& M, llvm::ModuleAnalysisManager& MAM)
    {}

    void ScabbardPostPass::run_host(llvm::Module& M, llvm::ModuleAnalysisManager& MAM)
    {
      instrCallbacks_host(M, MAM);
      instr_module_ctor_host(M, MAM);
    }


    void ScabbardPostPass::instr_module_ctor_host(llvm::Module& M, llvm::ModuleAnalysisManager &MAM)
    {
      auto BB = llvm::BasicBlock::Create(M.getContext(), "metadata_registry", host.module_ctor);
      llvm::IRBuilder<llvm::ConstantFolder,llvm::IRBuilderDefaultInserter> IRB(BB);
      auto* int64_ty = llvm::IntegerType::get(M.getContext(), 64u);
      // handle hip stuff
      llvm::Value* gpuBin = nullptr;
      auto gpuBinGlobal = M.getGlobalVariable("__hip_gpubin_handle");
      if (gpuBinGlobal != nullptr)
        gpuBin = IRB.CreateLoad(gpuBinGlobal->getType(), gpuBinGlobal, "gpuBin");
      // insert the registry stuff
      for (const auto& mde_p : metadata.getMetadataMap()) {
        const auto& mde = mde_p.second;
        if (mde.in_modules.contains(M.getModuleIdentifier())) { // if it was used in this module 
          auto str_var = IRB.CreateGlobalStringPtr(mde.src_path, mde.get_str_var_name());
          const auto regCall = IRB.CreateCall(
              host.metadata_register$src,
              llvm::ArrayRef<llvm::Value*>(std::array<llvm::Value*, 1>{str_var})
            );
          IRB.CreateStore(regCall, M.getOrInsertGlobal(mde.get_var_name(false), int64_ty));
          if (gpuBin != nullptr && mde.on_device) {
            auto gpu_var = M.getOrInsertGlobal(mde.get_var_name(true), int64_ty);
            auto gpu_var_name_var = IRB.CreateGlobalStringPtr(mde.get_var_name(true));
            IRB.CreateCall(
                M.getFunction("__hipRegisterVar"),
                llvm::ArrayRef<llvm::Value*>(std::array<llvm::Value*,8>{
                  gpuBin,
                  llvm::ConstantExpr::getBitCast(gpu_var, IRB.getInt8PtrTy()),
                  llvm::ConstantExpr::getInBoundsGetElementPtr(gpu_var_name_var->getType(), gpu_var_name_var, IRB.getInt64(0u)),
                  llvm::ConstantExpr::getInBoundsGetElementPtr(gpu_var_name_var->getType(), gpu_var_name_var, IRB.getInt64(0u)),
                  IRB.getInt32(0u),
                  IRB.getInt64(8u),
                  IRB.getInt32(0u),
                  IRB.getInt32(0u),
                })
              );
            IRB.CreateStore(regCall, gpu_var);
          }
        }
      }
      IRB.CreateRetVoid();
      // register the ctor with a "low priority" so it goes after all other ctors
      llvm::appendToGlobalCtors(M, host.module_ctor, UINT32_MAX);
      LLVM_DEBUG(host.module_ctor->print(llvm::errs()));
    }

    void ScabbardPostPass::instrCallbacks_host(llvm::Module& M, llvm::ModuleAnalysisManager& MAM)
    {
      host.metadata_register$src = M.getOrInsertFunction(
          host.metadata_register$src_name,
          llvm::FunctionType::get(
              llvm::IntegerType::get(M.getContext(), 64u),
              llvm::ArrayRef<llvm::Type*>(std::vector<llvm::Type*>{
                  // llvm::IntegerType::get(M.getContext(), 64u),
                  llvm::PointerType::get(llvm::IntegerType::get(M.getContext(), 8u), 0u)
                }),
              false
            )
        );
      host.metadata_unregister$src = M.getOrInsertFunction(
          host.metadata_unregister$src_name,
          llvm::FunctionType::get(
              llvm::Type::getVoidTy(M.getContext()),
              llvm::ArrayRef<llvm::Type*>(std::vector<llvm::Type*>{
                  llvm::IntegerType::get(M.getContext(), 64u)
                }),
              false
            )
        );

      host.module_ctor = llvm::dyn_cast_or_null<llvm::Function>(M.getOrInsertFunction(
          host.module_ctor_name,
          llvm::FunctionType::get(
              llvm::Type::getVoidTy(M.getContext()),
              llvm::ArrayRef<llvm::Type*>(std::array<llvm::Type*,0>{}),
              false
            )
        ).getCallee());
      // host.module_dtor = llvm::dyn_cast_or_null<llvm::Function>(M.getOrInsertFunction(
      //     host.module_dtor_name,
      //     llvm::FunctionType::get(
      //         llvm::Type::getVoidTy(M.getContext()),
      //         llvm::ArrayRef<llvm::Type*>(std::array<llvm::Type*,0>{}),
      //         false
      //       )
      //   ).getCallee());
    }




  } //?namespace instr
} //?namespace scabbard