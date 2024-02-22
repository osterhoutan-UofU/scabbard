/**
 * @file DeviceTracker.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief an object to be passed through the device calls to keep track of the data
 * @version alpha 0.0.1
 * @date 2024-02-15
 * 
 * @copyright Copyright (c) 2024
 * 
 */

#pragma once

#include <scabbard/TraceData.hpp>

#include <cstdint>
#include <hip/hip_runtime.h>
#include <hip/hip_runtime_api.h>

#define SCABBARD_DEVICE_TRACKER_BUFF_LENGTH (128ul)


namespace scabbard {
namespace trace {
namespace device {

  struct DeviceTracker {
    const jobId_t JOB_ID;
    _Atomic(uint64_t) vClk;
    _Atomic(size_t) next = 0ul;
    size_t last_read = 0ul;
    _Atomic(bool) finished = false;
    TraceData buffer[SCABBARD_DEVICE_TRACKER_BUFF_LENGTH];
    __host__
    DeviceTracker(const jobId_t& JOB_ID_, uint64_t vClk_)
      : JOB_ID(JOB_ID_), vClk(vClk_)
    {
      std::memset(buffer, 0u, sizeof(TraceData)*SCABBARD_DEVICE_TRACKER_BUFF_LENGTH);
    }
  };



} //?namespace device
} //?namespace trace
} //?namespace scabbard