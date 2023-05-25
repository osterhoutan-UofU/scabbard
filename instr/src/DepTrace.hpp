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

      llvm::StringMap<const llvm::GlobalValue*> globalManagedMem;
      llvm::StringMap<const llvm::GlobalValue*> globalDeviceMem;

      // llvm::StringMap<const llvm::GlobalVariable*> globalManagedMem;
      // llvm::StringMap<const llvm::GlobalVariable*> globalDeviceMem;

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
      // InstrData __calcInstrWhen_inst(const llvm::Instruction& I) const;
      InstrData __calcInstrWhen_inst(const llvm::Instruction& i) const
      {
        if (const auto* _i = llvm::dyn_cast<llvm::StoreInst>(&i)) {
          return __calcInstrWhen_rec(*_i);
        } else if (const auto* _i = llvm::dyn_cast<llvm::LoadInst>(&i)) {
          return __calcInstrWhen_rec(*_i);
        } else if (const auto* _i = llvm::dyn_cast<llvm::CallInst>(&i)) {
          return __calcInstrWhen_rec(*_i);
        } else if (const auto* _i = llvm::dyn_cast<llvm::AtomicRMWInst>(&i)) {
          return __calcInstrWhen_rec(*_i);
        } else if (const auto* _i = llvm::dyn_cast<llvm::AddrSpaceCastInst>(&i)) {
          return __calcInstrWhen_rec(*_i);
        } else if (const auto* _i = llvm::dyn_cast<llvm::GetElementPtrInst>(&i)) {
          return __calcInstrWhen_rec(*_i);
        } else if (const auto* _i = llvm::dyn_cast<llvm::BitCastInst>(&i)) {
          return __calcInstrWhen_rec(*_i);
        } else if (const auto* _i = llvm::dyn_cast<llvm::AllocaInst>(&i)) {
          return __calcInstrWhen_rec(*_i);
        } else if (const auto* _i = llvm::dyn_cast<llvm::PHINode>(&i)) {
          return __calcInstrWhen_phi(*_i);
        }
        return InstrData::NEVER;
      }
      // InstrData __calcInstrWhen_phi(const llvm::PHINode& PHI) const;
      InstrData __calcInstrWhen_phi(const llvm::PHINode& PHI) const
      {
        InstrData res = InstrData::NEVER;
        for (const auto& U : PHI.incoming_values())
          res |= __calcInstrWhen_val(*U.get());
        return res;
      }
      // InstrData __calcInstrWhen_val(const llvm::Value& V) const;
      InstrData __calcInstrWhen_val(const llvm::Value& V) const
      {
        // handle globals
        // if (const auto* _g = llvm::dyn_cast<llvm::GlobalVariable>(&V)) {
        if (const auto* _g = llvm::dyn_cast<llvm::GlobalValue>(&V)) {
          const auto name = V.getName();
          if (globalDeviceMem.find(name) != globalDeviceMem.end()) {
            return InstrData::DEVICE_HEAP | ((MT == HOST) ? InstrData::ON_HOST : InstrData::ON_DEVICE);
          }
          if (globalManagedMem.find(name) != globalManagedMem.end()) {
            return InstrData::MANAGED_MEM | ((MT == HOST) ? InstrData::ON_HOST : InstrData::ON_DEVICE);
          }
        } else
          // handle local function args/registers
          if (const auto* _A = llvm::dyn_cast<llvm::Argument>(&V)) {
            return __calcInstrWhen_rec(*_A);
          }
        // handle derived values (aka instructions)
        if (const auto* _I = llvm::dyn_cast<llvm::Instruction>(&V)) {
          return __calcInstrWhen_inst(*_I);
        }
        // unknown Value type...
        return InstrData::NEVER;
      }
      template<class InstrT>
      InstrData __calcInstrWhen_rec(const InstrT& I) const;

    };

    typedef DepTrace<HOST> DepTraceHost;
    typedef DepTrace<DEVICE> DepTraceDevice;

    // template<>
    // const std::unordered_set<const llvm::StringRef> DepTrace<HOST>::funcsToInstr{"hipMalloc","hipMemcpy","__hipPushCallConfiguration", "__hipMallocManaged", "hipMemAdvise", "hipMemSet"};

    // template<>
    // const std::unordered_set<const llvm::StringRef> DepTrace<DEVICE>::funcsToInstr{};



  } // namespace instr
} //?namespace scabbard
