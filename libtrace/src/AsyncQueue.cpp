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

#include <scabbard/trace/AsyncQueue.hpp>

#include <hip/hip_ext.h>
#include <hip/hip_runtime_api.h>

#include <cstring>
#include <iostream>
#include <deque>
#include <thread>


namespace scabbard {
  namespace trace {


    // << ========================================================================================== >> 
    // <<                                     MAIN ASYNC QUEUE                                       >> 
    // << ========================================================================================== >> 


    __host__ 
    AsyncQueue::AsyncQueue()
    {
      // set the values in the device last read tracker
      // std::memset(&this->device_last_read,0u,sizeof(size_t)*SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT);
    }

    __host__ 
    AsyncQueue::~AsyncQueue()
    {
      stop();
      for (auto dt : device_trackers)
        if (dt != nullptr)
          if (hipFree(dt) != hipSuccess)
            std::cerr << "\n[scabbard::trace::dtor::ERROR] could not deallocate device side buffer!\n" 
                      << std::endl;
      if (tw != nullptr) {
        tw->finalize(metadata);
        tw->close();
        delete tw;
      }
    }


    __host__
    void AsyncQueue::start()
    {
      stop();
      run_worker = true;
      worker_thread = new std::thread([&,this]() -> void {
                                        while (this->run_worker) {
                                          std::this_thread::sleep_for(this->delay);
                                          this->async_process();
                                        }
                                      });
    }

    __host__
    void AsyncQueue::stop()
    {
      if (worker_thread != nullptr) {
        run_worker = false;
        worker_thread->join();
        delete worker_thread;
      }
    }

    template<class Rep, class Period>
    __host__ 
    void AsyncQueue::set_delay(const std::chrono::duration<Rep,Period>& delay_)
    {
      delay = delay_;
    }


    __host__ 
    void AsyncQueue::set_trace_writer(const std::string& file_path, const std::string& exe_path, std::time_t start_time)
    {
      if (tw != nullptr) {
        tw->finalize(metadata);
        tw->close();
        delete tw;
      }
      tw = new TraceWriter(file_path);
      tw->init(exe_path, start_time, metadata);
    }

    // __host__ 
    // void AsyncQueue::set_device_queue(DeviceAsyncQueue* dq_)
    // {
    //   if (dq_ == nullptr)
    //     return;
    //   if (deviceQ != nullptr)
    //     if (hipFree(deviceQ) != hipSuccess) {
    //       std::cerr << "\n[scabbard::trace::AsyncQueue::ERROR] could not properly deallocate device side buffer!\n"
    //                 << std::endl;
    //       exit(EXIT_FAILURE);
    //     }
    //   deviceQ = dq_;
    // }

    __host__
    device::DeviceTracker* AsyncQueue::add_job(const hipStream_t STREAM)
    {
      device::DeviceTracker* dt = nullptr;
      // hipError_t hipRes = hipMallocManaged(&dt, sizeof(device::DeviceTracker), hipMemAttachGlobal);
      hipError_t hipRes = hipHostMalloc(&dt, sizeof(device::DeviceTracker)), hipHostMallocCoherent | hipHostMallocPortable);
      if (hipRes != hipSuccess) {
        std::cerr << "\n[scabbard.trace:ERROR] failed to allocate managed memory before kernel launch!\n" << std::endl;
        exit(EXIT_FAILURE);
      }
      mx_device.lock();
      auto tmp = stream_job_counters.find(STREAM);
      if (tmp == stream_job_counters.end())
        stream_job_counters.emplace(std::make_pair(STREAM,0u));
      device_trackers.push_back(new device::DeviceTracker(jobId_t(tmp->second,STREAM), vClk++));
      stream_job_counters[STREAM] = tmp->second+1u; 
      mx_device.unlock();
      return dt;
    }

    __host__ 
    void AsyncQueue::append(TraceData tData)
    {
      mx_hostQ.lock();
      hostQ.push(tData);
      mx_hostQ.unlock();
    }



    __host__ 
    void AsyncQueue::async_process()
    {
      process_device(*tw);
      process_host(*tw);
    }

    __host__ 
    void AsyncQueue::process_device(TraceWriter& tw)
    {
      mx_device.lock();
      for (auto& dt : device_trackers) {
        if (dt == nullptr) continue;
        const size_t NEXT = dt->next; // get copy of atomic value to skip atomic reads since the buffer is frozen
        for (size_t i = dt->next_read; i < NEXT; ++i)
            tw << dt->buffer[i%SCABBARD_DEVICE_TRACKER_BUFF_LENGTH];
        dt->next_read = NEXT;
        if (dt->finished) { // deal with a device tracker that is done with it's job
          auto hipRes = hipFree(dt);
          if (hipRes != hipSuccess)
            std::cerr << "\n[scabbard.trace:ERR] failed to free a device tracker from managed memory! (errcode: " << hipRes << ")\n";
          dt = nullptr;
        }
      }
      mx_device.unlock();
    }

    __host__ 
    void AsyncQueue::process_host(TraceWriter& tw)
    {
      mx_hostQ.lock();
      while (not hostQ.empty()) {
        tw << hostQ.front();
        hostQ.pop();
      }
      mx_hostQ.unlock();
    }


    __host__ 
    std::uint64_t AsyncQueue::register_src(const char* src)
    {
      return metadata.register_src(src);
    }


    // << ========================================================================================== >> 
    // <<                                    DEVICE ASYNC QUEUE                                      >> 
    // << ========================================================================================== >> 


    // __host__
    // DeviceAsyncQueue::DeviceAsyncQueue() 
    //   : data()
    // {
    //   std::memset(data, 0u, sizeof(DeviceAsyncQueue::Lane)*SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT);
    // }
    // __host__
    // DeviceAsyncQueue::Lane::Lane() 
    //   : data()
    // {
    //   std::memset(data, 0u, sizeof(TraceData)*SCABBARD_DEVICE_CYCLE_BUFFER_LANE_LENGTH);
    // }

    // // __device__ inline 
    // // DeviceAsyncQueue::Lane& DeviceAsyncQueue::operator [] (size_t i) { return data[i]; }
    // __host__ inline 
    // const DeviceAsyncQueue::Lane& DeviceAsyncQueue::operator [] (size_t i) const { return data[i]; }

    // // __device__ inline 
    // // TraceData& DeviceAsyncQueue::Lane::operator [] (size_t j) { return data[j]; }
    // __host__ inline 
    // const TraceData& DeviceAsyncQueue::Lane::operator [] (size_t j) const { return data[j]; }


    // __device__ inline 
    // size_t DeviceAsyncQueue::getLaneId() // const
    // {
    //   return (size_t)(((blockDim.x*blockIdx.x) + (blockDim.y*blockIdx.y) + (blockDim.z*blockIdx.z)
    //           + threadIdx.x + threadIdx.y + threadIdx.z) % SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT);
    // }

    // __device__ 
    // inline void DeviceAsyncQueue::append(TraceData tData)
    // {
    //   const size_t lId = getLaneId();
    //   data[lId][(++data[lId].next)  // atomic so increment should happen at same time as load/copy
    //             % SCABBARD_DEVICE_CYCLE_BUFFER_LANE_LENGTH] = tData;
    // }
    // __device__ __host__ 
    // inline DeviceAsyncQueue&  DeviceAsyncQueue::operator += (const TraceData& tData)
    // {
    //   const size_t lId = getLaneId();
    //   data[lId][(++data[lId].next)  // atomic so increment should happen at same time as load/copy
    //             % SCABBARD_DEVICE_CYCLE_BUFFER_LANE_LENGTH] = tData;
    // }


    // __host__ 
    // DeviceAsyncQueue::DeviceAsyncQueue()
    // {
    //   for (size_t i=0; i<SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT; ++i) {
    //     data[i] = Lane();
    //   }
    // }

    // __host__ 
    // DeviceAsyncQueue::Lane::Lane()
    // {
    //   std::memset(&data,0,sizeof(TraceData)*SCABBARD_DEVICE_CYCLE_BUFFER_LANE_LENGTH);
    // }



    // << ========================================================================================== >> 
    // <<                                           HOST                                             >> 
    // << ========================================================================================== >> 
  

    
    
  
  } //?namespace trace
} //?namespace scabbard
