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

namespace scabbard {
  namespace instr {

    template<>
    DepTrace<HOST>::DepTrace(const llvm::Module& M)
      : DepTrace()
    {
      if (const auto* F = llvm::dyn_cast<llvm::Function>(M.getFunction("__hip_module_ctor"))) {
        for (const auto& bb : F->getBasicBlockList())
          for (const auto& i : bb.getInstList())
            if (const auto* call = llvm::dyn_cast<llvm::CallInst>(&i)) {
              if (call->getName() == "__hipRegisterVar") {
                if (const auto* global = llvm::dyn_cast<llvm::GlobalVariable>(call->getArgOperand(2))) {
                  globalDeviceMem.addNodeToList(const_cast<llvm::GlobalVariable*>(global));
                } else {
                  llvm::errs() << "\n[scabbard::WARNING] Consistency Error, `__hip_module_ctor` contains a call to `__hipRegisterVar` that is not a global variable\n\n";
                }
              } else if (call->getName() == "__hipRegisterManagedVar") {
                if (const auto* global = llvm::dyn_cast<llvm::GlobalVariable>(call->getArgOperand(2))) {
                  globalManagedMem.addNodeToList(const_cast<llvm::GlobalVariable*>(global));
                } else {
                  llvm::errs() << "\n[scabbard::WARNING] Consistency Error, `__hip_module_ctor` contains a call to `__hipRegisterManagedVar` that is not a global variable\n\n";
                }
              }
            }
      } // else   // this module has no HIP components
    }

    template<> template<>
    InstrWhen DepTrace<HOST>::calcInstrWhen(const llvm::StoreInst& I) const
    {
      return InstrWhen::NEVER;
    }

    template<> template<>
    InstrWhen DepTrace<HOST>::calcInstrWhen(const llvm::LoadInst& I) const
    {
      return InstrWhen::NEVER;
    }

    template<> template<>
    InstrWhen DepTrace<HOST>::calcInstrWhen(const llvm::CallInst& I) const
    {
      return InstrWhen::NEVER;
    }

    template<> template<>
    InstrWhen DepTrace<HOST>::calcInstrWhen(const llvm::AtomicRMWInst& I) const
    {
      return __calcInstrWhen(I);
    }

    template<> template<>
    InstrWhen DepTrace<HOST>::__calcInstrWhen_rec(const llvm::StoreInst& I) const
    {
      return InstrWhen::NEVER;
    }

    template<> template<>
    InstrWhen DepTrace<HOST>::__calcInstrWhen_rec(const llvm::LoadInst& I) const
    {
      return InstrWhen::NEVER;
    }

    template<> template<>
    InstrWhen DepTrace<HOST>::__calcInstrWhen_rec(const llvm::CallInst& I) const
    {
      return InstrWhen::NEVER;
    }

    template<> template<>
    InstrWhen DepTrace<HOST>::__calcInstrWhen_rec(const llvm::AtomicRMWInst& I) const
    {
      const auto ptr_op = I.getPointerOperand();
      if (const auto ptr = llvm::dyn_cast<llvm::GlobalVariable>(ptr_op)) {

      }
      return InstrWhen::NEVER;
    }

    template<> template<>
    InstrWhen DepTrace<HOST>::__calcInstrWhen_rec(const llvm::AddrSpaceCastInst& I) const
    {
      return InstrWhen::NEVER;
    }

    template<> template<>
    InstrWhen DepTrace<HOST>::__calcInstrWhen_rec(const llvm::GetElementPtrInst& I) const
    {
      return InstrWhen::NEVER;
    }

    template<> template<>
    InstrWhen DepTrace<HOST>::__calcInstrWhen_rec(const llvm::AllocaInst& I) const
    {
      return InstrWhen::NEVER; // this means that this ptr comes from the stack frame
    }

    template<> template<>
    InstrWhen DepTrace<HOST>::__calcInstrWhen_rec(const llvm::Argument& I) const
    {
      // we don't know for certain if this is device mem or not, 
      // ==> so we will check before emitting trace (aka add the runtime conditional flag)
      return (InstrWhen)(InstrWhen::ON_HOST | InstrWhen::_RUNTIME_CONDITIONAL);
    }


    template<> template<>
    InstrWhen DepTrace<HOST>::calcInstrWhen(const llvm::Instruction& i) const
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

  } // namespace instr
} //?namespace scabbard
