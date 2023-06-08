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

#include <cstring>
#include <iostream>
#include <deque>


namespace scabbard {
  namespace trace {


    // << ========================================================================================== >> 
    // <<                                     MAIN ASYNC QUEUE                                       >> 
    // << ========================================================================================== >> 


    __host__ 
    AsyncQueue::AsyncQueue()
    {
      //TODO handle the construction
      // set the values in the device last read tracker
      std::memset(&this->device_last_read,0u,sizeof(size_t)*SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT);
    }

    __host__ 
    AsyncQueue::~AsyncQueue()
    {
      if (deviceQ != nullptr)
        hipFree(deviceQ);
      if (tw != nullptr) {
        tw->finalize();
        tw->close();
        delete tw;
      }
    }

    __host__ 
    void AsyncQueue::set_trace_writer(const std::string& file_path, const std::string& exe_path, std::time_t start_time)
    {
      if (tw != nullptr) {
        tw->finalize();
        tw->close();
        delete tw;
      }
      tw = new TraceWriter(file_path);
      tw->init(exe_path, start_time);
    }

    __host__ 
    void AsyncQueue::set_device_queue(DeviceAsyncQueue* dq_)
    {
      if (dq_ == nullptr)
        return;
      if (deviceQ != nullptr)
        hipFree(deviceQ);
      deviceQ = dq_;
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
      using Lane = ::scabbard::trace::DeviceAsyncQueue::Lane;
      if (hipMemcpy(_db, deviceQ, sizeof(DeviceAsyncQueue), hipMemcpyDeviceToHost) 
            != hipSuccess) {
        std::cerr << "\n[scabbard::trace::ERROR] failed to copy the device side of the AsyncQueue for processing!\n";
#       ifdef DEBUG
          exit(EXIT_FAILURE);
#       else
          return;
#       endif
      }
      for (size_t lID=0; lID<SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT; ++lID) {
        const Lane& LANE = _db[lID];
        size_t ii = 0ul; // prevent from cycling forever when we roll over the limits of size_t
        const size_t LANE_NEXT = LANE.next; // get copy of atomic value to skip atomic reads since the buffer is frozen
        for (size_t i = device_last_read[lID]; 
              i != LANE_NEXT && ii < SCABBARD_DEVICE_CYCLE_BUFFER_LANE_LENGTH;
              (++i) + (++ii)) {
          if (not LANE[i].empty())
            tw << LANE[i];
        }
      }
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


    // << ========================================================================================== >> 
    // <<                                    DEVICE ASYNC QUEUE                                      >> 
    // << ========================================================================================== >> 


    __device__ inline 
    DeviceAsyncQueue::Lane& DeviceAsyncQueue::operator [] (size_t i) { return data[i]; }
    __host__ inline 
    const DeviceAsyncQueue::Lane& DeviceAsyncQueue::operator [] (size_t i) const { return data[i]; }

    __device__ inline 
    TraceData& DeviceAsyncQueue::Lane::operator [] (size_t j) { return data[j]; }
    __host__ inline 
    const TraceData& DeviceAsyncQueue::Lane::operator [] (size_t j) const { return data[j]; }


    __device__ inline 
    size_t DeviceAsyncQueue::getLaneId() const
    {
      return (size_t)(((blockDim.x*blockIdx.x) + (blockDim.y*blockIdx.y) + (blockDim.z*blockIdx.z)
              + threadIdx.x + threadIdx.y + threadIdx.z) % SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT);
    }

    __device__ 
    inline void DeviceAsyncQueue::append(TraceData tData)
    {
      const size_t lId = getLaneId();
      data[lId][(++data[lId].next)  // atomic so increment should happen at same time as load/copy
                % SCABBARD_DEVICE_CYCLE_BUFFER_LANE_LENGTH] = tData;
    }

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
