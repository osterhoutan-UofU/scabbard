/**
 * @file DepTrace_DEVICE.cpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
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
#include <llvm/Analysis/MemorySSA.h>
#include <llvm/Support/Debug.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/Casting.h>

namespace scabbard {
namespace instr {
  
  
  // template<ModuleType MT>
  // InstrData DepTrace<MT>::__getInstrData_inst(const llvm::Instruction& i) const 
  // {
  //   if (const auto* _i = llvm::dyn_cast<llvm::StoreInst>(&i)) {
  //     return __getInstrData_rec(*_i); 
  //   } else if (const auto* _i = llvm::dyn_cast<llvm::LoadInst>(&i)) {
  //     return __getInstrData_rec(*_i);
  //   } else if (const auto* _i = llvm::dyn_cast<llvm::CallInst>(&i)) {
  //     return __getInstrData_rec(*_i);
  //   } else if (const auto* _i = llvm::dyn_cast<llvm::AtomicRMWInst>(&i)) {
  //     return __getInstrData_rec(*_i);
  //   } else if (const auto* _i = llvm::dyn_cast<llvm::AddrSpaceCastInst>(&i)) {
  //     return __getInstrData_rec(*_i);
  //   } else if (const auto* _i = llvm::dyn_cast<llvm::GetElementPtrInst>(&i)) {
  //     return __getInstrData_rec(*_i);
  //   } else if (const auto* _i = llvm::dyn_cast<llvm::AllocaInst>(&i)) {
  //     return __getInstrData_rec(*_i);
  //   } else if (const auto* _i = llvm::dyn_cast<llvm::PHINode>(&i)) {
  //     return __getInstrData_phi(*_i);
  //   }
  //   return InstrData::NEVER;
  // }

  // template<ModuleType MT>
  // InstrData DepTrace<MT>::__getInstrData_val(const llvm::Value& V) const 
  // {
  //   // handle globals
  //   if (const auto* _g = llvm::dyn_cast<llvm::GlobalVariable>(&V)) {
  //     const auto name = V.getName();
  //     if (globalDeviceMem.find(name) != globalDeviceMem.end()) {
  //       return InstrData::DEVICE_HEAP | ((MT==HOST) ? InstrData::ON_HOST : InstrData::ON_DEVICE);
  //     }
  //     if (globalManagedMem.find(name) != globalManagedMem.end()) {
  //       return InstrData::MANAGED_MEM | ((MT==HOST) ? InstrData::ON_HOST : InstrData::ON_DEVICE);
  //     }
  //   } else 
  //   // handle local function args/registers
  //   if (const auto* _A = llvm::dyn_cast<llvm::Argument>(&V)) {
  //     return __getInstrData_rec(*_A);
  //   }
  //   // handle derived values (aka instructions)
  //   if (const auto* _I = llvm::dyn_cast<llvm::Instruction>(&V)) {
  //     return __getInstrData_inst(*_I);
  //   }
  //   // unknown Value type...
  //   return InstrData::NEVER;
  // }

  
  // template<ModuleType MT>
  // InstrData DepTrace<MT>::__getInstrData_phi(const llvm::PHINode& PHI) const 
  // {
  //   InstrData res = InstrData::NEVER;
  //   for (const auto& U : PHI.incoming_values())
  //     res |= __getInstrData_val(*U.get());
  //   return res;
  // }
  
  template<ModuleType MT>
  template<class InstrT>
  InstrData DepTrace<MT>::getInstrData(const InstrT& I) const { return InstrData::NEVER; }
  template<ModuleType MT>
  template<class InstrT>
  InstrData DepTrace<MT>::__getInstrData_rec(const InstrT& I) const { return InstrData::NEVER; }


  llvm::raw_ostream& operator << (llvm::raw_ostream& out, const InstrData& data) noexcept 
  {
    std::stringstream _out;
    return out << (_out << data).str();
  }


} // namespace I
} //?namespace scabbard
