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
#include <scabbard/trace/DeviceTracker.hpp>
#include <scabbard/instr-names.def>

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

      // NOT needed, since each job will have it's own buffer.
      // __device__ inline 
      // size_t getLaneId() // const
      // {
      //   return (size_t)(((blockDim.x*blockIdx.x) + (blockDim.y*blockIdx.y) + (blockDim.z*blockIdx.z)
      //           + threadIdx.x + threadIdx.y + threadIdx.z) % SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT);
      // }
      
      __device__ __noinline__
      void trace_append$mem(void* deviceTracker, InstrData data, const void* PTR, const std::uint64_t* src_id, std::uint32_t line, std::uint32_t col)
      {
        DeviceTracker& DT = *((DeviceTracker*) deviceTracker);
        DT.buffer[(DT.next++) % SCABBARD_DEVICE_TRACKER_BUFF_LENGTH] = TraceData(DT.vClk++, data,
                                                                                  DT.JOB_ID, blockIdx, threadIdx,
                                                                                  PTR, 
                                                                                  *src_id, line, col, 
                                                                                  0ul);
        // const size_t lId = getLaneId();
        // auto& _tmp0 = DEVICE_TRACE_LOGGER->data;
        // auto& _tmp1 = _tmp0[lId];
        // auto& _tmp2 = _tmp1.next;
        // const size_t _tmp3 = _tmp2;   // <<<< THIS OPERATION CAUSES THE SIGSEGV 
        // const size_t _li = ++_tmp2;  // atomic so increment should happen at same time as load/copy // <<<< THIS OPERATION CAUSES THE SIGSEGV 
        // const size_t li = _li % SCABBARD_DEVICE_CYCLE_BUFFER_LANE_LENGTH;
        // DEVICE_TRACE_LOGGER->data[lId].data[li] = TraceData(wall_clock64(), data,
        //                                                                   blockIdx, threadIdx,
        //                                                                   PTR, 
        //                                                                  *src_id, line, col, 0ul);
      }

      __device__ __noinline__
      void trace_append$alloc(void* deviceTracker, InstrData data, const void* PTR, const std::uint64_t* src_id, std::uint32_t line, std::uint32_t col, std::size_t size)
      {
        DeviceTracker& DT = *((DeviceTracker*) deviceTracker);
        DT.buffer[(DT.next++) % SCABBARD_DEVICE_TRACKER_BUFF_LENGTH] = TraceData(DT.vClk++, data,
                                                                                  DT.JOB_ID, blockIdx, threadIdx,
                                                                                  PTR, 
                                                                                  *src_id, line, col, 
                                                                                  size);
      }


    } //?namespace device



    // << ========================================================================================== >> 
    // <<                                        GLOBAL TAGS                                         >> 
    // << ========================================================================================== >> 

    namespace {

      // place filler for the metadata tag in this required piece to get device functions to not be optimized out
      __device__ uint64_t src_id_reg_tmp = 0x54; 
      __device__ uint64_t src_id_reg_tmp2 = 0x54; 
      __device__ uint64_t src_id_reg_tmp3 = 0x54; 

      /**
       * @brief waisted space used to that the device side function does not optimized out
       *        from not being called from inside the llvm device module pre-instrumentation
       */
      __global__ 
      void call_for_looks(InstrData tmp, void* ptr, void* meta, const std::uint64_t* src_id) asm (SCABBARD_DEVICE_DUMMY_FUNC_NAME);

      __global__ 
      void call_for_looks(InstrData tmp, void* ptr, void* meta, const std::uint64_t* src_id)
      {
        size_t dt_stand_in;
        ::scabbard::trace::device::trace_append$mem((void*)&dt_stand_in,tmp,ptr,&src_id_reg_tmp,19u,9u);
        ::scabbard::trace::device::trace_append$mem((void*)&dt_stand_in,tmp,ptr,&src_id_reg_tmp2,1024u,4u);
        ::scabbard::trace::device::trace_append$mem((void*)&dt_stand_in,tmp,ptr,src_id,10240u,40u);
        ::scabbard::trace::device::trace_append$alloc((void*)&dt_stand_in,tmp,ptr,&src_id_reg_tmp2,88u,256u,7ul);
        ::scabbard::trace::device::trace_append$alloc((void*)&dt_stand_in,tmp,ptr,&src_id_reg_tmp3,98u,6u,23ul);
        ::scabbard::trace::device::trace_append$alloc((void*)&dt_stand_in,tmp,ptr,src_id,980u,60u,230ul);
      }

      // __global__ void call_for_differentiation(InstrData tmp, void* ptr, void* meta)
      // {
      //   ::scabbard::trace::device::trace_append$mem((InstrData)((InstrData)tmp | InstrData::FREE),ptr,meta);
      // }

    }
  
  
  } //?namespace trace
} //?namespace scabbard



