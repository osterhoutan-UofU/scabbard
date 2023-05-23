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

#include <unordered_map>

namespace scabbard {
  namespace instr {

    // typedef std::function<bool(const llvm::Value&,const llvm::CallBase&)> CallCheck_t;

    // auto BASE_CHECK(const llvm::Value& V, const llvm::CallBase& C) -> bool { 
    //         return V == *C.getArgOperand(0);
    // }

    // const std::unordered_map<std::string, CallCheck_t> funcsOfInterest = {
    //   {"", BASE_CHECK},
    //   {"<none>", BASE_CHECK}
    // };

    // << ------------------------------------------------------------------------------------------ >> 

    template<>
    DepTrace<DEVICE>::DepTrace(const llvm::Module& M)
      : DepTrace()
    {
      for (const auto& g : M.getGlobalList())
        if (const auto* mg = M.getNamedGlobal(llvm::Twine(g.getName(), ".managed").getSingleStringRef())) {
          globalManagedMem.insert(std::make_pair(g.getName(),mg));
        } else if (not g.getName().endswith(".managed")) {
          globalDeviceMem.insert(std::make_pair(g.getName(),&g));
        }
    }

    // << ------------------------------------------------------------------------------------------ >> 

    template<>
    template<>
    InstrData DepTrace<DEVICE>::calcInstrWhen(const llvm::StoreInst& I) const
    {
      InstrData res = __calcInstrWhen_val(*I.getPointerOperand());
      if (res == InstrData::NEVER)
        return InstrData::NEVER;
      res |= (I.isAtomic()) ? InstrData::ATOMIC_MEM : InstrData::NEVER;
      return (InstrData)(InstrData::ON_DEVICE | InstrData::WRITE | res);
    }

    template<>
    template<>
    InstrData DepTrace<DEVICE>::calcInstrWhen(const llvm::LoadInst& I) const
    {
#     ifdef __SCABBARD_TRACE_HOST_WRITE_TO_GPU_READ
      InstrData res = __calcInstrWhen_val(*I.getPointerOperand());
      if (res == InstrData::NEVER)
        return InstrData::NEVER;
      res |= (I.isAtomic()) ? InstrData::ATOMIC : InstrData::NEVER;
      return (InstrData)(InstrData::ON_DEVICE | InstrData::READ | res);
#     else
      return InstrData::NEVER;
#     endif
    }

    // template<>
    // template<>
    // InstrData DepTrace<DEVICE>::calcInstrWhen(const llvm::CallInst& I) const
    // {
    //   return InstrData::NEVER;
    // }

    template<>
    template<>
    InstrData DepTrace<DEVICE>::calcInstrWhen(const llvm::AtomicRMWInst& I) const
    {
      return (InstrData)(InstrData::ATOMIC_MEM | InstrData::ON_DEVICE | InstrData::READ | InstrData::WRITE);  // this means that the mem is device heap (shared or global doesn't matter)
    }

    // << ------------------------------------------------------------------------------------------ >> 

    template<>
    template<>
    InstrData DepTrace<DEVICE>::__calcInstrWhen_rec(const llvm::LoadInst& I) const
    {
      return __calcInstrWhen_val(*I.getPointerOperand());
    }

    template<>
    template<>
    InstrData DepTrace<DEVICE>::__calcInstrWhen_rec(const llvm::CallInst& I) const
    {
      return InstrData::NEVER; // TODO
    }

    template<>
    template<>
    InstrData DepTrace<DEVICE>::__calcInstrWhen_rec(const llvm::AtomicRMWInst& I) const
    {
      return InstrData::NEVER;
    }

    template<>
    template<>
    InstrData DepTrace<DEVICE>::__calcInstrWhen_rec(const llvm::AddrSpaceCastInst& I) const
    {
      return __calcInstrWhen_val(*I.getPointerOperand());
    }

    template<>
    template<>
    InstrData DepTrace<DEVICE>::__calcInstrWhen_rec(const llvm::GetElementPtrInst& I) const
    {
      return __calcInstrWhen_val(*I.getPointerOperand());
    }

    template<>
    template<>
    InstrData DepTrace<DEVICE>::__calcInstrWhen_rec(const llvm::AllocaInst& I) const
    {
      //check if this is used in a hipMalloc
      // for (const auto& U : I.users()) {
      //   if (const auto& CI = llvm::dyn_cast<llvm::CallInst>(U)) {
      //     const auto p = funcsOfInterest.find(CI.getName().str());
      //     if (p != funcsOfInterest.end()) {
      //       if (p.second(I,CI))
      //         return InstrData::ON_DEVICE;
      //     }
      //   }
      // }
      return InstrData::NEVER; // this means that this ptr comes from the stack frame
    }

    template<>
    template<>
    InstrData DepTrace<DEVICE>::__calcInstrWhen_rec(const llvm::Argument& I) const
    { //TODO decide if this is necessary or not
      return InstrData::ON_DEVICE;
    }


    // << ------------------------------------------------------------------------------------------ >> 

    template<>
    template<>
    InstrData DepTrace<DEVICE>::calcInstrWhen(const llvm::Instruction& i) const
    {
      if (auto* _i = llvm::dyn_cast<llvm::StoreInst>(&i)) {
        return calcInstrWhen(*_i);
      } else if (auto* _i = llvm::dyn_cast<llvm::LoadInst>(&i)) {
        return calcInstrWhen(*_i);
      // } else if (auto* _i = llvm::dyn_cast<llvm::CallInst>(&i)) {
      //   return calcInstrWhen(*_i);
      } else if (auto _i = llvm::dyn_cast<llvm::AtomicRMWInst>(&i)) {
        return calcInstrWhen(*_i);
      }
      return InstrData::NEVER;
    }


    


  } // namespace I
} //?namespace scabbard
