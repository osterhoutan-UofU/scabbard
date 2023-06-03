/**
 * @file AsyncQueue.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief The cross host, device and thread lock-free queue
 * @version alpha 0.0.1
 * @date 2023-05-30
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include <scabbard/instr/AsyncQueue.hpp>


namespace scabbard {
  namespace instr {


    AsyncQueue::~AsyncQueue()
    {
      for (const auto& mem : deviceQs)
        if (mem.second != nullptr) {
          //TODO free the dependent arrays first
          hipFree(mem.second);
        }
      for (const auto& mem : hostQs)
        if (mem.second != nullptr)
          delete mem.second;
          
    }
  
    
  
  } //?namespace instr
} //?namespace scabbard
