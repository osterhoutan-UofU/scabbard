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

#include <llvm/Pass.h> 
#include <llvm/IR/Module.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/PassManager.h>
#include <llvm/IR/SymbolTableListTraits.h> 
#include <llvm/IR/GlobalVariable.h> 
#include <llvm/Transforms/IPO/PassManagerBuilder.h>

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
    /**
    * @brief \em fn \c run : (llvm::Function& -> bool) \n
    *        The \c runOnFunction method must be implemented by your subclass to do the transformation 
    *         or analysis work of your pass. 
    *        As usual, a \c true value should be returned if the function is modified.
    * @param M \c llvm::Module& - The module being processed
    * @return \c llvm::PreservedAnalyses - the relevant analysis that are still valid
    */
    llvm::PreservedAnalyses run(llvm::Function &F, llvm::FunctionAnalysisManager &FAM);
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

    enum InstrWhen : std::int16_t {
      /// ENUM BYTE MAP
      /// 0b_0000_0000_0000_0000
      ///          ^ ^  ^ ^  ^ ^
      ///          | |  | |  | L Runtime Conditional
      ///          | |  | |  L Instr On Host (CPU)
      ///          | |  | L Instr on Device (GPU)
      ///          | |  L Instr as READ
      ///          | L Instr as WRITE
      ///          L Instr as Atomic
      // This inst should never be instrumented (no chance of being of interest in traces)
      NEVER                 = 0b00000000,
      NO                    = 0b00000000,
      // This might be of interest, but we can only know after a runtime conditional is run.
      _RUNTIME_CONDITIONAL  = 0b00000100,  // Note: conditional is only valid for HOST/CPU
      // This inst should always be instrumented (no chance of not being of interest in traces) 
      ALWAYS                = 0b01001010,
      YES                   = 0b01001010,    // This is just a useful duplicate of ALWAYS
      // If this is on the GPU/Device it should be instrumented
      DEVICE                = 0b00100000,
      GPU                   = 0b00100000,
      // If this is on the CPU/Host it shoule be instrumented
      HOST                  = 0b00000010,
      CPU                   = 0b00000010,
      //
      READ                  = 0b000001000000,
      //
      WRITE                 = 0b000100000000,
      //
      ATOMIC                = 0b010000000000,
    };
    enum ModuleType { HOST=0, DEVICE=1, UNKNOWN_MODULE=-1 };

  protected:

    ModuleType moduleType = UNKNOWN_MODULE;
    llvm::SymbolTableListTraits<llvm::GlobalVariable> globalManagedMem;
    llvm::SymbolTableListTraits<llvm::GlobalVariable> globalDeviceMem;

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
    auto run_device(llvm::Function& F, llvm::FunctionAnalysisManager &FAM) -> llvm::PreservedAnalyses;
    /**
     * @brief just run coded specifically for host/CPU functions
     * @param F \c llvm::Function& - The device side function to instrument
     * @param FAM \c llvm::FunctionAnalysisManager& - The Analysis Manager for the function
     * @return \c llvm::PreservedAnalyses - what has changed and what has not changed.
     */
    auto run_host(llvm::Function& F, llvm::FunctionAnalysisManager &FAM) -> llvm::PreservedAnalyses;
    /**
     * @brief process hip constructor function (used to get list of globals that are device mem).
     * @param F \c llvm::Function& - The device side function to instrument
     * @param FAM \c llvm::FunctionAnalysisManager& - The Analysis Manager for the function
     * @return \c llvm::PreservedAnalyses - what has changed and what has not changed.
     */
    auto run_hip_ctor(const llvm::Function& F, const llvm::FunctionAnalysisManager &FAM) -> llvm::PreservedAnalyses;

    /**
     * @brief Get when/if you should instrument this instruction
     * @tparam InstrT the type of instruction 
     * @return \c InstrWhen - 
     */
    template<class InstrT>
    InstrWhen calcInstrWhen(const InstrT&) const;

  private:

    template<class InstrT>
    InstrWhen __calcInstrWhen(const InstrT&) const;
  };//?END class ScabbardPassPlugin

} //?namespace instr
} //?namespace scabbard

