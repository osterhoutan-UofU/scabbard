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
#include <scabbard/instr-names.def>

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
    void scabbard_init() asm (SCABBARD_CALLBACK_INIT_NAME);

    /**
     * @brief finalize and finish up all scabbard operations for program ending.
     *        Should be called from somewhere at the end of the program. \n
     *        ( \em NOTE: this description of where it goes is purposefully unhelpful,
     *          because I don't currently use this feature.)
     */
    __host__ 
    void scabbard_close() asm (SCABBARD_CALLBACK_CLOSE_NAME);


    namespace device {
      
      __device__ __noinline__
      void trace_append$mem(InstrData data, const void* PTR, const void* METADATA) 
        asm (SCABBARD_DEVICE_CALLBACK_APPEND_MEM_NAME);


    } //?namespace device

    namespace host {

      __host__ 
      void trace_append$mem(InstrData data, const void* PTR, const void* METADATA) 
        asm (SCABBARD_HOST_CALLBACK_APPEND_MEM_NAME);
      __host__ 
      void trace_append$mem$cond(InstrData data, const void* PTR, const void* METADATA) 
        asm (SCABBARD_HOST_CALLBACK_APPEND_MEM_COND_NAME);
      
    } // namespace host
    

  } //?namespace trace
} //?namespace scabbard
