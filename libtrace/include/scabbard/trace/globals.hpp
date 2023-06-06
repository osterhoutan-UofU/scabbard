/**
 * @file globals.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief Instrumentation globals extern definitions
 * @version alpha 0.0.1
 * @date 2023-05-30
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#pragma once

#include <scabbard/trace/AsyncQueue.hpp>
#include <scabbard/trace/TraceWriter.hpp>

namespace scabbard {
  namespace trace {

    extern AsyncQueue TRACE_LOGGER;
    extern __device__ DeviceAsyncQueue DEVICE_TRACE_LOGGER;
  
  } //?namespace trace
} //?namespace scabbard
