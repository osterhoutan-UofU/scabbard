/**
 * @file DepTrace_DEVICE.cpp
 * @author osterhoutan (osterhoutan@gmail.com)
 * @brief A object that is meant to allow the specific dep trace that scabbard requires to occur
 * @version alpha 0.0.1
 * @date 2023-05-16
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include "DepTrace.hpp"

#include <llvm/IR/Instructions.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Value.h>

namespace scabbard {
namespace instr {
  
  
  template<ModuleType MT>
  InstrWhen DepTrace<MT>::__calcInstrWhen(const llvm::Instruction& i) const 
  {
    if (cosnt auto& _i = llvm::dyn_cast<llvm::StoreInst>(i)) {
      return __calcInstrWhen_rec(_i); 
    } else if (const auto& _i = llvm::dyn_cast<llvm::LoadInst>(i)) {
      return __calcInstrWhen_rec(_i);
    } else if (const auto& _i = llvm::dyn_cast<llvm::CallInst>(i)) {
      return __calcInstrWhen_rec(_i);
    } else if (const auto& _i = llvm::dyn_cast<llvm::AtomicRMWInst>(i)) {
      return __calcInstrWhen_rec(_i);
    } else if (const auto& _i = llvm::dyn_cast<llvm::AddrSpaceCastInst>(i)) {
      return __calcInstrWhen_rec(_i);
    } else if (const auto& _i = llvm::dyn_cast<llvm::GetElementPtrInst>(i)) {
      return __calcInstrWhen_rec(_i);
    } else if (const auto& _i = llvm::dyn_cast<llvm::AllocaInst>(i)) {
      return __calcInstrWhen_rec(_i);
    }
    return InstrWhen::NEVER;
  }

  template<ModuleType MT>
  InstrWhen DepTrace<MT>::__calcInstrWhen(const llvm::Value& V) const 
  {
    // handle globals
    if (const auto& g = llvm::dyn_cast<llvm::GlobalVariable>(V)) {
      const auto name = V.getName();
      if (globalDeviceMem.lookup(name) != nullptr) {
        return InstrWhen::DEVICE_GLOBAL | InstrWhen::ALWAYS;
      }
      if (globalManagedMem.lookup(name) != nullptr) {
        return InstrWhen::MANAGED_MEM | InstrWhen::ALWAYS;
      }
    } else 
    // handle local registers
    if (const auto& a = llvm::dyn_cast<llvm::Argument>(V)) {
      return __calcInstrWhen_rec(a);
    }
    // unknown Value type...
    return InstrWhen::NEVER;
  }
  
  template<ModuleType MT>
  template<class InstrT>
  InstrWhen DepTrace<MT>::calcInstrWhen(const InstrT& I) const { return InstrWhen::NEVER; }
  template<ModuleType MT>
  template<class InstrT>
  InstrWhen DepTrace<MT>::__calcInstrWhen_rec(const InstrT& I) const { return InstrWhen::NEVER; }




} // namespace I
} //?namespace scabbard
