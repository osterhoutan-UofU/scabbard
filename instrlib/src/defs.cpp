/**
 * @file calls.cpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
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

#include <hip/hip_ext.h>

#include <thread>
#include <cstdlib>

namespace scabbard {
  namespace instr {


    // << ========================================================================================== >> 
    // <<                                          GLOBALS                                           >> 
    // << ========================================================================================== >> 

    AsyncQueue TRACE_LOGGER; // created in scabbard init
    __device__ DeviceAsyncQueue* DEVICE_TRACE_LOGGER;




    // << ========================================================================================== >> 
    // <<                                           CALLS                                            >> 
    // << ========================================================================================== >> 

    __host__ 
    void __scabbard_init() 
    {
      const auto TRACE_FILE = std::getenv("_SCABBARD_TRACE_FILE");
      if (TRACE_FILE != nullptr) {
      } else {
      }
      DeviceAsyncQueue* tmp1;
      if (hipMalloc(&tmp1, sizeof(DeviceAsyncQueue)) != hipSuccess) {
        //TODO handle error
      }
      DeviceAsyncQueue tmp2;
      if (hipMemcpy(tmp1, &tmp2, sizeof(DeviceAsyncQueue), hipMemcpyHostToDevice)
            != hipSuccess) {
        //TODO Handle error
      }
      DEVICE_TRACE_LOGGER = (TRACE_LOGGER.deviceQ = tmp1);
      //TODO setup basics for scabbard trace
    }
    
    
    // << ======================================== Device ========================================== >> 
    namespace device {
      
      __device__ 
      void trace_append$mem(InstrData data, const void* PTR, const void* METADATA)
      {
        DEVICE_TRACE_LOGGER->append(TraceData(data,PTR,METADATA));
      }


    } //?namespace device


    // << ========================================= Host =========================================== >> 
    namespace host {

      __host__ 
      void trace_append$mem(InstrData data, const void* PTR, const void* METADATA)
      {
        TRACE_LOGGER.append(TraceData(data, PTR, METADATA));
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
