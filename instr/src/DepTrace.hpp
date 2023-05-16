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

namespace scabbard {
  namespace instr {

    class ScabbardPassPlugin;

    template<ModuleType MT>
    class DepTrace {

      DepTrace() = default;
    protected:

      llvm::SymbolTableListTraits<llvm::GlobalVariable> globalManagedMem;
      llvm::SymbolTableListTraits<llvm::GlobalVariable> globalDeviceMem;

    public:
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
      InstrWhen __calcInstrWhen(const llvm::Value&) const;
      template<class InstrT>
      InstrWhen __calcInstrWhen_rec(const InstrT&) const;

    };

    typedef DepTrace<HOST> DepTraceHost;
    typedef DepTrace<DEVICE> DepTraceDevice;


  } // namespace instr
} //?namespace scabbard
