/**
 * @file DepTrace_HOST.cpp
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
#include <llvm/IR/Constants.h>

#include <unordered_map>

namespace scabbard {
  namespace instr {

    typedef std::function<bool(const llvm::Value&,const llvm::CallInst&)> CallCheck_t;

    auto BASE_CHECK(const llvm::Value& V, const llvm::CallInst& C) -> bool {
      return (&V) == C.getArgOperand(0); // compare ptr's and hope llvm does not make copies of IR objects
    }
    
    const std::unordered_map<std::string, CallCheck_t> funcsOfInterest = {
        { "hipMalloc", BASE_CHECK },
        {
          "hipMemcpy", 
          [](const llvm::Value& V, const llvm::CallInst& C) -> bool {
            const llvm::Value* _V = &V;
            if (auto* TrTy = llvm::dyn_cast<llvm::ConstantInt>(C.getArgOperand(3))) {
              // get which 
              switch (TrTy->getSExtValue()) {
                case 1: // H->D
                  return C.getArgOperand(0) == _V;
                case 2: // D->H
                  return C.getOperand(1) == _V;
                case 3: // D->D
                  return (C.getArgOperand(0) == _V) || (C.getArgOperand(1) == _V);
                case 0: // H->H
                default: // Unknown
                  return false;
              }
            }
            llvm::errs() << "\n[scabbard::ERROR] `hipMemcpy`'s `hipMemcpyKind` was not as expected\n";
            LLVM_BUILTIN_UNREACHABLE;
          }
        },
        { "hipHostRegister", BASE_CHECK },
        { "__hipMallocManaged", BASE_CHECK },
        { "hipMemAdvise", BASE_CHECK },
      };

    // << ------------------------------------------------------------------------------------------ >> 

    const llvm::Value* get_next(const llvm::Value* V) {
      if (const auto* BCI = llvm::dyn_cast<llvm::BitCastInst>(V)) {
        llvm::dbgs() << "\n[scabbard::host::DBG_INFO] traversing through a `bitcast` inst\n";
        return get_next(BCI->getOperand(0));
      } else if (const auto* GEPI = llvm::dyn_cast<llvm::GetElementPtrInst>(V)) {
        llvm::dbgs() << "\n[scabbard::host::DBG_INFO] traversing through a `getelementptr` inst\n";
        return get_next(GEPI->getPointerOperand());
      } else if (const auto* ASCI = llvm::dyn_cast<llvm::AddrSpaceCastInst>(V)) {
        llvm::dbgs() << "\n[scabbard::host::DBG_INFO] traversing through a `addrspacecast` inst\n";
        return get_next(ASCI->getPointerOperand());
      } else if (const auto* GV = llvm::dyn_cast<llvm::GlobalValue>(V)) {
        llvm::dbgs() << "\n[scabbard::host::DBG_INFO] traversing SUCCESS found a global !!\n";
        return GV;
      }
      llvm::dbgs() << "\n[scabbard::host::DBG_ERROR] traversing FAILURE could not find a global or viable path !!\n";
      return V;
    }

    template<>
    DepTrace<HOST>::DepTrace(const llvm::Module& M)
      : DepTrace()
    {
      if (const auto* F = llvm::dyn_cast<llvm::Function>(M.getFunction("__hip_module_ctor"))) {
        llvm::dbgs() << "\n[scabbard::host::DBG_INFO] this module contains a __hip_module_ctor ctor function\n\n";
        for (const auto& bb : F->getBasicBlockList())
          for (const auto& i : bb.getInstList())
            if (const auto* call = llvm::dyn_cast<llvm::CallInst>(&i)) {
              if (call->getCalledFunction()->getName() == "__hipRegisterVar") {
                llvm::dbgs() << "\n[scabbard::host::DBG_INFO] found a `__hipRegisterVar` call!\n";
                if (const auto* global = llvm::dyn_cast_or_null<llvm::GlobalVariable>(get_next(call->getArgOperand(1)))) {
                  globalDeviceMem.insert(std::make_pair(global->getName(),global));
                  llvm::dbgs() << "\n[scabbard::host::DBG_INFO] added `" << global->getName() << "` to list of global device mem.\n";
                } else {
                  llvm::dbgs() << "\n[scabbard::host::DBG_WARN] Consistency Error, `__hip_module_ctor` contains a call to `__hipRegisterVar` that is not a global variable\n\n";
                }
              } else if (call->getCalledFunction()->getName() == "__hipRegisterManagedVar") {
                llvm::dbgs() << "\n[scabbard::host::DBG_INFO] found a `__hipRegisterManagedVar` call!\n";
                if (const auto* global = llvm::dyn_cast_or_null<llvm::GlobalVariable>(get_next(call->getArgOperand(1)))) {
                  globalManagedMem.insert(std::make_pair(global->getName(),global));
                  llvm::dbgs() << "\n[scabbard::host::DBG_INFO] added `" << global->getName() << "` to list of global managed mem.\n";
                } else {
                  llvm::dbgs() << "\n[scabbard::host::DBG::WARNING] Consistency Error, `__hip_module_ctor` contains a call to `__hipRegisterManagedVar` that is not a global variable\n\n";
                }
              }
            }
      } else {   // this module has no HIP components
        llvm::dbgs() << "\n[scabbard::host::DBG_WARN] module that contains no hip components\n\n";
      }
    }


    // << ------------------------------------------------------------------------------------------ >> 

    template<>
    template<>
    InstrData DepTrace<HOST>::calcInstrWhen(const llvm::StoreInst& I) const
    {
#     ifdef __SCABBARD_TRACE_HOST_WRITE_TO_GPU_READ
      InstrData res = __calcInstrWhen_val(*I.getPointerOperand());
      if (res == InstrData::NEVER)
        return InstrData::NEVER;
      res |= (I.isAtomic()) ? InstrData::ATOMIC_MEM : InstrData::NEVER;
      return (InstrData)(InstrData::ON_HOST | InstrData::WRITE | res);
#     else
      return InstrData::NEVER;
#     endif
    }

    template<>
    template<>
    InstrData DepTrace<HOST>::calcInstrWhen(const llvm::LoadInst& I) const
    {
      InstrData res = __calcInstrWhen_val(*I.getPointerOperand());
      if (res == InstrData::NEVER)
        return InstrData::NEVER;
      res |= (I.isAtomic()) ? InstrData::ATOMIC_MEM : InstrData::NEVER;
      return (InstrData)(InstrData::ON_HOST | InstrData::READ | res);
    }

    // template<> 
    // template<>
    // InstrData DepTrace<HOST>::calcInstrWhen(const llvm::CallInst& I) const
    // {
    //   return InstrData::NEVER; //TODO
    // }

    template<> 
    template<>
    InstrData DepTrace<HOST>::calcInstrWhen(const llvm::AtomicRMWInst& I) const
    {
      return __calcInstrWhen_val(I);
    }

    // << ------------------------------------------------------------------------------------------ >> 

    template<> 
    template<>
    InstrData DepTrace<HOST>::__calcInstrWhen_rec(const llvm::LoadInst& I) const
    {
      return __calcInstrWhen_val(*I.getPointerOperand());
    }

    template<> 
    template<>
    InstrData DepTrace<HOST>::__calcInstrWhen_rec(const llvm::CallInst& I) const
    {
      return InstrData::NEVER;
    }

    template<> 
    template<>
    InstrData DepTrace<HOST>::__calcInstrWhen_rec(const llvm::AtomicRMWInst& I) const
    {
      auto res = __calcInstrWhen_val(*I.getPointerOperand());
      if (res == InstrData::NEVER)
        return InstrData::NEVER;
      return (InstrData)(InstrData::ATOMIC_MEM | res);
    }

    template<> 
    template<>
    InstrData DepTrace<HOST>::__calcInstrWhen_rec(const llvm::AddrSpaceCastInst& I) const
    {
      return __calcInstrWhen_val(*I.getPointerOperand());
    }

    template<> 
    template<>
    InstrData DepTrace<HOST>::__calcInstrWhen_rec(const llvm::GetElementPtrInst& I) const
    {
      return __calcInstrWhen_val(*I.getPointerOperand());
    }

    template<> 
    template<>
    InstrData DepTrace<HOST>::__calcInstrWhen_rec(const llvm::AllocaInst& I) const
    {
      //check if this is used in a hipMalloc
      for (const auto& U : I.uses()) {
        if (const auto* CI = llvm::dyn_cast<llvm::CallInst>(U.get())) {
          if (auto p = funcsOfInterest.find(CI->getName().str()); p != funcsOfInterest.end()) {
            if (p->second(I,*CI))
              return InstrData::ON_HOST;
          }
        }
      }
      return InstrData::NEVER; // this means that this ptr comes from the stack frame
    }

    template<> 
    template<>
    InstrData DepTrace<HOST>::__calcInstrWhen_rec(const llvm::BitCastInst& I) const
    {
      return __calcInstrWhen_val(*I.getOperand(0));
    }

    template<> 
    template<>
    InstrData DepTrace<HOST>::__calcInstrWhen_rec(const llvm::Argument& A) const
    {
      const auto& TY = *A.getType();
      if (A.hasByRefAttr() || TY.isPointerTy() /* || TY.isArrayTy() || TY.isPtrOrPtrVectorTy() */) {
        // we don't know for certain if this is device mem or not, 
        // ==> so we will check before emitting trace (aka add the runtime conditional flag)
        return (InstrData)(InstrData::ON_HOST | InstrData::_RUNTIME_CONDITIONAL);
      } // else // not of concern at all
      return InstrData::NEVER;
    }


    // << ------------------------------------------------------------------------------------------ >> 

    template<> 
    template<>
    InstrData DepTrace<HOST>::calcInstrWhen(const llvm::Instruction& i) const
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
  



  } // namespace instr
} //?namespace scabbard
