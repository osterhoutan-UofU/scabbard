/**
 * @file scabbard.cpp
 * @author Andrew Osterhout
 * @brief 
 * @version 0.1
 * @date 2023-03-28
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include <llvm/Pass.h>
#include <llvm/IR/Function.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/IR/LegacyPassManager.h> //TODO swap this to the new pass manager
#include <llvm/Transforms/IPO/PassManagerBuilder.h>



namespace scabbard {
namespace instr {

} //namespace instr
} //namespace scabbard



// << ========================================================================================== >> 
// <<                                       PASS REGISTRY                                        >> 
// << ========================================================================================== >> 
//TODO register the pass with the pass manager

// << ========================================================================================== >> 
// <<                                      PLUGIN REGISTRY                                       >> 
// << ========================================================================================== >> 
//TODO add stuff to make this a hipcc/clang plugin too
