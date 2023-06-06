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

#include <cstring>


namespace scabbard {
  namespace instr {


    __host__ AsyncQueue::AsyncQueue()
    {
      //TODO handle the construction
      // set the values in the device last read tracker
      std::memset(&this->device_last_read,0,sizeof(size_t)*SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT);
    }

    __host__ AsyncQueue::~AsyncQueue()
    {
      // hipFree(deviceQ);  // NOTE: Unessisary since it is global memory
      for (const auto& mem : hostQs)
        if (mem.second != nullptr)
          delete mem.second;
    }



    // << ========================================================================================== >> 
    // <<                                          DEVICE                                            >> 
    // << ========================================================================================== >> 


    __host__ void AsyncQueue::process_device()
    {
      if (hipMemcpy(_device_buffer,))
    }


    __device__ __forceinline__ size_t DeviceAsyncQueue::getLaneId() const
    {
      return (size_t)(((blockDim.x*blockIdx.x) + (blockDim.y*blockIdx.y) + (blockDim.z*blockIdx.z)
              + threadIdx.x + threadIdx.y + threadIdx.z) % SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT);
    }

    __device__ inline void DeviceAsyncQueue::append(TraceData tData)
    {
      const size_t lId = getLaneId();
      data[lId].data[(++data[lId].next)  // atomic so increment should happen at same time as copy
                      % SCABBARD_DEVICE_CYCLE_BUFFER_LANE_LENGTH] = tData;
    }

    __host__ DeviceAsyncQueue::DeviceAsyncQueue()
    {
      for (size_t i=0; i<SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT; ++i) {
        data[i] = Lane();
      }
    }

    __host__ DeviceAsyncQueue::Lane::Lane()
    {
      std::memset(&data,0,sizeof(TraceData)*SCABBARD_DEVICE_CYCLE_BUFFER_LANE_LENGTH);
    }



    // << ========================================================================================== >> 
    // <<                                           HOST                                             >> 
    // << ========================================================================================== >> 
  
    
  
  } //?namespace instr
} //?namespace scabbard
