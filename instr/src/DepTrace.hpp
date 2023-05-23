/**
 * @file DepTrace.hpp
 * @author osterhoutan (osterhoutan@gmail.com)
 * @brief A object that is meant to allow the specific dep trace that scabbard requires to occur
 * @version alpha 0.0.1
 * @date 2023-05-16
 *
 * @copyright Copyright (c) 2023
 *
 */
#pragma once

#include "Enums.hpp"

#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/SymbolTableListTraits.h>
#include <llvm/ADT/StringMap.h>
#include <llvm/IR/Instructions.h>

#include <unordered_set>
#include <unordered_map>
#include <functional>

namespace scabbard {
  namespace instr {

    class ScabbardPassPlugin;

    

    template<ModuleType MT>
    class DepTrace {

      DepTrace() = default;
    protected:

      llvm::StringMap<const llvm::GlobalVariable*> globalManagedMem;
      llvm::StringMap<const llvm::GlobalVariable*> globalDeviceMem;

    public:

      // static const std::unordered_set<const std::StringRef> funcsToInstr;
      // static const llvm::ImmutableMap<std::string, const CallCheck_t> funcsOfInterest;
      // static const llvm::StringMap<const CallCheck_t> funcsOfInterest;

      DepTrace(const llvm::Module& M);
      ~DepTrace() = default;

      /**
       * @brief Get when/if you should instrument this instruction
       * @tparam InstrT the type of instruction
       * @return \c InstrData -
       */
      template<class InstrT>
      InstrData calcInstrWhen(const InstrT&) const;

    private:
      InstrData __calcInstrWhen_inst(const llvm::Instruction&) const;
      InstrData __calcInstrWhen_phi(const llvm::PHINode&) const;
      InstrData __calcInstrWhen_val(const llvm::Value&) const;
      template<class InstrT>
      InstrData __calcInstrWhen_rec(const InstrT&) const;

    };

    typedef DepTrace<HOST> DepTraceHost;
    typedef DepTrace<DEVICE> DepTraceDevice;

    // template<>
    // const std::unordered_set<const llvm::StringRef> DepTrace<HOST>::funcsToInstr{"hipMalloc","hipMemcpy","__hipPushCallConfiguration", "__hipMallocManaged", "hipMemAdvise", "hipMemSet"};
    
    // template<>
    // const std::unordered_set<const llvm::StringRef> DepTrace<DEVICE>::funcsToInstr{};
    


  } // namespace instr
} //?namespace scabbard
