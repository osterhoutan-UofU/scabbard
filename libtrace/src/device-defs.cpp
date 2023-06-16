/**
 * @file device-defs.cpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief device defs for side wise compilation
 * @version alpha 0.0.1
 * @date 2023-06-14
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include <scabbard/trace/calls.hpp>
#include <scabbard/trace/globals.hpp>
#include <scabbard/trace/AsyncQueue.hpp>

#include <hip/hip_ext.h>
#include <hip/hip_runtime_api.h>


namespace scabbard {
  namespace trace {


    // << ========================================================================================== >> 
    // <<                                          GLOBALS                                           >> 
    // << ========================================================================================== >> 

    // AsyncQueue TRACE_LOGGER; // created in scabbard init
    // __device__ DeviceAsyncQueue* DEVICE_TRACE_LOGGER;

    
    
    // << ======================================== Device ========================================== >> 
    namespace device {

      __device__ inline 
      size_t getLaneId() // const
      {
        return (size_t)(((blockDim.x*blockIdx.x) + (blockDim.y*blockIdx.y) + (blockDim.z*blockIdx.z)
                + threadIdx.x + threadIdx.y + threadIdx.z) % SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT);
      }
      
      __device__ __noinline__
      void trace_append$mem(InstrData data, const void* PTR, const std::uint32_t* src_id, std::uint32_t line, std::uint32_t col)
      {
        const size_t lId = getLaneId();
        DEVICE_TRACE_LOGGER->data[lId].data[(++(DEVICE_TRACE_LOGGER->data[lId].next))  // atomic so increment should happen at same time as load/copy
                  % SCABBARD_DEVICE_CYCLE_BUFFER_LANE_LENGTH] = TraceData(clock64(), data,
                                                                          blockIdx, threadIdx,
                                                                          PTR, 
                                                                         *src_id, line, col);
      }

      __device__ __noinline__
      void trace_append$alloc(InstrData data, const void* PTR, const std::uint32_t* src_id, std::uint32_t line, std::uint32_t col, std::size_t size)
      {
        const size_t lId = getLaneId();
        DEVICE_TRACE_LOGGER->data[lId].data[(++(DEVICE_TRACE_LOGGER->data[lId].next))  // atomic so increment should happen at same time as load/copy
                  % SCABBARD_DEVICE_CYCLE_BUFFER_LANE_LENGTH] = TraceData(clock64(), data,
                                                                          blockIdx, threadIdx,
                                                                          PTR, 
                                                                          *src_id, line, col, 
                                                                          size);
      }


    } //?namespace device



    // << ========================================================================================== >> 
    // <<                                        GLOBAL TAGS                                         >> 
    // << ========================================================================================== >> 

    namespace {

      /**
       * @brief waisted space used to that the device side function does not optimized out
       *        from not being called from inside teh device space
       */
      __global__ 
      void call_for_looks(InstrData tmp, void* ptr, void* meta)
      {
        ::scabbard::trace::device::trace_append$mem(tmp,ptr,meta);
      }

      // __global__ void call_for_differentiation(InstrData tmp, void* ptr, void* meta)
      // {
      //   ::scabbard::trace::device::trace_append$mem((InstrData)((InstrData)tmp | InstrData::FREE),ptr,meta);
      // }

    }
  
  
  } //?namespace trace
} //?namespace scabbard



