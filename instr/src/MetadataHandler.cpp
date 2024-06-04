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

#include <sys/file.h>


namespace scabbard {
  namespace instr {


    llvm::Constant* LocResult::get_as_constant(llvm::LLVMContext& CTX) const 
    {
      return llvm::ConstantInt::get(llvm::IntegerType::get(CTX, 64u), llvm::APInt(64u, srcID, false)); 
    }

    // << ------------------------------------------------------------------------------------------ >> 

    int acquire_file_lock(const std::string& filepath) 
    {
      //TODO write a blocking no exceptions flock acquire impl 
    }

    void release_file_lock(int LFD)
    {
      //TODO impl the flock release
      flock(FLD, LOCK_UN);
      close(FLD);
    }


    // << ------------------------------------------------------------------------------------------ >> 

    LocResult MetadataHandler::_trace_file(llvm::Function& F, const llvm::DebugLoc& DIL, const llvm::DIFile* DIF, const ModuleType MOD_TY)
    {
      //acquire metadata file lock
      const int LFD = acquire_file_lock(metadata_file_lock_file);

      //TODO read in metadata file to update

      //TODO check to see if src location is already registered
      //      if so release metadata file lock and return the relevant source id srcID
      
      //TODO add new SrcMetadata to metadata object

      //TODO update the metadata file

      //release metadata file lock
      release_file_lock(LFD)

      return {srcID};
    }


    
    LocResult MetadataHandler::_trace_scope(llvm::Function& F, const llvm::DebugLoc& DIL, const llvm::DIScope* DIS, const ModuleType MOD_TY)
    {
      return _trace_file(F, DIL, DIS->getFile(), MOD_TY);
    }


    // template<class DINode_t>
    // llvm::GlobalVariable* MetadataHandler::_trace(llvm::Module& M, const DINode_t* DI)
    // {
    //   return nullptr;
    // }


    LocResult MetadataHandler::trace(llvm::Function& F, const llvm::DebugLoc& DI, const ModuleType MOD_TY)
    {
      if (not DI)
        llvm::errs() << "\n[scabbard.instr.metadata:ERR] The Debug location data does not exist! Try compiling with debug data! [in `" << F.getName() << "`]\n";
      assert(DI && "[scabbard.instr.metadata:ERROR] The Debug location data does not exist! Try compiling with debug data!");
      return _trace_scope(F, llvm::dyn_cast_or_null<llvm::DIScope>(DI.getScope()), MOD_TY);
    }

  } //?namespace instr
} //?namespace scabbard
