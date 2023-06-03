/**
 * @file TraceData.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief The data object that holds all of the data pertaining to a trace entry 
 *        (plus some read and write operations)
 * @version alpha 0.0.1
 * @date 2023-06-02
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#pragma once

#include "Enums.hpp"

#include <cstdint>
#include <thread>
#include <type_traits>


namespace scabbard {

typedef std::thread::id HostThreadId;
::std::static_assert(sizeof(HostThreadId) <= sizeof(size_t)*2, "HostThreadId is of the correct size");

#pragma pack(1)
struct blockId_t {
  uint32_t x;
  uint16_t y;
  uint16_t z;
  __device__ __forceinline__ blockId_t()
  {
    x = blockIdx.x;  
    y = blockIdx.y;
    z = blockIdx.z;
  }
  __host__ blockId_t(const dim3& blockId)
    : x(blockId.x),  
      y(blockId.y),
      z(blockId.z)
    {}
};
::std::static_assert(sizeof(blockId_t) <= sizeof(size_t), "blockId_t is of the correct size");

#pragma pack(1)
struct threadId_t {
  uint16_t x;
  uint16_t y;
  uint8_t z;
  __device__ __forceinline__ threadId_t() 
  {
    x = threadIdx.x;  
    y = threadIdx.y;
    z = threadIdx.z;
  }
  __host__ threadId_t(const dim3& threadId)
    : x(threadId.x),  
      y(threadId.y),
      z(threadId.z)
    {}
};
::std::static_assert(sizeof(threadId_t) <= sizeof(size_t), "threadId_t is of the correct size");

struct DeviceThreadId {
  blockId_t block;
  threadId_t thread;
  __device__ DeviceThreadId() {}
  __host__ DeviceThreadId(const dim3& blockId, const dim3& threadId) : block(blockId), thread(threadId) {}
};
::std::static_assert(sizeof(DeviceThreadId) <= sizeof(size_t)*2, "DeviceThreadID is of the correct size");

union ThreadId {
  HostThreadId host;
  DeviceThreadId device;
};
::std::static_assert(sizeof(ThreadId) <= sizeof(size_t)*2, "ThreadID is of the correct size");


struct TraceData {
  InstrData     data;
  ThreadId      threadId;
  void*         ptr;
  void*         metadata; //TODO update this with whatever type llvm metadata ends up having
  long long     time_stamp;
  const size_t  buffer = 0ul;
};


} //?namespace scabbard
