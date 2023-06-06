/**
 * @file calls.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief Where the instrumentation calls progenitors are defined
 * @version alpha 0.0.1
 * @date 2023-05-30
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#pragma once

#include <scabbard/Enums.hpp>

#include <hip/hip_runtime.h>
#include <hip/hip_runtime_api.h>


namespace scabbard {
  namespace trace {
  
    /**
     * @brief setup the scabbard system.
     *        Should be called from main at the start of the program.
     *        Scabbard instrumentation should do this automatically.
     */
    __host__ 
    void __scabbard_init();


    namespace device {
      
      __device__ 
      void trace_append$mem(InstrData data, const void* PTR, const void* METADATA);


    } //?namespace device

    namespace host {

      __host__ 
      void trace_append$mem(InstrData data, const void* PTR, const void* METADATA);
      __host__ 
      void trace_append$mem$cond(InstrData data, const void* PTR, const void* METADATA);
      
    } // namespace host
    

  } //?namespace trace
} //?namespace scabbard
