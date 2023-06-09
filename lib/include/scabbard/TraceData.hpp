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

#ifdef __scabbard_hip_compile
# include <hip/hip_ext.h>
# include <hip/hip_runtime_api.h>
#else
# include <scabbard/dim3.hpp>
#endif

#include <cstdint>
#include <cstring>
#include <thread>
#include <type_traits>
#include <new>


namespace scabbard {
  namespace trace {

#pragma pack(1)
struct blockId_t {
  uint32_t x = 0u;
  uint16_t y = 0u;
  uint16_t z = 0u;
  // __device__ blockId_t()
  // {
  //   x = blockIdx.x;  
  //   y = blockIdx.y;
  //   z = blockIdx.z;
  // }
# ifdef __scabbard_hip_compile
    __host__ __device__ 
    inline blockId_t(const dim3& blockId)
# else
    inline blockId_t(const scabbard::dim3& blockId)
# endif
    : x(blockId.x),  
      y(blockId.y),
      z(blockId.z)
    {}
};
#pragma pack()
// static_assert(sizeof(blockId_t) <= __WORDSIZE, "blockId_t is of the correct size");

#pragma pack(1)
struct threadId_t {
  uint16_t x;
  uint16_t y;
  uint8_t z;
  // __device__ threadId_t()
  // {
  //   x = threadIdx.x;  
  //   y = threadIdx.y;
  //   z = threadIdx.z;
  // }
# ifdef __scabbard_hip_compile
    __host__ __device__ 
    inline threadId_t(const dim3& threadId)
# else
    inline threadId_t(const scabbard::dim3& threadId)
# endif
    : x(threadId.x),  
      y(threadId.y),
      z(threadId.z)
    {}
};
#pragma pack()
// static_assert(sizeof(threadId_t) <= __WORDSIZE, "threadId_t is of the correct size");

struct DeviceThreadId {
  blockId_t block;
  threadId_t thread;
# ifdef __scabbard_hip_compile
    __host__ __device__ 
  inline DeviceThreadId(const dim3& blockId, const dim3& threadId) 
    : block(blockId), thread(threadId) 
  {}
# else
  inline DeviceThreadId(const blockId_t& b, const threadId_t& t)
    : block(b), thread(t)
  {}
  inline DeviceThreadId(const scabbard::dim3& b, const scabbard::dim3& t)
    : block(b), thread(t)
  {}
  inline DeviceThreadId(const threadId_t& t)
    : block({0u,0u,0u}), thread(t) 
  {}
  inline DeviceThreadId(const scabbard::dim3& t)
    : block({0u,0u,0u}), thread(t)
  {}
  inline DeviceThreadId(uint32_t thread_x, uint32_t thread_y=0u, uint32_t thread_z=0u)
    : block({0u,0u,0u}), thread((scabbard::dim3){thread_x,thread_y,thread_z}) 
  {}
# endif
};
// static_assert(sizeof(DeviceThreadId) <= __WORDSIZE*2, "DeviceThreadID is of the correct size");

typedef std::thread::id HostThreadId;
static_assert(sizeof(HostThreadId) <= sizeof(DeviceThreadId), "HostThreadId is of the correct size");

union ThreadId {
  HostThreadId host;
  DeviceThreadId device;
  void* _NONE_;
# ifdef __scabbard_hip_compile
  __device__ inline ThreadId(const dim3& blockId_, const dim3& threadId_) { device = DeviceThreadId(blockId_, threadId_); }
  __host__ ThreadId() { std::memset(this,0,sizeof(ThreadId)); this->host = ::std::this_thread::get_id(); }
    __host__ __device__
# endif
  ThreadId(void* _) { std::memset(this,0,sizeof(ThreadId)); }
  // __host__ __device__ bool ok() const { return this->_NONE_ != nullptr; } 
};
static_assert(sizeof(ThreadId) <= __WORDSIZE*2, "ThreadID is of the correct size");


struct TraceData {
  // DATA
  const InstrData     data        = InstrData::NEVER;
  const ThreadId      threadId    = ((void*)nullptr);
  const void*         ptr         = nullptr;
  const void*         metadata    = nullptr; //TODO update this with whatever type llvm metadata ends up having
        size_t        time_stamp  = 0ul;
  const size_t        _BUFFER     = 0ul;

  // Constructors
# ifdef __scabbard_hip_compile
    __host__ __device__ 
# endif
  TraceData() = default;
# ifdef __scabbard_hip_compile
    __host__ __device__ 
# endif
  TraceData(const TraceData& other) { std::memcpy(this, &other, sizeof(TraceData)); }
# ifdef __scabbard_hip_compile
  __device__ TraceData(InstrData data_, 
                        const dim3& blockId_, const dim3 threadId_,
                        const void* ptr_, const void* metadata_,
                        const size_t time_stamp_)
    : data(data_), threadId(blockId_, threadId_), 
      ptr(ptr_), metadata(metadata_), time_stamp(time_stamp_)
    {}
    __host__ __device__ 
  __host__ TraceData(InstrData data_, const void* ptr_, const void* metadata_)
    : data(data_), threadId(), ptr(ptr_), metadata(metadata_), 
      time_stamp(std::chrono::high_resolution_clock::now().time_since_epoch().count())
  {}
  __host__ 
# endif
  TraceData(InstrData data_, const ThreadId& threadId_,
                     void* ptr_, void* metadata_, size_t time_stamp_)
    : data(data_), threadId(threadId_),
      ptr(ptr_), metadata(metadata_), time_stamp(time_stamp_)
  {}
# ifdef __scabbard_hip_compile
    __host__ __device__ 
# endif 
  inline bool empty() const { return data == InstrData::NEVER; }
  // Explicit operators
# ifdef __scabbard_hip_compile
    __host__ __device__ 
# endif
  inline TraceData& operator = (const TraceData& other) { std::memcpy(this, &other, sizeof(TraceData)); return *this; };
# ifdef __scabbard_hip_compile
    __host__ __device__ 
# endif 
  inline operator bool () const { return data != InstrData::NEVER; }
};


} //?namespace trace
} //?namespace scabbard
