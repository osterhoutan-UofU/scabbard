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
};
::std::static_assert(sizeof(blockId_t) <= sizeof(size_t), "blockId_t is of the correct size");

#pragma pack(1)
struct threadId_t {
  uint16_t x;
  uint16_t y;
  uint8_t z;
};
::std::static_assert(sizeof(threadId_t) <= sizeof(size_t), "threadId_t is of the correct size");

struct DeviceThreadId {
  blockId_t block;
  threadId_t thread;
};
::std::static_assert(sizeof(DeviceThreadId) <= sizeof(size_t)*2, "DeviceThreadID is of the correct size");

union ThreadId {
  HostThreadId host;
  DeviceThreadId device;
  void* _NONE_;
  ThreadId(void* _) { this->_NONE_ = nullptr; }
  bool ok() const { return this->_NONE_ != nullptr; } 
};
::std::static_assert(sizeof(ThreadId) <= sizeof(size_t)*2, "ThreadID is of the correct size");


struct TraceData {
  // DATA
  const InstrData     data        = InstrData::NEVER;
  const ThreadId      threadId    = ((void*)nullptr);
  const void*         ptr         = nullptr;
  const void*         metadata    = nullptr; //TODO update this with whatever type llvm metadata ends up having
  const size_t        time_stamp  = 0ul;
  const size_t        _BUFFER     = 0ul;

  // Constructors
  TraceData() = default;
  TraceData(const TraceData& other) = default;
  TraceData(InstrData data_, const ThreadId& threadId_,
                    void* ptr_, void* metadata_, size_t time_stamp_)
  : data(data_), threadId(threadId_),
    ptr(ptr_), metadata(metadata_), time_stamp(time_stamp_)
  {}
  inline bool empty() const { return data == InstrData::NEVER; }
  // Explicit operators
  inline TraceData& operator = (const TraceData& other) = default;
  inline operator bool () const { return data != InstrData::NEVER; }
};


} //?namespace scabbard
