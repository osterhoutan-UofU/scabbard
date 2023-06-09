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

    struct {
        llvm::Function* trace_append$mem = nullptr;
        const std::string trace_append$mem_name = "_ZN8scabbard5trace4host16trace_append$memENS_9InstrDataEPKvS4_";
        llvm::Function* trace_append$mem$cond = nullptr; 
        const std::string trace_append$mem$cond_name = "_ZN8scabbard5trace4host21trace_append$mem$condENS_9InstrDataEPKvS4_";
      } host;
    struct {
        llvm::Function* trace_append$mem = nullptr;
        const std::string trace_append$mem_name = "_ZN8scabbard5trace4host16trace_append$memENS_9InstrDataEPKvS4_";
      } device;


  public:

    // ScabbardPassPlugin();
    // ScabbardPassPlugin(const std::string& InstrLibLoc);
    // ~ScabbardPassPlugin() = default;

    // /**
    // * @brief \em fn \c run : (llvm::Function& -> bool) \n
    // *        The \c runOnFunction method must be implemented by your subclass to do the transformation 
    // *         or analysis work of your pass. 
    // *        As usual, a \c true value should be returned if the function is modified.
    // * @param M \c llvm::Module& - The module being processed
    // * @return \c llvm::PreservedAnalyses - the relevant analysis that are still valid
    // */
    // llvm::PreservedAnalyses run(llvm::Function &F, llvm::FunctionAnalysisManager &FAM);
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
     * @param F \c llvm::Module& - The device side Module to instrument
     * @param FAM \c llvm::ModuleAnalysisManager& - The Analysis Manager for the Module
     */
    auto run_device(llvm::Module& M, llvm::ModuleAnalysisManager &MAM) -> void;
    /**
     * @brief just run coded specifically for host/CPU Modules
     * @param F \c llvm::Module& - The device side Module to instrument
     * @param FAM \c llvm::ModuleAnalysisManager& - The Analysis Manager for the Module
     */
    auto run_host(llvm::Module& M, llvm::ModuleAnalysisManager &MAM) -> void;
    /**
     * @brief just run coded specifically for kernel/device functions
     * @param F \c llvm::Function& - The device side function to instrument
     * @param FAM \c llvm::FunctionAnalysisManager& - The Analysis Manager for the function
     * @return \c llvm::PreservedAnalyses - what has changed and what has not changed.
     */
    auto run_device(llvm::Function& F, llvm::FunctionAnalysisManager &FAM, const DepTraceDevice& DT) -> void;
    /**
     * @brief just run coded specifically for host/CPU functions
     * @param F \c llvm::Function& - The device side function to instrument
     * @param FAM \c llvm::FunctionAnalysisManager& - The Analysis Manager for the function
     * @return \c llvm::PreservedAnalyses - what has changed and what has not changed.
     */
    auto run_host(llvm::Function& F, llvm::FunctionAnalysisManager &FAM, const DepTraceHost& DT) -> void;


    auto add_instr_funcs_device(llvm::Module& M, llvm::ModuleAnalysisManager &MAM) -> void;
    auto add_instr_funcs_host(llvm::Module& M, llvm::ModuleAnalysisManager &MAM) -> void;


    auto instr_call_device(const llvm::Function& F, llvm::CallInst* ci) -> void;
    auto instr_call_host(const llvm::Function& F, llvm::CallInst* ci) -> void;
    
    auto instr_stream_call_host(const llvm::Function& F, llvm::CallInst* ci,
                                const llvm::FunctionType& FnTy, const llvm::StringRef FnName) -> void;
    auto instr_host_call_host(const llvm::Function& F, llvm::CallInst* ci,
                                const llvm::FunctionType& FnTy, const llvm::StringRef FnName) -> void;
    auto instr_memcpy_call_host(const llvm::Function& F, llvm::CallInst* ci,
                                const llvm::FunctionType& FnTy, const llvm::StringRef FnName) -> void;

    
    auto instr_mem_func_device(const llvm::Function& F, 
                               llvm::Instruction& I, llvm::Value* V, 
                               const InstrData& data, bool InsertAfter=true) -> void;
    auto instr_mem_func_host(const llvm::Function& F, 
                              llvm::Instruction& I, llvm::Value* V, 
                              const InstrData& data, bool InsertAfter=true) -> void;
    
  };//?END class ScabbardPassPlugin

} //?namespace instr
} //?namespace scabbard

