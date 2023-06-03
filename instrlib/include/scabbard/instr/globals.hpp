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

#include <scabbard/instr/AsyncQueue.hpp>
#include <scabbard/instr/TraceWriter.hpp>


namespace scabbard {
  namespace instr {
  
    extern AsyncQueue* TRACE_LOGGER;
  
  } //?namespace instr
} //?namespace scabbard
