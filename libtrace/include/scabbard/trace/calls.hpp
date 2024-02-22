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
      void trace_append$mem(void* deviceTracker, InstrData data, const void* PTR, const std::uint64_t* src_id, std::uint32_t line, std::uint32_t col) 
        asm (SCABBARD_DEVICE_CALLBACK_APPEND_MEM_NAME);
      __device__ 
      void trace_append$alloc(void* deviceTracker, InstrData data, const void* PTR, const std::uint64_t* src_id, std::uint32_t line, std::uint32_t col, std::size_t size) 
        asm (SCABBARD_DEVICE_CALLBACK_APPEND_ALLOC_NAME);


    } //?namespace device

    namespace host {

      __host__ 
      void trace_append$mem(InstrData data, const void* PTR, const std::uint64_t* src_id, std::uint32_t line, std::uint32_t col) 
        asm (SCABBARD_HOST_CALLBACK_APPEND_MEM_NAME);
      __host__ 
      void trace_append$mem$cond(InstrData data, const void* PTR, const std::uint64_t* src_id, std::uint32_t line, std::uint32_t col) 
        asm (SCABBARD_HOST_CALLBACK_APPEND_MEM_COND_NAME);
      __host__ 
      void trace_append$alloc(InstrData data, const void* PTR, const std::uint64_t* src_id, std::uint32_t line, std::uint32_t, std::size_t size) 
        asm (SCABBARD_HOST_CALLBACK_APPEND_ALLOC_NAME);
      
    } // namespace host


    /**
     * @brief during runtime this call gets instrumented befor a kernel launch function
     *        it returns a pointer to a scabbard::trace::DeviceTracker object in device memory.
     *        That will be passed into the kernel and through all user defined kernel functions.
     */
    __host__
    void* register_job(int DEVICE, const hipStream_t const * STREAM)
      asm (SCABBARD_CALLBACK_REGISTER_JOB);


    /**
     * @brief register a source file at the requested hash key 
     *        to store the metadata in a runtime friendly way
     */
    __host__
    std::uint64_t metadata_register$src(const char* src_file)
        asm (SCABBARD_CALLBACK_REGISTER_SRC_NAME);
    
    /**
     * @brief unregister a source file at the requested hash key 
     *        to store the metadata in a runtime friendly way
     */
    __host__
    void metadata_unregister$src(std::size_t src_key) 
          asm (SCABBARD_CALLBACK_UNREGISTER_SRC_NAME);

    // /**
    //  * @brief register a location in a source file at the requested hash key 
    //  *        to store the metadata in a runtime friendly way
    //  */
    // __host__
    // void metadata_register$loc(std::size_t src_key, std::size_t loc_key, std::size_t line, std::size_t col) 
    //       asm (SCABBARD_CALLBACK_REGISTER_LOC_NAME);

    // /**
    //  * @brief unregister a location in a source file at the requested hash key 
    //  *        to store the metadata in a runtime friendly way
    //  */
    // __host__
    // void metadata_unregister$loc(std::size_t src_key, std::size_t loc_key) 
    //       asm (SCABBARD_CALLBACK_UNREGISTER_LOC_NAME);
    



  } //?namespace trace
} //?namespace scabbard
