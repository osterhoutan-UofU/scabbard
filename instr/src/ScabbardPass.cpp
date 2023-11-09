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
#include <llvm/Transforms/Utils/ModuleUtils.h>

#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/SourceMgr.h>

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
      const llvm::Triple target(M.getTargetTriple());
      // archBit = ((target.isArch64Bit()) ? 64 //ASSUMING for now this will only be used on 64 bit machines
      //             : ((target.isArch32Bit()) ? 32 
      //               : (target.isArch16Bit()) ? 16 : 0))
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
      // instrCallbacks_device(M, MAM);
      // llvm::FunctionAnalysisManager& fam = MAM.getResult<llvm::FunctionAnalysisManagerModuleProxy>(M)
      //   .getManager();
      // DepTraceDevice dt(M);
      // for (auto& f : M.getFunctionList())
      //     run_device(f, fam, dt);
      // auto result = linkPass.run(M,MAM);
      const auto SCABBARD_PATH = std::getenv("SCABBARD_PATH");
      if (SCABBARD_PATH == nullptr) {
        llvm::errs() << "\n[scabbard::instr::link::ERROR] Env var `SCABBARD_PATH` was undefined could not identify instrumentation file location!!\n";
        return;
      }
      const std::string LIBTRACE_DEVICE_PATH = std::string(SCABBARD_PATH) + "/libtrace-device.ll";
      auto diag = llvm::SMDiagnostic();
      // auto context = llvm::LLVMContext();
      M.getContext().setDiscardValueNames(false);
      std::unique_ptr<llvm::Module> traceModule = llvm::parseIRFile(LIBTRACE_DEVICE_PATH, diag, M.getContext());
      M.getContext().setDiscardValueNames(true);
      if (traceModule == nullptr) {
        llvm::errs() << "\n[scabbard::instr::link::ERROR] could not parse the libtrace-device bitcode/IR \"library\"!!"
                        "\n[scabbard::instr::link::ERROR] error msg: ```\n";
        diag.print("scabbard::instr", llvm::errs());
        llvm::errs() << "```\n";
        return;
      }
      // std::unique_ptr<llvm::Module>& traceModule = loadModule(_bug.get());
      if (not llvm::Triple(traceModule->getTargetTriple()).isAMDGPU()) {
        llvm::errs() << "\n[scabbard::instr::link::ERROR] could not find the device module in the libtrace-device bitcode \"library\"!!\n";
        return;
      }
      if (llvm::Linker::linkModules(M, std::move(traceModule))) {
        llvm::errs() << "\n[scabbard::instr::link::ERROR] the llvm linker encountered an error while linking!!\n";
        return;
      }
      
      // get references to linked in utility functions
      device.trace_append$mem = M.getFunction(device.trace_append$mem_name);
      device.trace_append$alloc = M.getFunction(device.trace_append$alloc_name);

      llvm::FunctionAnalysisManager& fam = MAM.getResult<llvm::FunctionAnalysisManagerModuleProxy>(M)
                                              .getManager();
      DepTraceDevice dt(M);
      for (auto& f : M.getFunctionList())
        if (f.getName() != device.trace_append$mem_name && f.getName() != device.trace_append$alloc_name)
          run_device(f, fam, dt);
    }

    // void ScabbardPassPlugin::instrCallbacks_device(llvm::Module& M, llvm::ModuleAnalysisManager& MAM)
    // {
    //   device.trace_append$mem = M.getOrInsertFunction(
    //       device.trace_append$mem_name,
    //       llvm::FunctionType::get(
    //           llvm::Type::getVoidTy(M.getContext()),
    //           llvm::ArrayRef<llvm::Type*>(std::vector<llvm::Type*>{
    //               llvm::IntegerType::get(M.getContext(), sizeof(InstrData) * 8),
    //               llvm::PointerType::get(M.getContext(), 0u), //WARN: This constant 0u might need to be dynamicly decided for host modules
    //               llvm::PointerType::get(M.getContext(), 1u), //WARN: This constant 0u might need to be dynamicly decided for host modules
    //               llvm::IntegerType::get(M.getContext(), 32u),
    //               llvm::IntegerType::get(M.getContext(), 32u)
    //             }),
    //           false
    //         )
    //     );
    //   device.trace_append$alloc = M.getOrInsertFunction(
    //       device.trace_append$alloc_name,
    //       llvm::FunctionType::get(
    //           llvm::Type::getVoidTy(M.getContext()),
    //           llvm::ArrayRef<llvm::Type*>(std::vector<llvm::Type*>{
    //               llvm::IntegerType::get(M.getContext(), sizeof(InstrData) * 8),
    //               llvm::PointerType::get(M.getContext(), 0u),
    //               llvm::PointerType::get(M.getContext(), 1u),
    //               llvm::IntegerType::get(M.getContext(), 32u),
    //               llvm::IntegerType::get(M.getContext(), 32u),
    //               llvm::IntegerType::get(M.getContext(), 64u)
    //             }),
    //           false
    //         )
    //     );
    // }



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
        if (f.getName() != "__hip_module_ctor")
          run_host(f, fam, dt);
      instr_module_ctor_host(M, MAM);
    }

    void ScabbardPassPlugin::instrCallbacks_host(llvm::Module& M, llvm::ModuleAnalysisManager& MAM)
    {
      // don't bother with host modules without hip components
      //WARN: this might break linking (or break linking if this isn't here IDK yet)
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
      host.trace_append$mem = M.getOrInsertFunction(
          host.trace_append$mem_name,
          llvm::FunctionType::get(
              llvm::Type::getVoidTy(M.getContext()),
              llvm::ArrayRef<llvm::Type*>(std::vector<llvm::Type*>{
                  llvm::IntegerType::get(M.getContext(), sizeof(InstrData) * 8),
                  llvm::PointerType::get(M.getContext(), 0u), //WARN: This constant 0u might need to be dynamicly decided for host modules
                  llvm::PointerType::get(M.getContext(), 0u), //WARN: This constant 0u might need to be dynamicly decided for host modules
                  llvm::IntegerType::get(M.getContext(), 32u),
                  llvm::IntegerType::get(M.getContext(), 32u)
                }),
              false
            )
        );
      host.trace_append$mem$cond = M.getOrInsertFunction(
          host.trace_append$mem$cond_name,
          llvm::FunctionType::get(
              llvm::Type::getVoidTy(M.getContext()),
              llvm::ArrayRef<llvm::Type*>(std::vector<llvm::Type*>{
                  llvm::IntegerType::get(M.getContext(), sizeof(InstrData) * 8),
                  llvm::PointerType::get(M.getContext(), 0u), //WARN: This constant 0u might need to be dynamicly decided for host modules
                  llvm::PointerType::get(M.getContext(), 0u), //WARN: This constant 0u might need to be dynamicly decided for host modules
                  llvm::IntegerType::get(M.getContext(), 32u),
                  llvm::IntegerType::get(M.getContext(), 32u)
                }),
              false
            )
        );
      host.trace_append$alloc = M.getOrInsertFunction(
          host.trace_append$alloc_name,
          llvm::FunctionType::get(
              llvm::Type::getVoidTy(M.getContext()),
              llvm::ArrayRef<llvm::Type*>(std::vector<llvm::Type*>{
                  llvm::IntegerType::get(M.getContext(), sizeof(InstrData) * 8),
                  llvm::PointerType::get(M.getContext(), 0u), //WARN: This constant 0u might need to be dynamicly decided for host modules
                  llvm::PointerType::get(M.getContext(), 0u), //WARN: This constant 0u might need to be dynamicly decided for host modules
                  llvm::IntegerType::get(M.getContext(), 32u),
                  llvm::IntegerType::get(M.getContext(), 32u),
                  llvm::IntegerType::get(M.getContext(), 64u)
                }),
              false
            )
        );
    }

    void ScabbardPassPlugin::instr_module_ctor_host(llvm::Module& M, llvm::ModuleAnalysisManager &MAM)
    {
      auto BB = llvm::BasicBlock::Create(M.getContext(), "metadata_registry", host.module_ctor);
      llvm::IRBuilder<llvm::ConstantFolder,llvm::IRBuilderDefaultInserter> IRB(BB);
      // handle hip stuff
      llvm::Value* gpuBin = nullptr;
      auto gpuBinGlobal = M.getGlobalVariable("__hip_gpubin_handle");
      if (gpuBinGlobal != nullptr)
        gpuBin = IRB.CreateLoad(llvm::PointerType::get(IRB.getInt8PtrTy(),0u), gpuBinGlobal);
      // insert the registry stuff
      for (const auto& mde_p : metadata.getMetadataMap()) {
        const auto& mde = mde_p.second;
        if (mde.last_module == &M) { // if it was used in this module 
          const auto regCall = IRB.CreateCall(
              host.metadata_register$src,
              llvm::ArrayRef<llvm::Value*>(std::array<llvm::Value*, 1>{
                  mde.src_filepath_str
                })
            );
          IRB.CreateStore(regCall, mde.src_id_ptr_host);
          if (gpuBin != nullptr && mde.src_id_ptr_device != nullptr) { //TODO: issue about id ptr not being created 
            IRB.CreateCall(M.getFunction("__hipRegisterVar"),
                            llvm::ArrayRef<llvm::Value*>(std::array<llvm::Value*,8>{
                              gpuBin,
                              llvm::ConstantExpr::getBitCast(mde.src_id_ptr_device_host, IRB.getInt8PtrTy()),
                              mde.src_id_ptr_device_host_name,
                              mde.src_id_ptr_device_host_name,
                              IRB.getInt32(0u),
                              IRB.getInt32(8u),
                              IRB.getInt32(0u),
                              IRB.getInt32(0u),
                            }));
            IRB.CreateStore(regCall, mde.src_id_ptr_device_host);
          }
        }
      }
      IRB.CreateRetVoid();
      // register the ctor with a "low priority" so it goes after all other ctors
      llvm::appendToGlobalCtors(M, host.module_ctor, UINT32_MAX);
      LLVM_DEBUG(host.module_ctor->print(llvm::errs()));
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
      for (auto& bb : F)
        for (auto& i : bb)
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

    void ScabbardPassPlugin::instr_mem_func_device(llvm::Function& F, 
                                                    llvm::Instruction& I, llvm::Value* V,
                                                    const InstrData& data, bool InsertAfter)
    {
      if (not (data & InstrData::ON_DEVICE)) // make sure this is supposed to be instrumented on device
        return;
      auto loc = metadata.trace(F, I.getDebugLoc(), true);
      auto ci = llvm::CallInst::Create(
          device.trace_append$mem,
          llvm::ArrayRef<llvm::Value*>(std::array<llvm::Value*,5>{
              llvm::ConstantInt::get(
                  llvm::IntegerType::get(F.getContext(), sizeof(InstrData) * 8),
                  llvm::APInt(sizeof(InstrData)*8, data)
                ),
              V,
              loc.src_id_ptr,
              loc.getLineAsConstant(F.getContext()),
              loc.getColAsConstant(F.getContext())
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
      for (auto& bb : F)
        for (auto& i : bb)
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
            instr_call_host(F, call);
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


    void ScabbardPassPlugin::instr_mem_func_host(llvm::Function& F, 
                                                llvm::Instruction& I, llvm::Value* V,
                                                const InstrData& data, bool InsertAfter)
    {
      if (not (data & InstrData::ON_HOST)) // make sure this is supposed to be instrumented on device
        return;
      auto loc = metadata.trace(F, I.getDebugLoc(), false);
      auto ci = llvm::CallInst::Create(
          ((data & InstrData::_RUNTIME_CONDITIONAL) ? host.trace_append$mem$cond : host.trace_append$mem),
          llvm::ArrayRef<llvm::Value*>(std::array<llvm::Value*,5>{
              llvm::ConstantInt::get(
                  llvm::IntegerType::get(F.getContext(), sizeof(InstrData) * 8),
                  llvm::APInt(sizeof(InstrData)*8, data)
                ),
              V,
              loc.src_id_ptr,
              loc.getLineAsConstant(F.getContext()),
              loc.getColAsConstant(F.getContext())
            })
        );
      if (InsertAfter)
        ci->insertAfter(&I);
      else
        ci->insertBefore(&I);
    }


    void ScabbardPassPlugin::instr_call_host(llvm::Function& F, llvm::CallInst* CI)
    {
      const auto* fn = CI->getCalledFunction();
      if (fn == nullptr) return; // don't deal with antonymous functions 
      // const auto& fnTy = *fn.getFunctionType();
      if (not fn->hasName()) return; // don't deal with antonymous functions
      const auto fnName = fn->getName();
      if (fnName == "hipStreamSynchronize" || fnName == "hipDeviceSynchronize") // make sure this is supposed to be instrumented on device
      {
      auto loc = metadata.trace(F, CI->getDebugLoc(), false);
      // auto ptrtoint = llvm::CastInst::Create(llvm::CastInst::CastOps::PtrToInt, 
      //                                         CI->getOperand(0), 
      //                                         llvm::IntegerType::getInt64PtrTy(F.getContext()));
      auto ci = llvm::CallInst::Create(
          host.trace_append$mem,
          llvm::ArrayRef<llvm::Value*>(std::array<llvm::Value*,5>{
              llvm::ConstantInt::get(
                  llvm::IntegerType::get(F.getContext(), sizeof(InstrData) * 8),
                  llvm::APInt(sizeof(InstrData)*8, InstrData::SYNC_EVENT)
                ),
              ((fnName == "hipDeviceSynchronize") 
                ? llvm::ConstantPointerNull::get(llvm::PointerType::get(F.getContext(), 0u))
                : CI->getOperand(0)), // ptrtoint
              loc.src_id_ptr,
              loc.getLineAsConstant(F.getContext()),
              loc.getColAsConstant(F.getContext())
            })
        );
        ci->insertAfter(CI);
      }
      else if (fnName == "hipMalloc")
      {
        auto loc = metadata.trace(F, CI->getDebugLoc(), false);
        auto ci = llvm::CallInst::Create(
          host.trace_append$alloc,
          llvm::ArrayRef<llvm::Value*>(std::array<llvm::Value*,6>{
              llvm::ConstantInt::get(
                  llvm::IntegerType::get(F.getContext(), sizeof(InstrData) * 8),
                  llvm::APInt(sizeof(InstrData)*8, InstrData::ALLOCATE | InstrData::DEVICE_HEAP)
                ),
              ((fnName == "hipDeviceSynchronize") 
                ? llvm::ConstantPointerNull::get(llvm::PointerType::get(F.getContext(), 0u))
                : CI->getOperand(0)), // ptrtoint
              loc.src_id_ptr,
              loc.getLineAsConstant(F.getContext()),
              loc.getColAsConstant(F.getContext()),
              CI->getOperand(1)
            })
        );
        ci->insertAfter(CI);
      }
      else if (fnName == "hipFree")
      {
        auto loc = metadata.trace(F, CI->getDebugLoc(), false);
        auto ci = llvm::CallInst::Create(
          host.trace_append$alloc,
          llvm::ArrayRef<llvm::Value*>(std::array<llvm::Value*,6>{
              llvm::ConstantInt::get(
                  llvm::IntegerType::get(F.getContext(), sizeof(InstrData) * 8),
                  llvm::APInt(sizeof(InstrData)*8, InstrData::FREE | InstrData::DEVICE_HEAP)
                ),
              ((fnName == "hipDeviceSynchronize") 
                ? llvm::ConstantPointerNull::get(llvm::PointerType::get(F.getContext(), 0u))
                : CI->getOperand(0)), // ptrtoint
              loc.src_id_ptr,
              loc.getLineAsConstant(F.getContext()),
              loc.getColAsConstant(F.getContext()),
              llvm::ConstantInt::get( // we can't contextually know how much is being free'd inline, but we can keep track like a normal allocator does 
                  llvm::IntegerType::get(F.getContext(), 64),
                  llvm::APInt(64u, 0)
                )
            })
        );
        ci->insertBefore(CI);
      }
      else if (fnName == "hipMemcpy")
      {
        if (auto* TrTy = llvm::dyn_cast<llvm::ConstantInt>(CI->getOperand(3))) {
          // get which 
          switch (TrTy->getSExtValue()) {
            case 2: // D->H
              break; // we only care about instrumenting copies that count as reading read by the host
            case 1: // H->D
            case 3: // D->D
            case 0: // H->H
            default: // Unknown
              return;
          }
        }
        auto loc = metadata.trace(F, CI->getDebugLoc(), false);
        auto ci = llvm::CallInst::Create(
          host.trace_append$alloc,
          llvm::ArrayRef<llvm::Value*>(std::array<llvm::Value*,6>{
              llvm::ConstantInt::get(
                  llvm::IntegerType::get(F.getContext(), sizeof(InstrData) * 8),
                  llvm::APInt(sizeof(InstrData)*8, InstrData::READ | InstrData::DEVICE_HEAP | InstrData::ON_HOST | InstrData::_OPT_USED)
                ),
              ((fnName == "hipDeviceSynchronize") 
                ? llvm::ConstantPointerNull::get(llvm::PointerType::get(F.getContext(), 0u))
                : CI->getOperand(0)), // ptrtoint
              loc.src_id_ptr,
              loc.getLineAsConstant(F.getContext()),
              loc.getColAsConstant(F.getContext()),
              CI->getOperand(2)
            })
        );
        ci->insertBefore(CI);
        return;
      }
    }

    // void ScabbardPassPlugin::instr_call_host(const llvm::Function& F, llvm::CallInst* ci)
    // {
    //   const auto& fn = *ci->getCalledFunction();
    //   const auto& fnTy = *fn.getFunctionType();
    //   const auto fnName = fn.getName();
    //   if (fnName.startswith("hip") || fnName.startswith("cuda")) {
    //     if (fnName.contains("Host")) { // deal with all host specific functions separately (for organizational purposes)
    //       instr_host_call_host(F,ci,fnTy,fnName);
    //     } else if (fnName.contains("Stream")) { // deal with all host specific functions separately (for organizational purposes)
    //       instr_stream_call_host(F, ci,fnTy,fnName); 
    //     } else if (fnName.contains("Memcpy")) { // deal with all various hipMemcpy specific fn's separately (for organizational purposes)
    //       instr_memcpy_call_host(F,ci,fnTy,fnName);
    //     } else if (fnName.contains("Memset")) { // deal with the various hipMemset funcs
    //       //TODO
    //     } else if (fnName.contains("Malloc")) { // deal with the various hipMalloc funcs 
    //       //TODO
    //     } else if (fnName.contains("Free")) { // deal with the various hipFree funcs 
    //       //TODO
    //     } else if (fnName.contains("LaunchKernel")) { // deal with kernel launch funcs (this one is complicated)
    //       //TODO
    //     }
    //   }
    // }
    
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
