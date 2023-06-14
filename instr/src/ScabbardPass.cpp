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
#include <llvm/ADT/Triple.h>
#include <llvm/Support/Debug.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/Casting.h>
#include <llvm/Support/DynamicLibrary.h>
#include <llvm/Linker/IRMover.h>
#include <llvm/Linker/Linker.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Metadata.h>

#define DEBUG_TYPE "scabbard"

namespace scabbard {
  namespace instr {


    // ScabbardPassPlugin::ScabbardPassPlugin() {}

    // ScabbardPassPlugin::ScabbardPassPlugin(const std::string& InstrLibLoc)
    // {
    //   llvm::Bitecode
    // }


    // << ========================================================================================== >> 
    // <<                                       MODULE STUFF                                         >> 
    // << ========================================================================================== >> 

    llvm::PreservedAnalyses ScabbardPassPlugin::run(llvm::Module& M, llvm::ModuleAnalysisManager& MAM)
    {
      source_loc = M.getSourceFileName();
      const llvm::Triple target(M.getTargetTriple());
      if (target.isAMDGPU())  // checks for both amdgcn & r600 arch(s) (might need to restrict this to just amdgcn with `isAMDGCN()`)
        run_device(M, MAM);    //                                        To support hip on Nvidia GPUs we might need to also run this for nvptx arch(s) (this might be the same as supporting CUDA though)
      else
        run_host(M, MAM);
      //TODO process analysis invalidations and return the Preserved analysis of all changes
      return llvm::PreservedAnalyses::none(); // this will have to change after transforms are performed
      // create custom implementation of Fn llvm::PreservedAnalysis::invalidate : ( -> llvm::PreservedAnalysis) to do so
    }

    // << ======================================== Device ========================================== >> 

    void ScabbardPassPlugin::run_device(llvm::Module& M, llvm::ModuleAnalysisManager& MAM)
    {
      instrCallbacks_device(M, MAM);
      //TODO process and store dgb metadata tables (or skip this and just read directly from binary latter)
      llvm::FunctionAnalysisManager& fam = MAM.getResult<llvm::FunctionAnalysisManagerModuleProxy>(M)
        .getManager();
      DepTraceDevice dt(M);
      for (auto& f : M.getFunctionList())
        if (f.getName() != "__hip_module_ctor")
          run_device(f, fam, dt);
    }

    void ScabbardPassPlugin::instrCallbacks_device(llvm::Module& M, llvm::ModuleAnalysisManager& MAM)
    {
      device.trace_append$mem = llvm::Function::Create(
        llvm::FunctionType::get(
          llvm::Type::getVoidTy(M.getContext()),
          llvm::ArrayRef<llvm::Type*>(std::vector<llvm::Type*>{
        llvm::IntegerType::get(M.getContext(), sizeof(InstrData) * 8),
              llvm::PointerType::get(M.getContext(), 1u), //WARN: This constant 1u might need to be dynamicly decided for kernel modules
              llvm::Type::getMetadataTy(M.getContext())
          }),
          false
        ),
        llvm::GlobalValue::LinkageTypes::AvailableExternallyLinkage,
        device.trace_append$mem_name,  //"scabbard::trace::device.trace_append$mem",
        M
      );
    }

    // << ========================================= Host =========================================== >> 

    void ScabbardPassPlugin::run_host(llvm::Module& M, llvm::ModuleAnalysisManager& MAM)
    {
      //TODO make any necessary additions to the Module (i.e.inserting globals and linking references)
      instrCallbacks_host(M, MAM);
      //TODO process and store dgb metadata tables (or skip this and just read directly from binary latter)
      llvm::FunctionAnalysisManager& fam = MAM.getResult<llvm::FunctionAnalysisManagerModuleProxy>(M)
        .getManager();
      // instrument if module contains main
      if (auto f = M.getFunction("main"))
        instr_mainFunc_host(*f, fam);
      DepTraceHost dt(M);
      for (auto& f : M.getFunctionList())
        run_host(f, fam, dt);
    }

    void ScabbardPassPlugin::instrCallbacks_host(llvm::Module& M, llvm::ModuleAnalysisManager& MAM)
    {
      // don't bother with host modules without hip components
      //WARN: this might break linking (or break linking if this isn't here IDK yet)
      // if (M.getFunction("__hip_module_ctor") == nullptr)
      //   return;
      if (M.getFunction("main") != nullptr)
        host.scabbard_init = M.getOrInsertFunction(
            host.scabbard_init_name,
            llvm::FunctionType::get(
                llvm::Type::getVoidTy(M.getContext()),
                llvm::ArrayRef<llvm::Type*>(std::array<llvm::Type*,1>{
                    llvm::Type::getVoidTy(M.getContext()),
                  }),
                false
              )
          );
      // host.scabbard_close = M.getOrInsertFunction(
      //     host.scabbard_close_name,
      //     llvm::FunctionType::get(
      //         llvm::Type::getVoidTy(M.getContext()),
      //         llvm::ArrayRef<llvm::Type*>(std::array<llvm::Type*,1>{
      //             llvm::Type::getVoidTy(M.getContext()),
      //           }),
      //         false
      //       )
      //   );
      host.trace_append$mem = M.getOrInsertFunction(
          host.trace_append$mem_name,
          llvm::FunctionType::get(
              llvm::Type::getVoidTy(M.getContext()),
              llvm::ArrayRef<llvm::Type*>(std::vector<llvm::Type*>{
                  llvm::IntegerType::get(M.getContext(), sizeof(InstrData) * 8),
                  llvm::PointerType::get(M.getContext(), 0u), //WARN: This constant 0u might need to be dynamicly decided for host modules
                  llvm::Type::getMetadataTy(M.getContext())
                }),
              false
            )
        );
      host.trace_append$mem$cond = M.getOrInsertFunction(
          host.trace_append$mem_name,
          llvm::FunctionType::get(
              llvm::Type::getVoidTy(M.getContext()),
              llvm::ArrayRef<llvm::Type*>(std::vector<llvm::Type*>{
                  llvm::IntegerType::get(M.getContext(), sizeof(InstrData) * 8),
                  llvm::PointerType::get(M.getContext(), 0u), //WARN: This constant 0u might need to be dynamicly decided for host modules
                  llvm::Type::getMetadataTy(M.getContext())
                }),
              false
            )
      );
    }



    // << ========================================================================================== >> 
    // <<                                      FUNCTION STUFF                                        >> 
    // << ========================================================================================== >> 

    // llvm::PreservedAnalyses ScabbardPassPlugin::run(llvm::Function &F, llvm::FunctionAnalysisManager &FAM) 
    // {
    //   if (F.getCallingConv() == llvm::CallingConv::AMDGPU_KERNEL) // figure out if this is a kernel function or not
    //     return run_device(F, FAM);
    //   return run_host(F, FAM); // this will have to change after transforms are performed
    //   // create custom implementation of Fn llvm::PreservedAnalysis::invalidate : ( -> llvm::PreservedAnalysis) to do so
    // }


    // << ======================================== Device ========================================== >> 

    void ScabbardPassPlugin::run_device(llvm::Function& F, llvm::FunctionAnalysisManager& FAM, const DepTraceDevice& DT)
    {
      //TODO make any necessary additions to the function (i.e. getting thread, block, tile and stream ids)
      for (auto& bb : F.getBasicBlockList())
        for (auto& i : bb.getInstList())
          if (auto* store = llvm::dyn_cast<llvm::StoreInst>(&i)) {
            auto data = DT.getInstrData(*store);
            LLVM_DEBUG(
              if (not data) continue;
            llvm::errs() << "[scabbard::device] Found a `store` inst to instrument!\n"
              "[scabbard::device]    prop: " << data << "\n"
              "[scabbard::device]    repr: `";
            i.print(llvm::errs());
            llvm::errs() << "`\n[scabbard::device]\n";
            );
            //instrument store instructions to update trace
            instr_mem_func_device(F, i, store->getPointerOperand(), data);
          } else if (auto* load = llvm::dyn_cast<llvm::LoadInst>(&i)) {
            auto data = DT.getInstrData(*load);
            if (not data) continue;
            LLVM_DEBUG(
              llvm::errs() << "[scabbard::device] Found a `load` inst to instrument!\n"
              "[scabbard::device]    prop: " << data << "\n"
              "[scabbard::device]    repr: `";
            i.print(llvm::errs());
            llvm::errs() << "`\n[scabbard::device]\n";
            );
            //instrument load instructions
            instr_mem_func_device(F, i, load->getPointerOperand(), data);
          } else if (auto* call = llvm::dyn_cast<llvm::CallInst>(&i)) {
            //TODO instrument calls to thread id, block id, etc.
            // instr_call_device(F, call);
          } else if (auto atomic = llvm::dyn_cast<llvm::AtomicRMWInst>(&i)) {
            auto data = DT.getInstrData(*atomic);
            LLVM_DEBUG(
              if (not data) continue;
            llvm::errs() << "[scabbard::device] Found an `atomicrmw` inst to instrument!\n"
              "[scabbard::device]    prop: " << data << "\n"
              "[scabbard::device]    repr: `";
            i.print(llvm::errs());
            llvm::errs() << "`\n[scabbard::device]\n";
            );
            //instrument atomic readwrite instructions
            instr_mem_func_device(F, i, atomic->getPointerOperand(), data);
          }
          // return llvm::PreservedAnalyses::all();
    }

    void ScabbardPassPlugin::instr_mem_func_device(const llvm::Function& F, 
                                                    llvm::Instruction& I, llvm::Value* V,
                                                    const InstrData& data, bool InsertAfter)
    {
      if (not (data & InstrData::ON_DEVICE)) // make sure this is supposed to be instrumented on device
        return;
      auto ci = llvm::CallInst::Create(
          device.trace_append$mem,
          llvm::ArrayRef<llvm::Value*>(std::array<llvm::Value*,3>{
              llvm::ConstantInt::get(
                llvm::IntegerType::get(F.getContext(), sizeof(InstrData) * 8),
                llvm::APInt(sizeof(InstrData)*8, data)
              ),
              V,
              llvm::MetadataAsValue::get(F.getContext(), I.getDebugLoc().getAsMDNode())
            })
        );
      if (InsertAfter)
        ci->insertAfter(&I);
      else
        ci->insertBefore(&I);
    }

    void ScabbardPassPlugin::instr_call_device(const llvm::Function& F, llvm::CallInst* ci)
    {
      //TODO
    }


    // << ========================================= Host =========================================== >> 


    void ScabbardPassPlugin::run_host(llvm::Function& F, llvm::FunctionAnalysisManager& FAM, const DepTraceHost& DT)
    {
      for (auto& bb : F.getBasicBlockList())
        for (auto& i : bb.getInstList())
          if (auto* store = llvm::dyn_cast<llvm::StoreInst>(&i)) {
            auto data = DT.getInstrData(*store);
            LLVM_DEBUG(
              if (not data) continue;
            llvm::errs() << "[scabbard::host] Found a `store` inst to instrument!\n"
              "[scabbard::host]    prop: " << data << "\n"
              "[scabbard::host]    repr: `";
            i.print(llvm::errs());
            llvm::errs() << "`\n[scabbard::host]\n";
            );
            // instrument store instructions to update trace 
            instr_mem_func_host(F, i, store->getPointerOperand(), data);
          } else if (auto* load = llvm::dyn_cast<llvm::LoadInst>(&i)) {
            auto data = DT.getInstrData(*load);
            LLVM_DEBUG(
              if (not data) continue;
            llvm::errs() << "[scabbard::host] Found a `load` inst to instrument!\n"
              "[scabbard::host]    prop: " << data << "\n"
              "[scabbard::host]    repr: `";
            i.print(llvm::errs());
            llvm::errs() << "`\n[scabbard::host]\n";
            );
            // instrument load instructions
            instr_mem_func_host(F, i, load->getPointerOperand(), data);
          } else if (auto* call = llvm::dyn_cast<llvm::CallInst>(&i)) {
            //TODO instrument calls to hip malloc, hip copy, kernel launch and stream sync
            // instr_call_host(F, call);
          } else if (auto atomic = llvm::dyn_cast<llvm::AtomicRMWInst>(&i)) {
            auto data = DT.getInstrData(*atomic);
            LLVM_DEBUG(
              if (not data) continue;
            llvm::errs() << "[scabbard::host] Found an `atomicrmw` inst to instrument!\n"
              "[scabbard::host]    prop: " << data << "\n"
              "[scabbard::host]    repr: `";
            i.print(llvm::errs());
            llvm::errs() << "`\n[scabbard::host]\n";
            );
            //instrument atomic readwrite instructions
            instr_mem_func_host(F, i, atomic->getPointerOperand(), data);
          }
          // return llvm::PreservedAnalyses::all();
    }


    void ScabbardPassPlugin::instr_mainFunc_host(llvm::Function& MAIN, llvm::FunctionAnalysisManager &FAM)
    {
      // auto BB = llvm::BasicBlock::Create(MAIN.getContext(), "_BBscabbard_init");
      auto CI = llvm::CallInst::Create(host.scabbard_init, "");
      CI->insertBefore(&(*(MAIN.getEntryBlock().getFirstInsertionPt())));
      // BB->insertInto(&MAIN, &MAIN.getEntryBlock());
    }


    void ScabbardPassPlugin::instr_mem_func_host(const llvm::Function& F, 
                                                llvm::Instruction& I, llvm::Value* V,
                                                const InstrData& data, bool InsertAfter)
    {
      if (not (data & InstrData::ON_HOST)) // make sure this is supposed to be instrumented on device
        return;
      auto ci = llvm::CallInst::Create(
          ((data & InstrData::_RUNTIME_CONDITIONAL) ? host.trace_append$mem$cond : host.trace_append$mem),
          llvm::ArrayRef<llvm::Value*>(std::array<llvm::Value*,3>{
              llvm::ConstantInt::get(
                  llvm::IntegerType::get(F.getContext(), sizeof(InstrData) * 8),
                  llvm::APInt(sizeof(InstrData) * 8, data)
                ),
              V,
              llvm::MetadataAsValue::get(F.getContext(), I.getDebugLoc().getAsMDNode())
          })
        );
      if (InsertAfter)
        ci->insertAfter(&I);
      else
        ci->insertBefore(&I);
    }


    void ScabbardPassPlugin::instr_call_host(const llvm::Function& F, llvm::CallInst* ci)
    {
      const auto& fn = *ci->getCalledFunction();
      const auto& fnTy = *fn.getFunctionType();
      const auto fnName = fn.getName();
      if (fnName.startswith("hip") || fnName.startswith("cuda")) {
        if (fnName.contains("Host")) { // deal with all host specific functions separately (for organizational purposes)
          instr_host_call_host(F,ci,fnTy,fnName);
        } else if (fnName.contains("Stream")) { // deal with all host specific functions separately (for organizational purposes)
          instr_stream_call_host(F, ci,fnTy,fnName); 
        } else if (fnName.contains("Memcpy")) { // deal with all various hipMemcpy specific fn's separately (for organizational purposes)
          instr_memcpy_call_host(F,ci,fnTy,fnName);
        } else if (fnName.contains("Memset")) { // deal with the various hipMemset funcs
          //TODO
        } else if (fnName.contains("Malloc")) { // deal with the various hipMalloc funcs 
          //TODO
        } else if (fnName.contains("Free")) { // deal with the various hipFree funcs 
          //TODO
        } else if (fnName.contains("LaunchKernel")) { // deal with kernel launch funcs (this one is complicated)
          //TODO
        }
      }
    }
    
    void ScabbardPassPlugin::instr_stream_call_host(const llvm::Function& F, llvm::CallInst* ci,
                                                    const llvm::FunctionType& FnTy, const llvm::StringRef FnName) 
    {
      if (FnName.contains("Create")) { // handle stream creation
        //TODO
      } else if (FnName.contains("Destroy")) { // handle stream forced destruction
        //TODO
      } else if (FnName.contains("Synchronize")) { // handle the stream synchronize event
        //TODO very important 
      }
    }
    
    void ScabbardPassPlugin::instr_host_call_host(const llvm::Function& F, llvm::CallInst* ci,
                                                  const llvm::FunctionType& FnTy, const llvm::StringRef FnName) 
    {
      if (FnName.contains("Register")) {
        //TODO
      }
    }

    void ScabbardPassPlugin::instr_memcpy_call_host(const llvm::Function& F, llvm::CallInst* ci,
                                                    const llvm::FunctionType& FnTy, const llvm::StringRef FnName) 
    {
      //TODO
    }

    // const llvm::ImmutableMap<std::string, llvm::Function> ScabbardPassPlugin::HostInstrLibFuncs = {
    //   {
    //     "host.trace_append$mem",
    //     llvm::Function(new llvm::FunctionType(,,false))
    //   },
    //   {
    //     "host.trace_append$mem$cond",
    //   },
    //   {
    //     "host.trace_append$mem$atomic",
    //   },
    //   {
    //     "host.trace_append$mem$atomic_cond",
    //   },
    //   {
    //     "host.trace_append$barrier",
    //   },
    // };
    // const llvm::ImmutableMap<std::string, llvm::Function> ScabbardPassPlugin::DeviceInstrLibFuncs = {
    //   {
    //     "device.trace_append$mem",
    //   },
    //   {
    //     "device.trace_append$barrier",
    //   },
    // };

    // char LegacyScabbard::ID = 0;

  } //?namespace instr
} //?namespace scabbard

#undef DEBUG_TYPE // "scabbard"
