/**
 * @file ScabbardLinkPass.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief Link time pass manager for inserting references to external library
 * @version alpha 0.0.1
 * @date 2023-05-22
 *
 * @copyright Copyright (c) 2023
 *
 */

#pragma once

#include "loadModule.hpp"

#include <scabbard/instr-names.def>

#include <llvm/Pass.h> 
#include <llvm/IR/Module.h>
#include <llvm/IR/PassManager.h>
#include <llvm/Linker/Linker.h>
#include <llvm/Bitcode/BitcodeReader.h>
#include <llvm/ADT/Triple.h>
#include <llvm/Support/MemoryBuffer.h>

#include <cstdlib>
#include <algorithm>

namespace scabbard {
  namespace instr {

    struct ScabbardLinkPass : public llvm::PassInfoMixin<ScabbardLinkPass> {

      llvm::PreservedAnalyses run(llvm::Module &M, llvm::ModuleAnalysisManager &MAM) {
        //DEBUG msg
        llvm::errs() << "\n[scabbard::instr::link::DBG] link pass has been run on: `" << M.getSourceFileName() << "`\n"; 

        const llvm::Triple target(M.getTargetTriple());
        if (not target.isAMDGPU())  // checks for both amdgcn & r600 arch(s) (might need to restrict this to just amdgcn with `isAMDGCN()`)
          return llvm::PreservedAnalyses::all();  // To support hip on Nvidia GPUs we might need to also run this for nvptx arch(s) (this might be the same as supporting CUDA though)
        //else    
        if (M.getFunction(SCABBARD_DEVICE_CALLBACK_APPEND_MEM_NAME) == nullptr) {
          llvm::errs() << "\n[scabbard::instr::link::ERROR] link pass discovered a device function that was not instrumented!!\n";
          return llvm::PreservedAnalyses::all();
        }
        const auto SCABBARD_PATH = std::getenv("SCABBARD_PATH");
        if (SCABBARD_PATH == nullptr) {
          llvm::errs() << "\n[scabbard::instr::link::ERROR] Env var `SCABBARD_PATH` was undefined could not identify instrumentation file location!!\n";
          return llvm::PreservedAnalyses::all();
        }
        const std::string LIBTRACE_DEVICE_PATH = std::string(SCABBARD_PATH) + "/libtrace-device.bc";
        auto _buf = llvm::MemoryBuffer::getFile(LIBTRACE_DEVICE_PATH);
        if (not _buf) {
          llvm::errs() << "\n[scabbard::instr::link::ERROR] Could not OPEN `" << LIBTRACE_DEVICE_PATH << "`!!\n";
          return llvm::PreservedAnalyses::all();
        }
        // auto _traceModules_uptr = _buf.get();
        // auto _traceModules = llvm::getBitcodeFileContents(*_traceModules_uptr);
        // auto _traceModules = llvm::getBitcodeFileContents(*_buf.get());
        // if (not _traceModules) {
        //   llvm::errs() << "\n[scabbard::instr::link::ERROR] failed to READ the bitcode ``library'' libtrace-device in!!"
        //                   "\n[scabbard::instr::link::ERROR] error as follows: " << _traceModules.takeError() << "\n";
        //   // throw "forced-err-str";
        //   return llvm::PreservedAnalyses::all();
        // }
        // auto _traceModule = _traceModules.get().Mods[0].getLazyModule(M.getContext(), true, true);
        // if (not _traceModule) {
        //   llvm::errs() << "\n[scabbard::instr::link::ERROR] failed to lazy PARSE the bitcode ``library'' libtrace-device in!!\n";
        //   return llvm::PreservedAnalyses::all();
        // }
        // std::unique_ptr<llvm::Module>& traceModule = _traceModule.get();
        std::unique_ptr<llvm::Module>& traceModule = loadModule(_bug.get());
        if (not llvm::Triple(traceModule->getTargetTriple()).isAMDGPU()) {
          llvm::errs() << "\n[scabbard::instr::link::ERROR] could not find the device module in the libtrace-device bitcode \"library\"!!\n";
          return llvm::PreservedAnalyses::all();
        }
        if (llvm::Linker::linkModules(M, std::move(traceModule))) {
          llvm::errs() << "\n[scabbard::instr::link::ERROR] the llvm linker encountered an error while linking!!\n";
          return llvm::PreservedAnalyses::none();
        }
        return llvm::PreservedAnalyses::none();
      }

    };

  } //?namespace instr
} //?namespace scabbard