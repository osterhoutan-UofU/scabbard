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


struct TraceFile {

  uint8_t VER_MAJOR;
  uint8_t VER_MINOR;
  uint8_t VER_PATCH;

  uint32_t WORD_LEN;
  uint32_t START_TIME;

  std::string EXE_PATH;

  std::multiset<TraceData> trace_data;

  std::vector<std::string> src_files;

};

} //?namespace scabbard
