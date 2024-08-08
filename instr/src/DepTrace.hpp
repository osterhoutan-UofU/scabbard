/**
 * @file DepTrace.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief A object that is meant to allow the specific dep trace that scabbard requires to occur
 * @version alpha 0.0.1
 * @date 2023-05-16
 *
 * @copyright Copyright (c) 2023
 *
 */
#pragma once

#include <scabbard/Enums.hpp>

#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/SymbolTableListTraits.h>
#include <llvm/ADT/StringMap.h>
#include<llvm/ADT/SmallPtrSet.h>
#include<llvm/ADT/SmallSet.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/DebugInfoMetadata.h>
#include <llvm/IR/DebugLoc.h>

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
      InstrData getInstrData(const InstrT&) const;

    private:
      // InstrData __getInstrData_inst(const llvm::Instruction& I) const;
      InstrData __getInstrData_inst(const llvm::Instruction& i, llvm::SmallSet<llvm::StringRef, 8u>& phiBBVisited) const
      {
        try {
          if (const auto* _i = llvm::dyn_cast_or_null<llvm::StoreInst>(&i)) {
            return __getInstrData_rec(*_i, phiBBVisited);
          } else if (const auto* _i = llvm::dyn_cast_or_null<llvm::LoadInst>(&i)) {
            return __getInstrData_rec(*_i, phiBBVisited);
          } else if (const auto* _i = llvm::dyn_cast_or_null<llvm::CallInst>(&i)) {
            return __getInstrData_rec(*_i, phiBBVisited);
          } else if (const auto* _i = llvm::dyn_cast_or_null<llvm::AtomicRMWInst>(&i)) {
            return __getInstrData_rec(*_i, phiBBVisited);
          } else if (const auto* _i = llvm::dyn_cast_or_null<llvm::AddrSpaceCastInst>(&i)) {
            return __getInstrData_rec(*_i, phiBBVisited);
          } else if (const auto* _i = llvm::dyn_cast_or_null<llvm::GetElementPtrInst>(&i)) {
            return __getInstrData_rec(*_i, phiBBVisited);
          } else if (const auto* _i = llvm::dyn_cast_or_null<llvm::BitCastInst>(&i)) {
            return __getInstrData_rec(*_i, phiBBVisited);
          } else if (const auto* _i = llvm::dyn_cast_or_null<llvm::AllocaInst>(&i)) {
            return __getInstrData_rec(*_i, phiBBVisited);
          } else if (const auto* _i = llvm::dyn_cast_or_null<llvm::IntToPtrInst>(&i)) {
            return __getInstrData_rec(*_i, phiBBVisited);
          } else if (const auto* _i = llvm::dyn_cast_or_null<llvm::PHINode>(&i)) {
            return __getInstrData_phi(*_i, phiBBVisited);
          }
        } catch(...) {
          const auto& loc = i.getDebugLoc();
          const auto& scope = *llvm::dyn_cast_or_null<llvm::DIScope>(loc.getScope());
          const auto& file = *scope.getFile();
          llvm::errs() << "\n[scabbard.instr:ERR] failed to cast IR Instruction to usable sub-type!"
                          "\n[scabbard.instr:ERR]    src loc: \"" << file.getDirectory() << "/" << file.getFilename()
                                                                  << ":" << loc.getLine() << "," << loc.getCol() << "\""
                          "\n[scabbard.instr:ERR]       repr: `";
          i.print(llvm::errs());
          llvm::errs() << "`\n";
        }
        return InstrData::NEVER;
      }

      // InstrData __getInstrData_phi(const llvm::PHINode& PHI) const;
      InstrData __getInstrData_phi(const llvm::PHINode& PHI, llvm::SmallSet<llvm::StringRef, 8u>& phiBBVisited) const
      {
        InstrData res = InstrData::NEVER;
        llvm::SmallSet<llvm::StringRef, 8u> _phiBBVisited(phiBBVisited);
        _phiBBVisited.insert(PHI.getParent()->getName());
        for (const auto& _U : PHI.incoming_values()) {
          if (auto U = llvm::dyn_cast_or_null<llvm::Instruction>(_U.get())) {
            if (not _phiBBVisited.contains(U->getParent()->getName())) {
              _phiBBVisited.insert(U->getParent()->getName());
              res |= __getInstrData_val(*U, _phiBBVisited);
            }
          } else if (auto A = llvm::dyn_cast_or_null<llvm::Argument>(_U.get())) {
            res |= __getInstrData_rec(*A, _phiBBVisited);
          }
        }
        // visits = 0ul;
        // phiBBVisited.clear();
        return res;
      }
      // InstrData __getInstrData_val(const llvm::Value& V) const;
      InstrData __getInstrData_val(const llvm::Value& V, llvm::SmallSet<llvm::StringRef, 8u>& phiBBVisited) const
      {
        try {
        // handle globals
        // if (const auto* _g = llvm::dyn_cast_or_null<llvm::GlobalVariable>(&V)) {
        if (const auto* _g = llvm::dyn_cast_or_null<llvm::GlobalValue>(&V)) {
          const auto name = V.getName();
          if (globalDeviceMem.find(name) != globalDeviceMem.end()) {
            return InstrData::DEVICE_HEAP | ((MT == HOST) ? InstrData::ON_HOST : InstrData::ON_DEVICE);
          }
          if (globalManagedMem.find(name) != globalManagedMem.end()) {
            return InstrData::MANAGED_MEM | ((MT == HOST) ? InstrData::ON_HOST : InstrData::ON_DEVICE);
          }
        } else
          // handle local function args/registers
          if (const auto* _A = llvm::dyn_cast_or_null<llvm::Argument>(&V)) {
            return __getInstrData_rec(*_A, phiBBVisited); //NOTE: this might cause issues for the host
          }
        // handle derived values (aka instructions)
        if (const auto* _I = llvm::dyn_cast_or_null<llvm::Instruction>(&V)) {
          return __getInstrData_inst(*_I, phiBBVisited);
        }
        } catch(...) {
          llvm::errs() << "\n[scabbard.instr:ERR] failed to cast IR Value to usable sub-type!"
                          "\n[scabbard.instr:ERR]    src loc: <unknown>"
                          "\n[scabbard.instr:ERR]       repr: `";
          V.print(llvm::errs());
          llvm::errs() << "`\n";
        }
        // unknown Value type...
        return InstrData::NEVER;
      }
      template<class InstrT>
      InstrData __getInstrData_rec(const InstrT& I, llvm::SmallSet<llvm::StringRef, 8u>& phiBBVisited) const;

    };

    typedef DepTrace<HOST> DepTraceHost;
    typedef DepTrace<DEVICE> DepTraceDevice;

    // template<>
    // const std::unordered_set<const llvm::StringRef> DepTrace<HOST>::funcsToInstr{"hipMalloc","hipMemcpy","__hipPushCallConfiguration", "__hipMallocManaged", "hipMemAdvise", "hipMemSet"};

    // template<>
    // const std::unordered_set<const llvm::StringRef> DepTrace<DEVICE>::funcsToInstr{};

  
    llvm::raw_ostream& operator << (llvm::raw_ostream& out, const InstrData& data) noexcept;

  } // namespace instr
} //?namespace scabbard
