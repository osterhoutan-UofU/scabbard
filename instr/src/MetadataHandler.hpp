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
#include <llvm/ADT/StringSet.h>

#include <string>
#include <cstdint>
#include <unordered_map>
#include <mutex>

namespace scabbard {
  namespace instr {


    struct LocResult {
      llvm::GlobalVariable* src_id_ptr = nullptr;
      std::uint32_t line;
      std::uint32_t col;
      llvm::Constant* getLineAsConstant(llvm::LLVMContext& CTX) const;
      llvm::Constant* getColAsConstant(llvm::LLVMContext& CTX) const;
    };


    struct MetadataStore {
      /// @brief the filepath to the src in question
      const std::string src_path;
      llvm::StringSet<> in_modules;
      /// @brief boolean of if this source file is referenced in the host module
      bool on_host = false;
      /// @brief boolean of if this source file is referenced in the host module
      bool on_device = false;
      /// @brief the id in a hexidecimal string format (omitting the `0x` prefix, min 4 chars)
      const std::string hex_id_str;
      /// @brief the src id string
      const size_t id;
      MetadataStore(const std::string& src_path_, size_t id_); 
      /**
       * @brief Get the hexidecimal string representation of the provided \param val
       * @param val \c size_t - the unsigned integer version of the number to convert
       * @return \c std::string - the resulting hexidecimal string
       */
      static std::string get_hex_str(size_t val);
      /**
       * @brief Get a string containing the variable name for a source id global variable
       * @param is_device \c bool - if this is for a device module or a host module
       * @return \c std::string - the name of the variable
       */
      std::string get_var_name(bool is_device) const;
      /**
       * @brief Get a string containing the name for the variable that contains the string holding the source file data
       */
      std::string get_str_var_name() const;
    };

    class MetadataHandler {

      typedef std::unordered_map<std::string,MetadataStore> MetadataMap;

      MetadataMap traced_files;
      size_t next = 0ul;
      
      std::mutex mut;

    public:

      LocResult trace(llvm::Function& F, const llvm::DebugLoc& DI, bool is_device);

      const MetadataMap& getMetadataMap() const { return traced_files; }

    protected:

      llvm::GlobalVariable* _trace_scope(llvm::Function& F, const llvm::DIScope* DI, bool is_device);
      llvm::GlobalVariable* _trace_file(llvm::Function& F, const llvm::DIFile* DI, bool is_device);


    private:
      llvm::GlobalVariable* encode_variables(MetadataStore& data, llvm::Module& M, bool is_device);

    };

  } //?namespace instr
} //?namespace scabbard
