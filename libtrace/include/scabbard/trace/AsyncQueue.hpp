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
#include <scabbard/trace/TraceWriter.hpp>

#include <hip/hip_runtime.h>

#include <string>
#include <queue>
#include <atomic>

#define WARP_SIZE (size_t(32ul))

#define SCABBARD_DEVICE_CYCLE_BUFFER_LANE_LENGTH ((size_t)64ul)
#define SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT_MODIFIER ((size_t)2ul)
#define SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT ((size_t)SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT_MODIFIER * WARP_SIZE)


namespace scabbard {
  namespace trace {

    struct DeviceAsyncQueue;
    // class HostAsyncQueue; // not needed
  

    /**
     * @brief A specialized AsyncQueue, that just collates the contents of 
     *        subsidiary queues that are running on separate threads and devices
     *        primarily between host and device for a CPU/GPU setup. \n
     *        NOTE: the subsidiary queues are not updated to reflect changes
     *        provided by other threads, it's a one way relationship.
     *        WARNING: this class is designed to only have one instantiation in an entire program.
     */
    class AsyncQueue {
      
      /// @brief host side storage of the device ptr where the device side.
      ///        NOTE: this is a device ptr and is set during __scabbard_init()
      DeviceAsyncQueue* deviceQ = nullptr;        
      
      /// @brief array of the last place we read from when processing the device side async queue
      size_t device_last_read[SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT];

      /// @brief aka \c _device_buffer - local place to store the device side async queue during processing
      DeviceAsyncQueue _db;

      
      
    public:

      __host__ AsyncQueue();
      __host__ ~AsyncQueue();

      __host__ void append(TraceData tData);


    protected:

      __host__ void async_process(TraceWriter& tw);
      __host__ void process_device(TraceWriter& tw);
      __host__ void process_host(TraceWriter& tw);

      friend void ::scabbard::trace::__scabbard_init();

    };

    /**
     * @brief Just a lazy holder of reference pointers that will be handled with 
     *        external functions.
     */
    struct DeviceAsyncQueue {
      struct Lane {
        _Atomic(size_t) next = 0ul;
        TraceData data[SCABBARD_DEVICE_CYCLE_BUFFER_LANE_LENGTH];
        __host__ Lane() = default;
        __device__ __forceinline__ TraceData& operator [] (size_t j);
        __host__ __forceinline__ const TraceData& operator [] (size_t j) const;
        friend class AsyncQueue;
      };
    private:
      Lane data[SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT];
    public:
      __device__ inline void append(TraceData tData);
      __host__ DeviceAsyncQueue() = default;
      __device__ __forceinline__ Lane& operator [] (size_t i);
      __host__ __forceinline__ const Lane& operator [] (size_t i) const;
    protected:
      __device__ __forceinline__ size_t getLaneId() const;
      friend class AsyncQueue;
    };

    class HostAsyncQueue {

    };
  
    
  } //?namespace trace
} //?namespace scabbard
