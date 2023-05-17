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
#include <llvm/Support/Debug.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/Casting.h>

namespace scabbard {
  namespace instr {

    template<>
    DepTrace<DEVICE>::DepTrace(const llvm::Module& M)
      : DepTrace()
    {
      for (const auto& g : M.getGlobalList())
        if (const auto mg = M.getNamedGlobal(llvm::Twine(g.getName(), ".managed").getSingleStringRef())) {
          globalManagedMem.addNodeToList(const_cast<llvm::GlobalVariable*>(mg));
        } else if (not g.getName().endswith(".managed")) {
          globalDeviceMem.addNodeToList(const_cast<llvm::GlobalVariable*>(&g));
        }
    }

    template<>
    template<>
    InstrWhen DepTrace<DEVICE>::calcInstrWhen(const llvm::StoreInst& I) const
    {
      InstrWhen res = __calcInstrWhen(*I.getPointerOperand());
      if (res == InstrWhen::NEVER)
        return InstrWhen::NEVER;
      res |= (I.isAtomic()) ? InstrWhen::ATOMIC : InstrWhen::NEVER;
      return (InstrWhen)(InstrWhen::ON_DEVICE | InstrWhen::WRITE | res);
    }

    template<>
    template<>
    InstrWhen DepTrace<DEVICE>::calcInstrWhen(const llvm::LoadInst& I) const
    {
#     ifdef __SCABBARD_TRACE_HOST_WRITE_TO_GPU_READ
        InstrWhen res = __calcInstrWhen(*I.getPointerOperand());
        if (res == InstrWhen::NEVER)
          return InstrWhen::NEVER;
        res |= (I.isAtomic()) ? InstrWhen::ATOMIC : InstrWhen::NEVER;
        return (InstrWhen)(InstrWhen::ON_DEVICE | InstrWhen::READ | res);
#     else
        return InstrWhen::NEVER;
#     endif
    }

    template<>
    template<>
    InstrWhen DepTrace<DEVICE>::calcInstrWhen(const llvm::CallInst& I) const
    {
      return InstrWhen::NEVER;
    }

    template<>
    template<>
    InstrWhen DepTrace<DEVICE>::calcInstrWhen(const llvm::AtomicRMWInst& I) const
    {
      return (InstrWhen)(InstrWhen::ATOMIC | InstrWhen::ON_DEVICE | InstrWhen::READ | InstrWhen::WRITE);  // this means that the mem is device heap (shared or global doesn't matter)
    }

    template<>
    template<>
    InstrWhen DepTrace<DEVICE>::__calcInstrWhen_rec(const llvm::StoreInst& I) const
    {
      return InstrWhen::NEVER;
    }

    template<>
    template<>
    InstrWhen DepTrace<DEVICE>::__calcInstrWhen_rec(const llvm::LoadInst& I) const
    {
      return InstrWhen::NEVER;
    }

    template<>
    template<>
    InstrWhen DepTrace<DEVICE>::__calcInstrWhen_rec(const llvm::CallInst& I) const
    {
      return InstrWhen::NEVER;
    }

    template<>
    template<>
    InstrWhen DepTrace<DEVICE>::__calcInstrWhen_rec(const llvm::AtomicRMWInst& I) const
    {
      return InstrWhen::NEVER;
    }

    template<>
    template<>
    InstrWhen DepTrace<DEVICE>::__calcInstrWhen_rec(const llvm::AddrSpaceCastInst& I) const
    {
      return InstrWhen::NEVER;
    }

    template<> 
    template<>
    InstrWhen DepTrace<DEVICE>::__calcInstrWhen_rec(const llvm::GetElementPtrInst& I) const
    {
      return InstrWhen::NEVER;
    }

    template<> 
    template<>
    InstrWhen DepTrace<DEVICE>::__calcInstrWhen_rec(const llvm::AllocaInst& I) const
    {
      return InstrWhen::NEVER; // this means that this ptr comes from the stack frame
    }

    template<> 
    template<>
    InstrWhen DepTrace<DEVICE>::__calcInstrWhen_rec(const llvm::Argument& I) const
    { //TODO decide if this is necessary or not
      return InstrWhen::ON_DEVICE;
    }


    template<> 
    template<>
    InstrWhen DepTrace<DEVICE>::calcInstrWhen(const llvm::Instruction& i) const
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




  } // namespace I
} //?namespace scabbard
