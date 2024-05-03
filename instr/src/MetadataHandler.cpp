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

    // << ------------------------------------------------------------------------------------------ >> 

    MetadataStore::MetadataStore(const std::string& src_path_, size_t id_)
      : src_path(src_path_), id(id_), hex_id_str(MetadataStore::get_hex_str(id_))
    {}

    std::string MetadataStore::get_hex_str(size_t val)
    {
      std::stringstream tmp;
      tmp << std::setfill('0') << std::setw(4u) << std::hex << val;
      return tmp.str();
    }

    std::string MetadataStore::get_var_name(bool is_device) const
    {
      return "scabbard.metadata." + std::string((is_device) ? "device" : "host") + ".srcId$0x" + hex_id_str;
    }
    std::string MetadataStore::get_str_var_name() const
    {
      return "scabbard.metadata.srcData$0x" + hex_id_str;
    }

    // << ------------------------------------------------------------------------------------------ >> 

    llvm::GlobalVariable* MetadataHandler::_trace_file(llvm::Function& F, const llvm::DIFile* DI, bool is_device)
    {
      std::string filename = (DI->getDirectory() + "/" + DI->getFilename()).str();
      MetadataStore* data = nullptr;

      mut.lock();
      auto it = traced_files.find(filename);
      if (it == traced_files.end()) {
        auto tmp = traced_files.emplace(std::make_pair(filename, MetadataStore(filename, next++)));
        data = &tmp.first->second;
      } else {
        data = &it->second;
      }
      if (is_device)
        data->on_device = true;
      else
        data->on_host = true;
      data->in_modules.insert(F.getParent()->getModuleIdentifier());
      mut.unlock();

      return encode_variables(*data, *F.getParent(), is_device);
    }


    
    llvm::GlobalVariable* MetadataHandler::_trace_scope(llvm::Function& F, const llvm::DIScope* DI, bool is_device)
    {
      return _trace_file(F, DI->getFile(), is_device);
    }


    // template<class DINode_t>
    // llvm::GlobalVariable* MetadataHandler::_trace(llvm::Module& M, const DINode_t* DI)
    // {
    //   return nullptr;
    // }


    LocResult MetadataHandler::trace(llvm::Function& F, const llvm::DebugLoc& DI, bool is_device)
    {
      if (not DI)
        llvm::errs() << "\n[scabbard.instr.metadata:ERR] The Debug location data does not exist! Try compiling with debug data! [in `" << F.getName() << "`]\n";
      assert(DI && "[scabbard.instr.metadata:ERROR] The Debug location data does not exist! Try compiling with debug data!");
      return {_trace_scope(F, llvm::dyn_cast_or_null<llvm::DIScope>(DI.getScope()), is_device), DI.getLine(), DI.getCol()};
    }

    llvm::GlobalVariable* MetadataHandler::encode_variables(MetadataStore& data, llvm::Module& M, bool is_device)
    {
      auto* int64_ty = llvm::IntegerType::get(M.getContext(), 64u);
      auto res = llvm::dyn_cast_or_null<llvm::GlobalVariable>(M.getOrInsertGlobal(data.get_var_name(is_device), int64_ty));
      res->setInitializer(llvm::Constant::getIntegerValue(int64_ty, llvm::APInt(64ul, 0ul, false)));
      res->setLinkage(llvm::GlobalValue::LinkageTypes::PrivateLinkage);
      return res;
    }

  } //?namespace instr
} //?namespace scabbard
