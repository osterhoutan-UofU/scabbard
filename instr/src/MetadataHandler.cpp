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

namespace scabbard {
  namespace instr {


    LocResult MetadataHandler::trace(llvm::Function& F, const llvm::DebugLoc* DI, bool is_device)
    {
      return {_trace(M, DI->getScope(), is_device), DI->getLine(), DI->getCol()};
    }



    template<>
    const llvm::GlobalVariable* MetadataHandler::_trace(llvm::Function& F, const llvm::DIScope* DI, bool is_device)
    {
      return _trace(M, DI->getFile(), is_device);
    }

    template<>
    const llvm::GlobalVariable* MetadataHandler::_trace(llvm::Function& F, const llvm::DIFile* DI, bool is_device)
    {
      std::string filename = (DI->getDirectory() + "/" + DI->getFilename()).str();
      MetadataStore data;
      const auto iter = traced_files.find(filename);
      if (iter != traced_files.end()) {
        if (is_device)
          return iter->second.src_id_ptr_device;
        if (iter->second.src_id_ptr_host != nullptr)
          return iter->second.src_id_ptr_host;
        data = iter->second;
      }
      //TODO insert/update a "new" entry
      llvm::Module& M = *F.getParent();
      auto* int64_ty = llvm::IntegerType::get(M.getContext(), 64u);
      if (is_device) {
        data.src_id_ptr_device = new llvm::GlobalVariable(
            int64_ty, false,
            llvm::GlobalVariable::LinkageTypes::CommonLinkage,
            llvm::Constant::getIntegerValue(int64_ty, llvm::APInt(0ul, 64u)),
            "scabbard.trace.device.metadata_srcName$"+filename,
            llvm::GlobalValue::ThreadLocalMode::NotThreadLocal,
            1u, true
          );
        data.src_id_ptr_device = M.getOrInsertGlobal("scabbard.trace.device.metadata_srcName$"+filename, int64_ty);
        data.src_id_ptr_device->setInitializer
      } else {

        if (data.src_id_ptr_device != nullptr) {
          //TODO make host copy of device side global
        }
      }
      traced_files[filename] = data;
    }


    // template<class DINode_t>
    // const llvm::GlobalVariable* MetadataHandler::_trace(llvm::Module& M, const DINode_t* DI)
    // {
    //   return nullptr;
    // }


  } //?namespace instr
} //?namespace scabbard
