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
#include <llvm/Transforms/Utils/BasicBlockUtils.h>
#include <llvm/Transforms/Utils/Cloning.h>




#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/SourceMgr.h>

#define DEBUG_TYPE "scabbard"

namespace scabbard {
  namespace instr {


    ScabbardPassPlugin::ScabbardPassPlugin(MetadataHandler& metadata_)
      : metadata(metadata_)
    {}

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
      // auto result = linkPass.run(M,MAM);x
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
      device.dummyFunc = M.getFunction(SCABBARD_DEVICE_DUMMY_FUNC_NAME);

      llvm::FunctionAnalysisManager& fam = MAM.getResult<llvm::FunctionAnalysisManagerModuleProxy>(M)
                                              .getManager();
      DepTraceDevice dt(M);
      llvm::SmallVector<llvm::Function*> funcs;
      for (auto& f : M.getFunctionList())
        funcs.push_back(&f);
      for (auto* f : funcs)
        if (f->getName() != device.trace_append$mem_name && f->getName() != device.trace_append$alloc_name && f->getName() != "__ockl_hostcall_internal"
            && f->getName() != SCABBARD_DEVICE_DUMMY_FUNC_NAME)
          run_device(*f, fam, dt);

      finish_replacing_old_funcs_device(M);

      // remove the dummy caller function from device_def
      // M.getFunction(SCABBARD_DEVICE_DUMMY_FUNC_NAME)->eraseFromParent(); //note: causes all linked functions to also be removed
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
    }

    void ScabbardPassPlugin::instrCallbacks_host(llvm::Module& M, llvm::ModuleAnalysisManager& MAM)
    {
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
      host.register_job = M.getOrInsertFunction(
          host.register_job_name,
          llvm::FunctionType::get(
              llvm::PointerType::getUnqual(M.getContext()),
              llvm::ArrayRef<llvm::Type*>(std::vector<llvm::Type*>{
                  llvm::PointerType::getUnqual(M.getContext())
                }),
              false
            )
        );
      host.register_job_callback = M.getOrInsertFunction(
          host.register_job_callback_name,
          llvm::FunctionType::get(
              llvm::Type::getVoidTy(M.getContext()),
              llvm::ArrayRef<llvm::Type*>(std::vector<llvm::Type*>{
                  llvm::PointerType::getUnqual(M.getContext()),
                  llvm::PointerType::getUnqual(M.getContext())
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

    void ScabbardPassPlugin::run_device(llvm::Function& _F, llvm::FunctionAnalysisManager& FAM, const DepTraceDevice& DT)
    {
      if (_F.isDeclaration()) return; // skip functions not defined (only declared) in this module 
      llvm::Function& F = *replace_device_function(_F);

      // search for instructions to instrument and instrument them
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
            instr_mem_func_device(F, i, store->getPointerOperand(), data, false);
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
            instr_call_device(F, call);
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
          llvm::ArrayRef<llvm::Value*>(std::array<llvm::Value*,6>{
              F.getArg(F.arg_size()-1),
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
      //TODO modify to register reads and writes from builtin functions
    }


    llvm::Function* ScabbardPassPlugin::replace_device_function(llvm::Function& OldFn)
    {
      llvm::Module& M = *OldFn.getParent();
      std::string old_name = OldFn.getName().str();
      OldFn.setName(old_name+"__old__scabbard_instr_replaced__old__");
      auto oldParamTys = OldFn.getFunctionType()->params();
      std::vector<llvm::Type*> paramTys(oldParamTys.begin(), oldParamTys.end());
      paramTys.push_back(llvm::PointerType::get(OldFn.getContext(),0ul));
      auto fn_callee = M.getOrInsertFunction(
                          old_name,
                          llvm::FunctionType::get(
                              OldFn.getFunctionType()->getReturnType(),
                              llvm::ArrayRef<llvm::Type*>(paramTys),
                              OldFn.getFunctionType()->isVarArg()
                            ),
                          OldFn.getAttributes()
                        );
      llvm::Function* NewFn = llvm::dyn_cast<llvm::Function>(fn_callee.getCallee()); // new function (OldFn is old function)
      NewFn->setCallingConv(OldFn.getCallingConv());
      llvm::ValueToValueMapTy vMap;
      for (size_t i=0; i<OldFn.arg_size(); ++i)
        vMap[OldFn.getArg(i)] = NewFn->getArg(i);
      llvm::SmallVector<llvm::ReturnInst*,8> rets;
      //?NOTE: this might be used wrong.  Double check results in testing to make sure it works correctly
      //?     if wrong likely due to not creating vMap properly
      llvm::CloneFunctionInto(NewFn, &OldFn, vMap, llvm::CloneFunctionChangeType::LocalChangesOnly, rets);
      to_replace.push_back(std::tuple(&OldFn,NewFn));
      return NewFn;
    }

    void ScabbardPassPlugin::finish_replacing_old_funcs_device(llvm::Module& M)
    {
      //modify to pass device tracker through as last parameter to all functions defined in this module'
      for (auto& tr : to_replace) {
        llvm::Function* OldFn, * NewFn; // llvm::MDNode* NewFnMDN;
        // std::tie(OldFn, NewFn, NewFnMDN) = tr;
        std::tie(OldFn, NewFn) = tr;

        for (auto& u : OldFn->uses()) {
          if (auto CI = llvm::dyn_cast<llvm::CallInst>(u.getUser())) {
            llvm::Function* iFn = CI->getFunction();
#           if __clang_major__ <= 16
              if (iFn->getName().endswith("__old__scabbard_instr_replaced__old__"))
                continue;
#           else
              if (iFn->getName().ends_with("__old__scabbard_instr_replaced__old__"))
                continue;
#           endif

            llvm::SmallVector<llvm::Value*,4u> operands;
            for (auto& op : CI->args())
              operands.push_back(op.get());
            operands.push_back(iFn->getArg(iFn->arg_size()-1));
            auto ci = llvm::CallInst::Create(
                          NewFn->getFunctionType(),
                          NewFn,
                          llvm::ArrayRef<llvm::Value*>(operands)            
                        );
            if (CI->isTailCall())
              ci->setTailCallKind(CI->getTailCallKind());
            if (CI->canReturnTwice())
              ci->setCanReturnTwice();
            ci->insertBefore(CI);
            CI->replaceAllUsesWith(ci);
            ci->setDebugLoc(CI->getDebugLoc());
            ci->setCallingConv(CI->getCallingConv());
            CI->eraseFromParent();

          } else {
            LLVM_DEBUG(llvm::errs() << "\n[scabbard.instr.device:DBG] overwritten device function used in non-call instruction!\n";);
          }
        }
        // remove OldFn from module
        OldFn->eraseFromParent();
      }
      // clear the list so we're ready for reuse
      to_replace.clear();

    }


    // << ========================================= Host =========================================== >> 


    void ScabbardPassPlugin::run_host(llvm::Function& F, llvm::FunctionAnalysisManager& FAM, const DepTraceHost& DT)
    {
      if (F.isDeclaration()) return; // skip functions not defined (only declared) in this module
      for (auto& bb : F)
        for (auto& i : bb)
          if (auto* store = llvm::dyn_cast<llvm::StoreInst>(&i)) {
            auto data = DT.getInstrData(*store);
            LLVM_DEBUG(
              if (not data) continue;
            llvm::errs() << "[scabbard.instr.host:DBG] Found a `store` inst to instrument!\n"
              "[scabbard.instr.host:DBG]    prop: " << data << "\n"
              "[scabbard.instr.host:DBG]    repr: `";
            i.print(llvm::errs());
            llvm::errs() << "`\n[scabbard.instr.host:DBG]\n";
            );
            // instrument store instructions to update trace 
            instr_mem_func_host(F, i, store->getPointerOperand(), data);
          } else if (auto* load = llvm::dyn_cast<llvm::LoadInst>(&i)) {
            auto data = DT.getInstrData(*load);
            LLVM_DEBUG(
              if (not data) continue;
            llvm::errs() << "[scabbard.instr.host:DBG] Found a `load` inst to instrument!\n"
              "[scabbard.instr.host:DBG]    prop: " << data << "\n"
              "[scabbard.instr.host:DBG]    repr: `";
            i.print(llvm::errs());
            llvm::errs() << "`\n[scabbard.instr.host:DBG]\n";
            );
            // skip the loads inserted after instrumenting a hipMalloc call
            if (not load->getDebugLoc()) continue; //NOTE: bad optimizers might make this skip valid loads to instrument
            // instrument load instructions
            instr_mem_func_host(F, i, load->getPointerOperand(), data);
          } else if (auto* call = llvm::dyn_cast<llvm::CallInst>(&i)) {
            instr_call_host(F, call);
          } else if (auto atomic = llvm::dyn_cast<llvm::AtomicRMWInst>(&i)) {
            auto data = DT.getInstrData(*atomic);
            LLVM_DEBUG(
              if (not data) continue;
            llvm::errs() << "[scabbard.instr.host:DBG] Found an `atomicrmw` inst to instrument!\n"
              "[scabbard.instr.host:DBG]    prop: " << data << "\n"
              "[scabbard.instr.host:DBG]    repr: `";
            i.print(llvm::errs());
            llvm::errs() << "`\n[scabbard.instr.host:DBG]\n";
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


    /**
     * @brief Get the value that contains the mem address of the pointer pointer
     *        (used to get the mem address of the ptr value of hipMalloc)
     *        Not safe to use outside of specific use
     */
    llvm::Value* get_ptr_from_ptr(llvm::Value* V)
    {
      if (auto* alloc = llvm::dyn_cast<llvm::AllocaInst>(V)) {
        return alloc;
      } else if (auto* arg = llvm::dyn_cast<llvm::Argument>(V)) {
        if (arg->getType()->isPointerTy())
          return arg;
        return nullptr;
      } else if (auto* bitCast = llvm::dyn_cast<llvm::BitCastInst>(V)) {
        return get_ptr_from_ptr(bitCast->getOperand(0u)); //NOTE: this not being arg operand might cause problems
      } else if (auto* bitCast = llvm::dyn_cast<llvm::BitCastOperator>(V)) {
        return get_ptr_from_ptr(bitCast->getOperand(0u)); //NOTE: this not being arg operand might cause problems
      } else if (auto* inst = llvm::dyn_cast<llvm::Instruction>(V)) {
        return get_ptr_from_ptr(inst->getOperand(0u)); //NOTE: this not being arg operand might cause problems
      }
      return nullptr;
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
      //                                         CI->getArgOperand(0), 
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
                : CI->getArgOperand(0u)), // ptrtoint
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
        if (auto _mem_loc = get_ptr_from_ptr(CI->getArgOperand(0u))) {
          auto mem_loc = new llvm::LoadInst(llvm::PointerType::get(F.getContext(),0u), _mem_loc, llvm::Twine(""), CI->getNextNode());
          auto ci = llvm::CallInst::Create(
              host.trace_append$alloc,
              llvm::ArrayRef<llvm::Value*>(std::array<llvm::Value*,6>{
                  llvm::ConstantInt::get(
                      llvm::IntegerType::get(F.getContext(), sizeof(InstrData) * 8),
                      llvm::APInt(sizeof(InstrData)*8, InstrData::ALLOCATE | InstrData::UNKNOWN_HEAP)
                    ),
                  mem_loc, // ptrtoint
                  loc.src_id_ptr,
                  loc.getLineAsConstant(F.getContext()),
                  loc.getColAsConstant(F.getContext()),
                  CI->getArgOperand(1u)
                })
            );
          ci->insertAfter(mem_loc);
        } 
        else llvm::errs() << "\n[scabbard.instr.host:ERR] hip malloc found but could not find associated memory address!\n"; //DEBUG
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
              CI->getArgOperand(0u),
              loc.src_id_ptr,
              loc.getLineAsConstant(F.getContext()),
              loc.getColAsConstant(F.getContext()),
              llvm::ConstantInt::get( // we can't contextually know how much is being free'd inline, but we can keep track like a normal allocator does 
                  llvm::IntegerType::get(F.getContext(), 64u),
                  llvm::APInt(64u, 0ul)
                )
            })
        );
        ci->insertBefore(CI);
      }
      else if (fnName == "hipLaunchKernel")
      {
       instr_launch_func_host(F,*CI);
       return;
      }
      else if (fnName == "hipMemcpy" || fnName == "hipMemcpyAsync")
      {
        auto loc = metadata.trace(F, CI->getDebugLoc(), false);
        // hipMemCpy performs a hipStreamSync(0) unless it's async so we must also register the sync event
        if (not fnName.contains("Async")) {
          auto cis = llvm::CallInst::Create(
            host.trace_append$mem,
            llvm::ArrayRef<llvm::Value*>(std::array<llvm::Value*,5>{
                llvm::ConstantInt::get(
                    llvm::IntegerType::get(F.getContext(), sizeof(InstrData) * 8),
                    llvm::APInt(sizeof(InstrData)*8, InstrData::SYNC_EVENT)
                  ),
                ((fnName == "hipMemcpyWithStream") 
                  ? CI->getArgOperand(0)
                  : llvm::ConstantPointerNull::get(llvm::PointerType::get(F.getContext(), 0u))),
                loc.src_id_ptr,
                loc.getLineAsConstant(F.getContext()),
                loc.getColAsConstant(F.getContext())
              })
          );
          cis->insertBefore(CI);
        }
        // we only need to register the cpy as a read if it's from device to host 
        if (auto* TrTy = llvm::dyn_cast<llvm::ConstantInt>(CI->getArgOperand(3))) {
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
        auto ci = llvm::CallInst::Create(
          host.trace_append$alloc,
          llvm::ArrayRef<llvm::Value*>(std::array<llvm::Value*,6>{
              llvm::ConstantInt::get(
                  llvm::IntegerType::get(F.getContext(), sizeof(InstrData) * 8),
                  llvm::APInt(sizeof(InstrData)*8, InstrData::READ | InstrData::DEVICE_HEAP | InstrData::ON_HOST | InstrData::_OPT_USED)
                ),
              ((fnName == "hipDeviceSynchronize") 
                ? llvm::ConstantPointerNull::get(llvm::PointerType::get(F.getContext(), 0u))
                : CI->getArgOperand(0)), // ptrtoint
              loc.src_id_ptr,
              loc.getLineAsConstant(F.getContext()),
              loc.getColAsConstant(F.getContext()),
              CI->getArgOperand(2)
            })
        );
        ci->insertBefore(CI);
        return;
      }
    }


    llvm::GetElementPtrInst* expand_param_args_alloc(llvm::AllocaInst& alloc)
    {
      auto oldAllocTy = alloc.getAllocatedType();
      size_t old_size = 0ul;
      if (auto arrTy = llvm::dyn_cast<llvm::ArrayType>(oldAllocTy)) { // case: alloc array type
        old_size = arrTy->getNumElements();
      } else if (auto C = llvm::dyn_cast<llvm::ConstantInt>(alloc.getArraySize())) { // case: built in alloc array concept
        old_size = C->getSExtValue();
      } else {  // case: unknown size 
        LLVM_DEBUG(llvm::errs() << "\n[scabbard.instr.ERR] could not determine size of alloc instr!\n";);
        old_size = 1;
      }
      auto plainPtrTy = llvm::PointerType::get(alloc.getContext(),0ul);
      // auto newAllocTy = llvm::ArrayType::get(plainPtrTy, old_size+1);
      auto newAlloc = new llvm::AllocaInst(
                              plainPtrTy,
                              0u,
                              llvm::ConstantInt::get(
                                  llvm::IntegerType::get(alloc.getContext(), 32u),
                                  llvm::APInt(32u, old_size+1)
                                ),
                              "instrParamAlloc",
                              &alloc
                            );
      auto memLoc = llvm::GetElementPtrInst::Create(
                      plainPtrTy,
                      newAlloc, 
                      llvm::ArrayRef<llvm::Value*>(std::array<llvm::Value*,1>{
                          llvm::ConstantInt::get(
                              llvm::IntegerType::get(alloc.getContext(), 64u),
                              llvm::APInt(64u, 0u)
                            )
                        })
                      );
      memLoc->insertAfter(newAlloc);
      alloc.replaceAllUsesWith(memLoc); //DBG: does not seem to be working
      alloc.eraseFromParent();
      return llvm::GetElementPtrInst::Create(
                plainPtrTy,
                newAlloc, 
                llvm::ArrayRef<llvm::Value*>(std::array<llvm::Value*,1>{
                    llvm::ConstantInt::get(
                        llvm::IntegerType::get(alloc.getContext(), 64u),
                        llvm::APInt(64u, old_size)
                      )
                  })
              );
    }


    void ScabbardPassPlugin::instr_launch_func_host(llvm::Function& F, llvm::CallInst& CI)
    {
      // instrument in `scabbard.trace.register_job` before this function and instrument in `scabbard.trace.register_job_callback` after this function call
      auto regFn = llvm::CallInst::Create(
          host.register_job.getFunctionType(),
          host.register_job.getCallee(),
          llvm::ArrayRef<llvm::Value*>(std::array<llvm::Value*,1>{
              CI.getArgOperand(7)
            })
        );
      regFn->insertBefore(&CI);
      auto regCbFn = llvm::CallInst::Create(
          host.register_job_callback.getFunctionType(),
          host.register_job_callback.getCallee(),
          llvm::ArrayRef<llvm::Value*>(std::array<llvm::Value*,2>{
              regFn,
              CI.getArgOperand(7)
            })
        );
      regCbFn->insertAfter(&CI);
      //TODO? modify the type of the last operand (should be a global or function pass)
      // trace back args var and expand it to include the pointer to the DeviceTracker that is returned as the result of `scabbard.trace.register_job` as the last parameter
      auto plainPtrTy = llvm::PointerType::get(F.getContext(),0ul);
      llvm::GetElementPtrInst* paramPtr = nullptr;
      if (auto argElmPtr = llvm::dyn_cast<llvm::GetElementPtrInst>(CI.getArgOperand(5))) { // case: >=2 function parameter length
        if (auto argAlloc = llvm::dyn_cast<llvm::AllocaInst>(argElmPtr->getPointerOperand())) {
          paramPtr = expand_param_args_alloc(*argAlloc);
          if (paramPtr != nullptr)
            argElmPtr->replaceAllUsesWith(paramPtr);
        } else {
          llvm::errs() << "\n[scabbard.instr.host:ERROR] kernel launch user args could not be traced to param args construct allocation\n";
        }
      } else if (auto argAlloc = llvm::dyn_cast<llvm::AllocaInst>(CI.getArgOperand(5))) { // case: single or zero function parameter length
        paramPtr = expand_param_args_alloc(*argAlloc);
      } else {
        llvm::errs() << "\n[scabbard.instr.host:DBG] kernel launch user args are not loaded from local frame\n```\n";
        CI.getArgOperand(5)->print(llvm::errs());
        llvm::errs() << "\n```\n\n";
      }
      if (paramPtr == nullptr) {
        llvm::errs() << "\n[scabbard.instr:ERROR] could not instrument kernel call (instrumentation failed)\n";
        return;
      }
      auto dtAlloc = new llvm::AllocaInst(plainPtrTy, 0u, "dtPtr", regFn);
      paramPtr->insertAfter(regFn);
      auto dtStore = new llvm::StoreInst(regFn, dtAlloc, paramPtr);
      auto dtParamStore = new llvm::StoreInst(dtAlloc, paramPtr, &CI);
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
