/**
 * @file ScabbardPostPass.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief Link time pass manager for inserting references to external library,
 *        that just Creates the scabbard module ctor and makes whatever final changes necessary
 * @version alpha 0.0.1
 * @date 2023-05-22
 *
 * @copyright Copyright (c) 2023
 *
 */

#pragma once

#include "MetadataHandler.hpp"

#include <scabbard/instr-names.def>

#include <llvm/Pass.h> 
#include <llvm/IR/Module.h>
#include <llvm/IR/PassManager.h>
#include <llvm/Linker/Linker.h>
#include <llvm/Bitcode/BitcodeReader.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/ADT/Triple.h>
#include <llvm/Support/MemoryBuffer.h>

#include <cstdlib>
#include <algorithm>

namespace scabbard {
  namespace instr {


    /**
     * @brief Creates the scabbard module ctor and makes whatever final changes necessary
     */
    struct ScabbardPostPass : public llvm::PassInfoMixin<ScabbardPostPass> {

      MetadataHandler& metadata;

      struct {
        llvm::Function* module_ctor = nullptr;
        const std::string module_ctor_name = SCABBARD_CALLBACK_MODULE_CTOR_NAME;

        llvm::FunctionCallee metadata_register$src;
        const std::string metadata_register$src_name = SCABBARD_CALLBACK_REGISTER_SRC_NAME;
        llvm::FunctionCallee metadata_unregister$src;
        const std::string metadata_unregister$src_name = SCABBARD_CALLBACK_UNREGISTER_SRC_NAME;

      } host;

      ScabbardPostPass(MetadataHandler& metadata_);

      llvm::PreservedAnalyses run(llvm::Module& M, llvm::ModuleAnalysisManager& MAM);

      /**
       * @brief just run coded specifically for kernel/device Modules
       * @param M \c llvm::Module& - The device side Module to instrument
       * @param MAM \c llvm::ModuleAnalysisManager& - The Analysis Manager for the Module
       */
      auto run_device(llvm::Module& M, llvm::ModuleAnalysisManager &MAM) -> void;
      /**
       * @brief just run coded specifically for host/CPU Modules
       * @param M \c llvm::Module& - The device side Module to instrument
       * @param MAM \c llvm::ModuleAnalysisManager& - The Analysis Manager for the Module
       */
      auto run_host(llvm::Module& M, llvm::ModuleAnalysisManager &MAM) -> void;


      /**
       * @brief Instrument host module to have all necessary callback functions
       * @param M \c llvm::Module& - The host side Module to instrument
       * @param MAM \c llvm::ModuleAnalysisManager& - The Analysis Manager for the Module
       */
      auto instrCallbacks_host(llvm::Module& M, llvm::ModuleAnalysisManager& MAM) -> void;

      /**
       * @brief Fill in the contents of the module ctor and add it to \c @llvm.global_ctors
       * @param M \c llvm::Module& - The host side Module to instrument
       * @param MAM \c llvm::ModuleAnalysisManager& - The Analysis Manager for the Module
       */
      auto instr_module_ctor_host(llvm::Module& M, llvm::ModuleAnalysisManager& MAM) -> void;

    };

  } //?namespace instr
} //?namespace scabbard