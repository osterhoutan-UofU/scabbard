/**
 * @file TraceReader.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief A class object that reads in a scabbard trace file
 * @version alpha 0.0.1
 * @date 2023-11-17
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#pragma once

#include "BufferedReader.hpp"

#include <scabbard/TraceFile.hpp>
#include <scabbard/TraceData.hpp>
#include <scabbard/Metadata.hpp>

#include <string>
#include <set>
#include <memory>

namespace scabbard {
namespace verif {


  using TraceFile = scabbard::ITraceFileContainerMixer<BufferedReader>;


  /**
   * @brief read in a trace file and initiate the buffered reader with provided  
   */
  TraceFile readTraceFile(const std::string& filepath, 
                          uint64_t BuffSizeBytes=BufferedReader<TraceData>::_BuffSizeBytes, 
                          size_t ChunkSizeElem=BufferedReader<TraceData>::_ChunkSizeElem);


} //?namespace verif
} //?namespace scabbard
