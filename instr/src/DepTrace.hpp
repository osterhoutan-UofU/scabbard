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

#include <unordered_set>
#include <unordered_map>
#include <functional>

namespace scabbard {
  namespace instr {

    class ScabbardPassPlugin;

    typedef std::function<bool(const llvm::Value&,const llvm::CallBase&)> CallCheck_t;

    template<ModuleType MT>
    class DepTrace {

      DepTrace() = default;
    protected:

      llvm::SymbolTableListTraits<llvm::GlobalVariable> globalManagedMem;
      llvm::SymbolTableListTraits<llvm::GlobalVariable> globalDeviceMem;

    public:

      // static const std::unordered_set<const std::StringRef> funcsToInstr;
      static const llvm::StringMap<const CallCheck_t> funcsOfInterest;

      DepTrace(const llvm::Module& M);
      ~DepTrace() = default;

      /**
       * @brief Get when/if you should instrument this instruction
       * @tparam InstrT the type of instruction
       * @return \c InstrWhen -
       */
      template<class InstrT>
      InstrWhen calcInstrWhen(const InstrT&) const;

    private:
      InstrWhen __calcInstrWhen(const llvm::Instruction&) const;
      InstrWhen __calcInstrWhen(const llvm::PHINode&) const;
      InstrWhen __calcInstrWhen(const llvm::Value&) const;
      template<class InstrT>
      InstrWhen __calcInstrWhen_rec(const InstrT&) const;

    };

    typedef DepTrace<HOST> DepTraceHost;
    typedef DepTrace<DEVICE> DepTraceDevice;

    // base check for if a func call is of interest to instrumentation
    const CallCheck_t BASE_CHECK = [](const llvm::Value& V, const llvm::CallBase& C) -> bool { 
            return V == *C.getArgOperand(0);
          };

    // template<>
    // const std::unordered_set<const llvm::StringRef> DepTrace<HOST>::funcsToInstr{"hipMalloc","hipMemcpy","__hipPushCallConfiguration", "__hipMallocManaged", "hipMemAdvise", "hipMemSet"};
    
    // template<>
    // const std::unordered_set<const llvm::StringRef> DepTrace<DEVICE>::funcsToInstr{};
    


  } // namespace instr
} //?namespace scabbard
