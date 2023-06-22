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
#include <unordered_map>

namespace scabbard {
  namespace instr {

    class ScabbardPassPlugin;

    struct LocResult {
      llvm::GlobalVariable* src_id_ptr = nullptr;
      std::uint32_t line;
      std::uint32_t col;
      llvm::Constant* getLineAsConstant(llvm::LLVMContext& CTX) const;
      llvm::Constant* getColAsConstant(llvm::LLVMContext& CTX) const;
    };


    struct MetadataStore {
      /// @brief global variable for the host
      llvm::GlobalVariable* src_id_ptr_host = nullptr;
      /// @brief global variable for the device 
      llvm::GlobalVariable* src_id_ptr_device = nullptr;
      /// @brief host side copy to the device side global
      llvm::GlobalVariable* src_id_ptr_device_host = nullptr;
      /// @brief host side constant holding the device side variable name
      llvm::GlobalVariable* src_id_ptr_device_host_name = nullptr;
      /// @brief host side constant global for the source filepath
      llvm::GlobalVariable* src_filepath_str = nullptr;
      /// @brief the last module this store was called for (and where in all relevant values reside)
      llvm::Module* last_module = nullptr;
      std::string hex_id_str = "";
    };

    class MetadataHandler {

      typedef std::unordered_map<std::string,MetadataStore> MetadataMap;

      MetadataMap traced_files;
      size_t next = 0ul;
      

    public:

      inline LocResult trace(llvm::Function& F, const llvm::DebugLoc& DI, bool is_device=false);

      const MetadataMap& getMetadataMap() const { return traced_files; }

    protected:

      template<class DINode_t>
      llvm::GlobalVariable* _trace(llvm::Function& F, const DINode_t* DI, bool is_device);


    private:
      void encode_variables(MetadataStore& data, llvm::Module& M, const std::string& filepath, bool is_device);

    };

  } //?namespace instr
} //?namespace scabbard
