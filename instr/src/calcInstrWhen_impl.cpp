/**
 * @file calcInstrWhen_impl.cpp
 * @author osterhoutan (osterhoutan@gmail.com)
 * @brief For organization purposes I have moved all templated implementations 
 *        of \c ScabbardPassPlugin::calcInstrWhen
 *        
 * @version alpha 0.0.1
 * @date 2023-05-15
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include "ScabbardPass.hpp"
#include <llvm/IR/Instructions.h>

namespace scabbard {
namespace instr {

template<>
  ScabbardPassPlugin::InstrWhen ScabbardPassPlugin::calcInstrWhen(const llvm::StoreInst& instr) const 
  { 
    return InstrWhen::NEVER;
  }

  template<>
  ScabbardPassPlugin::InstrWhen ScabbardPassPlugin::calcInstrWhen(const llvm::LoadInst& instr) const 
  { 
    return InstrWhen::NEVER;
  }

  template<>
  ScabbardPassPlugin::InstrWhen ScabbardPassPlugin::calcInstrWhen(const llvm::CallInst& instr) const 
  { 
    return InstrWhen::NEVER;
  }

  template<>
  ScabbardPassPlugin::InstrWhen ScabbardPassPlugin::calcInstrWhen(const llvm::AtomicRMWInst& instr) const 
  { 
    if (moduleType == ModuleType::DEVICE)
      return (InstrWhen)(InstrWhen::ATOMIC | InstrWhen::DEVICE | InstrWhen::READ | InstrWhen::WRITE);  // this means that the mem is device heap (shared or global doesn't matter)
    return __calcInstrWhen(instr);
  }

  template<>
  ScabbardPassPlugin::InstrWhen ScabbardPassPlugin::__calcInstrWhen(const llvm::StoreInst& instr) const 
  { 
    return InstrWhen::NEVER;
  }

  template<>
  ScabbardPassPlugin::InstrWhen ScabbardPassPlugin::__calcInstrWhen(const llvm::LoadInst& instr) const 
  { 
    return InstrWhen::NEVER;
  }

  template<>
  ScabbardPassPlugin::InstrWhen ScabbardPassPlugin::__calcInstrWhen(const llvm::CallInst& instr) const 
  { 
    return InstrWhen::NEVER;
  }

  template<>
  ScabbardPassPlugin::InstrWhen ScabbardPassPlugin::__calcInstrWhen(const llvm::AtomicRMWInst& instr) const 
  { 
    return InstrWhen::NEVER;
  }

  template<>
  ScabbardPassPlugin::InstrWhen ScabbardPassPlugin::__calcInstrWhen(const llvm::AddrSpaceCastInst& instr) const 
  { 
    return InstrWhen::NEVER;
  }

  template<>
  ScabbardPassPlugin::InstrWhen ScabbardPassPlugin::__calcInstrWhen(const llvm::GetElementPtrInst& instr) const 
  { 
    return InstrWhen::NEVER;
  }

  template<>
  ScabbardPassPlugin::InstrWhen ScabbardPassPlugin::__calcInstrWhen(const llvm::AllocaInst& instr) const 
  { 
    return InstrWhen::NEVER; // this means that this ptr comes from the stack frame
  }
  

  template<>
  ScabbardPassPlugin::InstrWhen ScabbardPassPlugin::calcInstrWhen(const llvm::Instruction& i) const
  { 
    if (auto* _i = llvm::dyn_cast<llvm::StoreInst>(&i)) {
      return calcInstrWhen(*_i);
    } else if (auto* _i = llvm::dyn_cast<llvm::LoadInst>(&i)) {
      return calcInstrWhen(*_i);
    } else if (auto* _i = llvm::dyn_cast<llvm::CallInst>(&i)) {
      return calcInstrWhen(*_i);
    } else if (auto _i = llvm::dyn_cast<llvm::AtomicRMWInst>(&i)) {
      return calcInstrWhen(*_i);
    }
    return InstrWhen::NEVER;
  }
  template<>
  ScabbardPassPlugin::InstrWhen ScabbardPassPlugin::__calcInstrWhen(const llvm::Instruction& i) const 
  {
    if (auto* _i = llvm::dyn_cast<llvm::StoreInst>(&i)) {
      return __calcInstrWhen(*_i); 
    } else if (auto* _i = llvm::dyn_cast<llvm::LoadInst>(&i)) {
      return __calcInstrWhen(*_i);
    } else if (auto* _i = llvm::dyn_cast<llvm::CallInst>(&i)) {
      return __calcInstrWhen(*_i);
    } else if (auto _i = llvm::dyn_cast<llvm::AtomicRMWInst>(&i)) {
      return __calcInstrWhen(*_i);
    } else if (auto _i = llvm::dyn_cast<llvm::AddrSpaceCastInst>(&i)) {
      return __calcInstrWhen(*_i);
    } else if (auto _i = llvm::dyn_cast<llvm::GetElementPtrInst>(&i)) {
      return __calcInstrWhen(*_i);
    } else if (auto _i = llvm::dyn_cast<llvm::AllocaInst>(&i)) {
      return __calcInstrWhen(*_i);
    }
    return InstrWhen::NEVER;
  }
  
  template<class InstrT>
  ScabbardPassPlugin::InstrWhen ScabbardPassPlugin::calcInstrWhen(const InstrT& instr) const { return InstrWhen::NEVER; }
  template<class InstrT>
  ScabbardPassPlugin::InstrWhen ScabbardPassPlugin::__calcInstrWhen(const InstrT& instr) const { return InstrWhen::NEVER; }




} //?namespace instr
} //?namespace scabbard