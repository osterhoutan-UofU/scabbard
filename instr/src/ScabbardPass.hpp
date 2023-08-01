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

#pragma once

#include "DepTrace.hpp"
#include "MetadataHandler.hpp"
#include "ScabbardLinkPass.hpp" 

#include <scabbard/instr-names.def>

#include <llvm/Pass.h> 
#include <llvm/IR/Module.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/PassManager.h>
#include <llvm/Transforms/IPO/PassManagerBuilder.h>

#include <string>
#include <memory>

namespace scabbard {
namespace instr {


  
  // bool runScabbardPass(llvm::Module& M);

  
  // bool runScabbardPass(llvm::Function& F);



  // struct LegacyScabbard : public llvm::FunctionPass {
  //   static char ID;
  // public:
  //   LegacyScabbard() : FunctionPass(ID) {}
  //   bool doInitialization(llvm::Module& M) override { return runScabbardPass(M); }
  //   bool runOnFunction(llvm::Function& F) override { return runScabbardPass(F); }
  // };//?END class LegacyScabbard

  
  
  struct ScabbardPassPlugin : llvm::PassInfoMixin<ScabbardPassPlugin> {
  protected:
    std::string source_loc = "";
    std::size_t archBit = 64;

    MetadataHandler metadata;

    struct {
        llvm::Function* module_ctor = nullptr;
        const std::string module_ctor_name = SCABBARD_CALLBACK_MODULE_CTOR_NAME;
        llvm::Function* module_dtor = nullptr;
        const std::string module_dtor_name = SCABBARD_CALLBACK_MODULE_DTOR_NAME;

        llvm::FunctionCallee scabbard_init;
        const std::string scabbard_init_name = SCABBARD_CALLBACK_INIT_NAME;
        // llvm::FunctionCallee scabbard_close;
        // const std::string scabbard_close_name = SCABBARD_CALLBACK_CLOSE_NAME;
        llvm::FunctionCallee metadata_register$src;
        const std::string metadata_register$src_name = SCABBARD_CALLBACK_REGISTER_SRC_NAME;
        llvm::FunctionCallee metadata_unregister$src;
        const std::string metadata_unregister$src_name = SCABBARD_CALLBACK_UNREGISTER_SRC_NAME;
        // llvm::FunctionCallee metadata_register$loc;
        // const std::string metadata_register$loc_name = SCABBARD_CALLBACK_REGISTER_LOC_NAME;
        // llvm::FunctionCallee metadata_unregister$loc;
        // const std::string metadata_unregister$loc_name = SCABBARD_CALLBACK_UNREGISTER_LOC_NAME;

        llvm::FunctionCallee trace_append$mem;
        const std::string trace_append$mem_name = SCABBARD_HOST_CALLBACK_APPEND_MEM_NAME;
        llvm::FunctionCallee trace_append$mem$cond; 
        const std::string trace_append$mem$cond_name = SCABBARD_HOST_CALLBACK_APPEND_MEM_COND_NAME;
        llvm::FunctionCallee trace_append$alloc;
        const std::string trace_append$alloc_name = SCABBARD_HOST_CALLBACK_APPEND_ALLOC_NAME;
      } host;
    struct {
        llvm::FunctionCallee trace_append$mem;
        const std::string trace_append$mem_name = SCABBARD_DEVICE_CALLBACK_APPEND_MEM_NAME;
        llvm::FunctionCallee trace_append$alloc;
        const std::string trace_append$alloc_name = SCABBARD_DEVICE_CALLBACK_APPEND_ALLOC_NAME;
      } device;

  ScabbardLinkPass linkPass;


  public:

    // ScabbardPassPlugin();
    // ScabbardPassPlugin(const std::string& InstrLibLoc);
    // ~ScabbardPassPlugin() = default;

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
     * @return \c llvm::PreservedAnalyses - the relevant analysis that are still valid
     */
    llvm::PreservedAnalyses run(llvm::Module &M, llvm::ModuleAnalysisManager &MAM);
    

  protected:


    // /**
    //  * @brief Map of functions that exist in scabbard lib that should be inserted into any host module
    //  */
    // static const llvm::ImmutableMap<std::string, llvm::Function> HostInstrLibFuncs;
    // /**
    //  * @brief Map of functions that exist in scabbard lib that should be inserted into all device modules
    //  */
    // static const llvm::ImmutableMap<std::string, llvm::Function> DeviceInstrLibFuncs;
    

    /**
     * @brief just run coded specifically for kernel/device Modules
     * @param M \c llvm::Module& - The device side Module to instrument
     * @param MAM \c llvm::ModuleAnalysisManager& - The Analysis Manager for the Module
     */
    auto run_device(llvm::Module& M, llvm::ModuleAnalysisManager &MAM) -> void;
    /**
     * @brief just run coded specifically for host/CPU Modules
     * @param M \c llvm::Module& - The device side Module to instrument
     * @param MAM \c llvm::ModuleAnalysisManager& - The Analysis Manager for the Module
     */
    auto run_host(llvm::Module& M, llvm::ModuleAnalysisManager &MAM) -> void;
    /**
     * @brief just run coded specifically for kernel/device functions
     * @param F \c llvm::Function& - The device side function to instrument
     * @param FAM \c llvm::FunctionAnalysisManager& - The Analysis Manager for the function
     */
    auto run_device(llvm::Function& F, llvm::FunctionAnalysisManager &FAM, const DepTraceDevice& DT) -> void;
    /**
     * @brief just run coded specifically for host/CPU functions
     * @param F \c llvm::Function& - The device side function to instrument
     * @param FAM \c llvm::FunctionAnalysisManager& - The Analysis Manager for the function
     */
    auto run_host(llvm::Function& F, llvm::FunctionAnalysisManager &FAM, const DepTraceHost& DT) -> void;

    /**
     * @brief Instrument device module to have all necessary callback functions
     * @param M \c llvm::Module& - The device side Module to instrument
     * @param MAM \c llvm::ModuleAnalysisManager& - The Analysis Manager for the Module
     */
    auto instrCallbacks_device(llvm::Module& M, llvm::ModuleAnalysisManager &MAM) -> void;
    /**
     * @brief Instrument host module to have all necessary callback functions
     * @param M \c llvm::Module& - The host side Module to instrument
     * @param MAM \c llvm::ModuleAnalysisManager& - The Analysis Manager for the Module
     */
    auto instrCallbacks_host(llvm::Module& M, llvm::ModuleAnalysisManager &MAM) -> void;
    /**
     * @brief 
     * @param F \c llvm::Function& - The device side function to instrument
     * @param FAM \c llvm::FunctionAnalysisManager& - The Analysis Manager for the function
     */
    auto instr_mainFunc_host(llvm::Function& F, llvm::FunctionAnalysisManager &FAM) -> void;

    /**
     * @brief Fill in the contents of the module ctor and add it to \c @llvm.global_ctors 
     * @param M \c llvm::Module& - The host side Module to instrument
     * @param MAM \c llvm::ModuleAnalysisManager& - The Analysis Manager for the Module
     */
    auto instr_module_ctor_host(llvm::Module& M, llvm::ModuleAnalysisManager &MAM) -> void;

    auto instr_call_device(const llvm::Function& F, llvm::CallInst* ci) -> void;
    auto instr_call_host(const llvm::Function& F, llvm::CallInst* ci) -> void;
    
    auto instr_stream_call_host(const llvm::Function& F, llvm::CallInst* ci,
                                const llvm::FunctionType& FnTy, const llvm::StringRef FnName) -> void;
    auto instr_host_call_host(const llvm::Function& F, llvm::CallInst* ci,
                                const llvm::FunctionType& FnTy, const llvm::StringRef FnName) -> void;
    auto instr_memcpy_call_host(const llvm::Function& F, llvm::CallInst* ci,
                                const llvm::FunctionType& FnTy, const llvm::StringRef FnName) -> void;

    
    auto instr_mem_func_device(llvm::Function& F, 
                               llvm::Instruction& I, llvm::Value* V, 
                               const InstrData& data, bool InsertAfter=true) -> void;
    auto instr_mem_func_host(llvm::Function& F, 
                              llvm::Instruction& I, llvm::Value* V, 
                              const InstrData& data, bool InsertAfter=true) -> void;
    
  };//?END class ScabbardPassPlugin

} //?namespace instr
} //?namespace scabbard

