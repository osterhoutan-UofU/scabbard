/**
 * @file MetadataParser.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief a utility class for organizing and handling lazy storage of appropriate metadata in
 *        a runtime accessible manner
 * @version alpha 0.0.1
 * @date 2023-06-15
 *
 * @copyright Copyright (c) 2023
 *
 */

#pragma once

#include <scabbard/MetadataIO.hpp>

#include <llvm/IR/Function.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DebugInfoMetadata.h>
#include <llvm/IR/DebugLoc.h>
#include <llvm/ADT/StringSet.h>

#include <string>
#include <cstdint>
#include <unordered_map>
#include <mutex>

namespace scabbard {
  namespace instr {


    struct LocResult {
      uint64_t srcID;
      llvm::Constant* get_as_constant(llvm::LLVMContext& CTX) const;
    };


    class MetadataHandler {

      const std::string metadata_file;
      const std::string metadata_file_lock_file;

      MetadataJSONFile_t metadata;
      size_t next = 0ul;

    public:

      MetadataHandler(const std::string& metadata_file_)
        : metadata_file(metadata_file_), metadata_file_lock_file(metadata_file_+".lock")
      {}

      LocResult trace(llvm::Function& F, const llvm::DebugLoc& DI, const ModuleType MOD_TY);


    protected:

      LocResult _trace_scope(llvm::Function& F, const llvm::DebugLoc& DIL, const llvm::DIScope* DIS, const ModuleType MOD_TY);
      LocResult _trace_file(llvm::Function& F, const llvm::DebugLoc& DIL, const llvm::DIFile* DIF, const ModuleType MOD_TY);


    private:

    };

  } //?namespace instr
} //?namespace scabbard
