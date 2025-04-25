/**
 * @file TraceFile.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief The contents of a trace file
 * @version alpha 0.0.1
 * @date 2023-11-17
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#pragma once

#include "TraceData.hpp"
#include "Metadata.hpp"
#include "less.hpp"

#include <cinttypes>
#include <string>
#include <set>
#include <vector>


namespace scabbard {


template<template<typename> class S>
struct BaseTraceFile {

  uint8_t VER_MAJOR = 0;
  uint8_t VER_MINOR = 0;
  uint8_t VER_PATCH = 0;

  uint32_t WORD_LEN = 0;
  uint32_t START_TIME = 0;

  std::string EXE_PATH = "";

  S<TraceData> trace_data;

  using iterator = S<TraceData>::iterator;

  inline iterator begin() { return trace_data.begin(); }
  inline iterator end() { return trace_data.end(); }

};

using BasicTraceFile = BaseTraceFile<std::set>;

} //?namespace scabbard
