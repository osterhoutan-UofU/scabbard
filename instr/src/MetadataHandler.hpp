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

#include <llvm/IR/Function.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DebugInfoMetadata.h>
#include <llvm/IR/DebugLoc.h>

#include <string>
#include <cstdint>
#include <map>

namespace scabbard {
  namespace instr {



    struct LocResult {
      const llvm::GlobalVariable* src_id_ptr = nullptr;
      const std::uint32_t line;
      const std::uint32_t col;
    };


    struct MetadataStore {
      llvm::GlobalVariable* src_id_ptr_host = nullptr;
      llvm::GlobalVariable* src_id_ptr_device = nullptr;
      llvm::GlobalVariable* src_id_ptr_device_host = nullptr;
      llvm::GlobalVariable* src_filepath_str = nullptr;
      // llvm::DIFile* debugInfo_host = nullptr;
      // llvm::DIFile* debugInfo_device = nullptr;
    };

    class MetadataHandler {

      std::map<std::string,MetadataStore> traced_files;
      

    public:

      inline LocResult trace(llvm::Function& F, const llvm::DebugLoc* DI, bool is_device=false);

    protected:

      template<class DINode_t>
      const llvm::GlobalVariable* _trace(llvm::Function& F, const DINode_t* DI, bool is_device);


    };

  } //?namespace instr
} //?namespace scabbard
