/**
 * @file calls.cpp
 * @author osterhoutan (osterhoutan@gmail.com)
 * @brief implementation of the scabbard/instr/calls.hpp 
 *        and the scabbard/instr/globals.hpp include files
 * @version alpha 0.0.1
 * @date 2023-05-30
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include <scabbard/instr/calls.hpp>
#include <scabbard/instr/globals.hpp>
#include <scabbard/instr/AsyncQueue.hpp>
#include <scabbard/instr/TraceWriter.hpp>

#include <thread>

namespace scabbard {
  namespace instr {


    // << ========================================================================================== >> 
    // <<                                          GLOBALS                                           >> 
    // << ========================================================================================== >> 

    





    // << ========================================================================================== >> 
    // <<                                           CALLS                                            >> 
    // << ========================================================================================== >> 

    __host__ 
    void __scabbard_init() 
    {
      //TODO setup basics for scabbard trace
    }
    
    
    // << ======================================== Device ========================================== >> 
    namespace device {
      
      __device__ 
      void trace_append$mem(InstrData data, const void* PTR, const void* METADATA)
      {
        //TODO
      }


    } //?namespace device


    // << ========================================= Host =========================================== >> 
    namespace host {

      __host__ 
      void trace_append$mem(InstrData data, const void* PTR, const void* METADATA)
      {
        //TODO
      }

      __host__ 
      void trace_append$mem$cond(InstrData data, const void* PTR, const void* METADATA)
      {
        hipPointerAttribute_t* attrs;
        const auto status = hipPointerGetAttributes(attrs,PTR);
        if (status == hipSuccess) {
          if (attrs->isManaged) {
            data |= InstrData::MANAGED_MEM;
          } else if (attrs->device == 0) {
            data |= InstrData::HOST_HEAP;
          } else {
            data |= InstrData::DEVICE_HEAP;
          }
          trace_append$mem(data,PTR,METADATA);
        } else {
          //TODO handle the error
        }
      }
      
    } // namespace host
  
  
  } //?namespace instr
} //?namespace scabbard
