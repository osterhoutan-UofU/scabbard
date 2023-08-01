/**
 * @file loadModule.cpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief a copy of the load module code from llvm-project/clang/lib/CodeGen/CodeGenAction.cpp
 *        used to safely load in a complex module
 * @version alpha 0.0.1
 * @date 2023-07-31
 * 
 */

#pragma once 

#include <llvm/IR/Module.h>
#include <llvm/Support/MemoryBuffer.h>


#include <memory>

namespace scabbard {
namespace instr {

/**
 * @brief Safely load a complex bitcode buffer
 *        Copied from: llvm-project/clang/lib/CodeGen/CodeGenAction.cpp
 * @param MBRef 
 * @return \c std::unique_ptr<llvm::Module> - 
 */
std::unique_ptr<llvm::Module> loadModule(llvm::MemoryBufferRef MBRef);

} //?namespace instr
} //?namespace scabbard

