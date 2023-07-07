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

// trun on hip components when importing from libscabbard
#ifndef __scabbard_hip_compile
# define __scabbard_hip_compile (1u)
#endif

#include <scabbard/TraceData.hpp>
#include <scabbard/trace/TraceWriter.hpp>
#include <scabbard/trace/calls.hpp>

#include <hip/hip_ext.h>
#include <hip/hip_runtime.h>

#include <string>
#include <queue>
#include <mutex>
#include <atomic>
#include <thread>
#include <chrono>

#define WARP_SIZE (size_t(32ul))

#define SCABBARD_DEVICE_CYCLE_BUFFER_LANE_LENGTH ((size_t)64ul)
#define SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT_MODIFIER ((size_t)2ul)
#define SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT ((size_t)SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT_MODIFIER * WARP_SIZE)


namespace scabbard {
  namespace trace {

    /**
     * @brief Just a lazy holder of reference pointers that will be handled with 
     *        external functions.
     */
    struct DeviceAsyncQueue {
      struct Lane {
        _Atomic(size_t) next = 0ul;
        TraceData data[SCABBARD_DEVICE_CYCLE_BUFFER_LANE_LENGTH];
        __host__ __device__ Lane() = default;
        // __device__ inline TraceData& operator [] (size_t j);
        __host__ inline const TraceData& operator [] (size_t j) const;
        friend class AsyncQueue;
      };
    private:
      Lane data[SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT];
    public:
      // __device__ inline void append(TraceData tData);
      __host__ __device__ DeviceAsyncQueue() = default;
      // __host__ __device__ inline DeviceAsyncQueue& operator += (const TraceData& tData);
      // __device__ inline Lane& operator [] (size_t i);
      __host__ inline const Lane& operator [] (size_t i) const;
    protected:
      // __device__ static inline size_t getLaneId(); // const;
      friend class AsyncQueue;
      friend __device__ void scabbard::trace::device::trace_append$mem(InstrData data, const void* PTR, const std::uint64_t* src_id, std::uint32_t line, std::uint32_t col);
      friend __device__ void scabbard::trace::device::trace_append$alloc(InstrData data, const void* PTR, const std::uint64_t* src_id, std::uint32_t line, std::uint32_t col, std::size_t size);
    };
  

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
      ///        NOTE: this is a device ptr and is set during scabbard_init()
      DeviceAsyncQueue* deviceQ = nullptr;        
      
      /// @brief array of the last place we read from when processing the device side async queue
      size_t device_last_read[SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT];

      /// @brief aka \c _device_buffer - local place to store the device side async queue during processing
      DeviceAsyncQueue _db;

      /// @brief the host buffer
      std::queue<TraceData> hostQ;

      /// @brief the mutex protecting the host side buffer (if I can find an easily imported lock free queue this will replace it)
      std::mutex mx_hostQ;

      /// @brief the output of the async queue (has ownership of the pointer)
      TraceWriter* tw = nullptr;

      /// @brief the worker thread for the async queue
      std::thread* worker_thread = nullptr;

      /// @brief way to get worker to stop so it can be joined latter
      bool run_worker = false;

      /// @brief delay between processes of the various buffers
      std::chrono::high_resolution_clock::duration delay = std::chrono::milliseconds(2);
      
      
    public:

      __host__ AsyncQueue();
      __host__ ~AsyncQueue();

      /**
       * @brief start the async process
       */
      __host__ void start();

      /**
       * @brief stop the async process
       */
      __host__ void stop();


      /**
       * @brief how the host will append its traces data to the trace.
       * @param tData the trace data to append
       */
      __host__ void append(TraceData tData);

      /**
       * @brief Set the delay between processing(s) of the buffers
       * @tparam Rep - an arithmetic type representing the number of ticks
       * @tparam Period - a std::ratio representing the tick period 
       *                  (i.e. the number of second's fractions per tick)
       * @param delay_ - the new delay value
       */
      template<class Rep, class Period = std::ratio<1>>
      __host__ void set_delay(const std::chrono::duration<Rep,Period>& delay_);

      /**
       * @brief Set the device queue object (takes ownership of the pointer)
       * @param dq_ pointer to a valid DeviceAsyncQueue located in device memory (shared mem or the device heap)
       */
      __host__ void set_device_queue(DeviceAsyncQueue* dq_);
      
      /**
       * @brief Set the trace writer object
       * @param file_path the filepath of where the tracefile will be setup
       * @param exe_path path to the instrumented executable generating the trace
       * @param start_time unix timestamp of \em roughly when this executable started running
       */
      __host__ void set_trace_writer(const std::string& file_path, const std::string& exe_path, const std::time_t start_time);

      /**
       * @brief how to trigger a single round of processing of the trace data buffered from 
       *        the device then from the host out to the TraceWriter set with \c set_trace_writer() method.
       */
      __host__ void async_process();

    protected:

      __host__ void process_device(TraceWriter& tw);
      __host__ void process_host(TraceWriter& tw);

      

    };

    

    // class HostAsyncQueue {

    // };
  
    
  } //?namespace trace
} //?namespace scabbard
