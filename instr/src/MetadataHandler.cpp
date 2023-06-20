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

#include <llvm/IR/DerivedTypes.h> 
#include <llvm/IR/IRBuilder.h>

#include <cassert> 
#include <algorithm>

namespace scabbard {
  namespace instr {


    LocResult MetadataHandler::trace(llvm::Function& F, const llvm::DebugLoc* DI, bool is_device)
    {
      assert(DI && "[scabbard::instr::metadata::ERROR] The Debug location data does not exist! Try compiling with debug data!");
      return {_trace(F, DI->getScope(), is_device), DI->getLine(), DI->getCol()};
    }



    template<>
    const llvm::GlobalVariable* MetadataHandler::_trace(llvm::Function& F, const llvm::DIScope* DI, bool is_device)
    {
      return _trace(F, DI->getFile(), is_device);
    }

    template<>
    const llvm::GlobalVariable* MetadataHandler::_trace(llvm::Function& F, const llvm::DIFile* DI, bool is_device)
    {
      std::string filename = (DI->getDirectory() + "/" + DI->getFilename()).str();
      MetadataStore data;
      //TODO I will need to handle references to the same source file in multiple modules
      const auto iter = traced_files.find(filename);
      if (iter != traced_files.end()) {
        if (is_device) // if we're in a device module and have this source file in the cache
          return iter->second.src_id_ptr_device; // just return the old reference
        if (iter->second.src_id_ptr_host != nullptr) // 
          return iter->second.src_id_ptr_host;
        data = iter->second;
      }
      //[X]TODO insert/update a "new" entry
      llvm::Module& M = *F.getParent();
      auto* int64_ty = llvm::IntegerType::get(M.getContext(), 64u);
      if (is_device) {
        // output device side source metadata global
        data.src_id_ptr_device = llvm::dyn_cast_or_null<llvm::GlobalVariable> (M.getOrInsertGlobal("scabbard.trace.device.metadata_srcId$"+filename, int64_ty));
        data.src_id_ptr_device->setInitializer(llvm::Constant::getIntegerValue(int64_ty, llvm::APInt(0u, 64ul)));
      } else {
        auto* char_ty = llvm::ArrayType::get(llvm::IntegerType::get(M.getContext(), 8u), filename.size()+1);
        auto* charArr_ty = llvm::IntegerType::get(M.getContext(), 8u);
        data.src_id_ptr_device_host = llvm::dyn_cast_or_null<llvm::GlobalVariable> (M.getOrInsertGlobal("scabbard.trace.host.metadata_srcId$"+filename, int64_ty));
        data.src_id_ptr_device_host->setInitializer(llvm::Constant::getIntegerValue(int64_ty, llvm::APInt(0u, 64ul)));
        // output filepath name to global space
        data.src_filepath_str = llvm::dyn_cast_or_null<llvm::GlobalVariable> (M.getOrInsertGlobal("scabbard.trace.host.metadata_srcFile$"+filename, charArr_ty));
        std::vector<llvm::Value*> filename_arr;
        std::transform(filename.begin(), filename.end(), filename_arr.begin(),
                        [&](char val) -> llvm::Constant* { return llvm::Constant::getIntegerValue(char_ty, llvm::APSInt::get(val)); });
        filename_arr.push_back(llvm::Constant::getIntegerValue(char_ty, llvm::APSInt::get(0)));
        data.src_filepath_str->setInitializer(llvm::ConstantDataArray::get(M.getContext(), llvm::makeArrayRef(filename_arr)));

        // make host copy of device side global
        if (data.src_id_ptr_device != nullptr) {
          data.src_id_ptr_host = llvm::dyn_cast_or_null<llvm::GlobalVariable> (M.getOrInsertGlobal("scabbard.trace.host.metadata_srcId$"+filename, int64_ty));
          data.src_id_ptr_host->setInitializer(llvm::Constant::getIntegerValue(int64_ty, llvm::APInt(0u, 64ul)));
        }
      }
      traced_files[filename] = data;
      if (is_device)
        return data.src_id_ptr_device;
      return data.src_id_ptr_host;
    }


    // template<class DINode_t>
    // const llvm::GlobalVariable* MetadataHandler::_trace(llvm::Module& M, const DINode_t* DI)
    // {
    //   return nullptr;
    // }


  } //?namespace instr
} //?namespace scabbard
