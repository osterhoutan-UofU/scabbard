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

#pragma once

#include <scabbard/TraceData.hpp>

#include <hip/hip_runtime.h>

#include <string>
#include <map>
#include <atomic>

#define WARP_SIZE (size_t(32ul))

#define SCABBARD_DEVICE_CYCLE_BUFFER_LANE_LENGTH ((size_t)64ul)
#define SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT_MODIFIER ((size_t)2ul)
#define SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT ((size_t)SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT_MODIFIER * WARP_SIZE)


namespace scabbard {
  namespace instr {
  

    /**
     * @brief A specialized AsyncQueue, that just collates the contents of 
     *        subsidiary queues that are running on separate threads and devices
     *        primarily between host and device for a CPU/GPU setup. \n
     *        NOTE: the subsidiary queues are not updated to reflect changes
     *        provided by other threads, it's a one way relationship.
     */
    class AsyncQueue {

    protected:
      struct DeviceAsyncQueue;
      class HostAsyncQueue;

    private:
      std::map<size_t,DeviceAsyncQueue*> deviceQs;
      std::map<size_t,HostAsyncQueue*> hostQs;

      _Atomic(size_t) next_kernel_id = ((size_t)0ul);
      
    public:

      AsyncQueue();
      ~AsyncQueue();

      /**
       * @brief Register a kernel so that the Async Queue can be set up for the kernel launch
       * 
       * @param gridDim 
       * @param blockDim 
       * @param sharedMemSize (might be modified)
       * @param stream 
       * @return \c size_t - the ID that can be used to identify this kernel
       */
      size_t registerKernel(const dim3* gridDim, const dim3* blockDim, size_t sharedMemSize, const hipStream_t* stream);
      
      /**
       * @brief Unregister a kernel after it finishes operations
       * @param ID - the ID that can be used to identify this kernel
       */
      void unregisterKernel(size_t ID);


    protected:

      /**
       * @brief Just a lazy holder of reference pointers that will be handled with 
       *        external functions.
       */
      class DeviceAsyncQueue {
        class Lane {
          _Atomic(size_t) next = 0ul;
          TraceData data[SCABBARD_DEVICE_CYCLE_BUFFER_LANE_LENGTH];
        };
        Lane data[SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT];
      public:
        __device__ void append(InstrData data, const void* ptr);
      };

      class HostAsyncQueue {

      };

    };
  
  } //?namespace instr
} //?namespace scabbard
