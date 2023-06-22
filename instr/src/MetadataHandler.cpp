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

#include "MetadataHandler.hpp"

#include <scabbard/instr-names.def>

#include <llvm/IR/DerivedTypes.h> 
#include <llvm/IR/IRBuilder.h>

#include <cassert> 
#include <algorithm>
#include <iomanip>
#include <sstream>


#define SCABBARD_METADATA_INSTR_srcId_VAR_HOST(hex_id_str) (SCABBARD_METADATA_INSTR_srcId_VAR_HOST_PREFIX+(hex_id_str))
#define SCABBARD_METADATA_INSTR_srcPath_VAR_HOST(hex_id_str) (SCABBARD_METADATA_INSTR_srcPath_VAR_HOST_PREFIX+(hex_id_str))
#define SCABBARD_METADATA_INSTR_srcId_VAR_DEVICE(hex_id_str) (SCABBARD_METADATA_INSTR_srcId_VAR_DEVICE_PREFIX+(hex_id_str))
#define SCABBARD_METADATA_INSTR_srcId_VAR_DEVICE_NAME(hex_id_str) (SCABBARD_METADATA_INSTR_srcId_VAR_DEVICE_PREFIX "name$"+(hex_id_str))

namespace scabbard {
  namespace instr {


    llvm::Constant* LocResult::getLineAsConstant(llvm::LLVMContext& CTX) const 
    {
      return llvm::ConstantInt::get(llvm::IntegerType::get(CTX, 32u), llvm::APInt(32u, line, false)); 
    }
    llvm::Constant* LocResult::getColAsConstant(llvm::LLVMContext& CTX) const 
    {
      return llvm::ConstantInt::get(llvm::IntegerType::get(CTX, 32u), llvm::APInt(32u, col, false)); 
    }


    LocResult MetadataHandler::trace(llvm::Function& F, const llvm::DebugLoc& DI, bool is_device)
    {
      assert(DI && "[scabbard::instr::metadata::ERROR] The Debug location data does not exist! Try compiling with debug data!");
      return {_trace(F, DI.getScope(), is_device), DI.getLine(), DI.getCol()};
    }



    template<>
    llvm::GlobalVariable* MetadataHandler::_trace(llvm::Function& F, const llvm::DIScope* DI, bool is_device)
    {
      return _trace(F, DI->getFile(), is_device);
    }

    template<>
    llvm::GlobalVariable* MetadataHandler::_trace(llvm::Function& F, const llvm::DIFile* DI, bool is_device)
    {
      std::string filename = (DI->getDirectory() + "/" + DI->getFilename()).str();
      MetadataStore data;
      //TODO I will need to handle references to the same source file in multiple modules
      const auto iter = traced_files.find(filename);
      llvm::Module& M = *F.getParent();
      if (iter != traced_files.end()) {
        iter->second.last_module = &M;
        if (is_device) { // if we're in a device module and have this source file in the cache
          if (auto src_id_ptr_device = M.getGlobalVariable(SCABBARD_METADATA_INSTR_srcId_VAR_DEVICE(filename)))
            return (iter->second.src_id_ptr_device = src_id_ptr_device);
          encode_variables(iter->second, M, filename, true);
          return iter->second.src_id_ptr_device; // just return the old reference
        }
        // else is on host
        if (auto src_id_ptr = M.getGlobalVariable(SCABBARD_METADATA_INSTR_srcId_VAR_DEVICE(filename)))
          return (iter->second.src_id_ptr_host = src_id_ptr);
        encode_variables(iter->second, M, filename, false);
        return iter->second.src_id_ptr_host;
      }
      //[X]TODO insert/update a "new" entry
      std::stringstream tmp;
      tmp << "0x" << std::setfill('0') << std::setw(4u) << std::hex << next++;
      data.hex_id_str = tmp.str();
      encode_variables(data,M,filename,is_device);
      data.last_module = &M;
      traced_files[filename] = data;
      if (is_device)
        return data.src_id_ptr_device;
      return data.src_id_ptr_host;
    }


    // template<class DINode_t>
    // llvm::GlobalVariable* MetadataHandler::_trace(llvm::Module& M, const DINode_t* DI)
    // {
    //   return nullptr;
    // }

    void MetadataHandler::encode_variables(MetadataStore& data, llvm::Module& M, const std::string& filepath, bool is_device)
    {
      llvm::IRBuilder IRB(M.getContext());
      auto* int64_ty = llvm::IntegerType::get(M.getContext(), 64u);
      if (is_device) {
        // output device side source metadata global
        data.src_id_ptr_device = llvm::dyn_cast_or_null<llvm::GlobalVariable>(M.getOrInsertGlobal(SCABBARD_METADATA_INSTR_srcId_VAR_DEVICE(data.hex_id_str), int64_ty));
        data.src_id_ptr_device->setInitializer(llvm::Constant::getIntegerValue(int64_ty, llvm::APInt(0u, 64ul)));
        data.src_id_ptr_device->setLinkage(llvm::GlobalValue::LinkageTypes::PrivateLinkage);
      } else {
        auto* char_ty = llvm::IntegerType::get(M.getContext(), 8u);
        auto* charArr_ty = llvm::ArrayType::get(char_ty, filepath.size()+1);
        data.src_id_ptr_host = llvm::dyn_cast_or_null<llvm::GlobalVariable>(M.getOrInsertGlobal(SCABBARD_METADATA_INSTR_srcId_VAR_DEVICE(data.hex_id_str), int64_ty));
        data.src_id_ptr_host->setInitializer(llvm::Constant::getIntegerValue(int64_ty, llvm::APInt(0u, 64ul)));
        data.src_id_ptr_host->setLinkage(llvm::GlobalValue::LinkageTypes::PrivateLinkage);
        // output filepath name to global space
        // data.src_filepath_str = llvm::dyn_cast_or_null<llvm::GlobalVariable>(M.getOrInsertGlobal(SCABBARD_METADATA_INSTR_srcPath_VAR_HOST(data.hex_id_str), charArr_ty));
        // std::vector<llvm::Value*> filename_arr;
        // std::transform(filepath.begin(), filepath.end(), filename_arr.begin(),
        //                 [&](char val) -> llvm::Constant* { return llvm::Constant::getIntegerValue(char_ty, llvm::APSInt::get(val)); });
        // filename_arr.push_back(llvm::Constant::getIntegerValue(char_ty, llvm::APSInt::get(0)));
        // data.src_filepath_str->setInitializer(llvm::ConstantDataArray::get(M.getContext(), llvm::makeArrayRef(filename_arr)));
        // data.src_filepath_str->setLinkage(llvm::GlobalValue::LinkageTypes::PrivateLinkage);
        data.src_filepath_str = IRB.CreateGlobalStringPtr(filepath, SCABBARD_METADATA_INSTR_srcPath_VAR_HOST(filepath));
        // make host copy of device side global
        if (data.src_id_ptr_device != nullptr) {
          if (data.src_id_ptr_device_host == nullptr)
            data.src_id_ptr_device_host_name = IRB.CreateGlobalStringPtr(SCABBARD_METADATA_INSTR_srcId_VAR_DEVICE(data.hex_id_str), SCABBARD_METADATA_INSTR_srcId_VAR_DEVICE_NAME(filepath));
          data.src_id_ptr_device_host = llvm::dyn_cast_or_null<llvm::GlobalVariable>(M.getOrInsertGlobal(SCABBARD_METADATA_INSTR_srcId_VAR_DEVICE(data.hex_id_str), int64_ty));
          data.src_id_ptr_device_host->setInitializer(llvm::Constant::getIntegerValue(int64_ty, llvm::APInt(0u, 64ul)));
          data.src_id_ptr_device_host->setLinkage(llvm::GlobalValue::LinkageTypes::PrivateLinkage);
        }
      }
    }


  } //?namespace instr
} //?namespace scabbard
