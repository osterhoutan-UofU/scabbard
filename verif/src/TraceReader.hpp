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

#include <scabbard/TraceFile.hpp>
#include <scabbard/TraceData.hpp>
#include <scabbard/Metadata.hpp>

#include <string>
#include <set>
#include <memory>

namespace scabbard {
namespace verif {


  class TraceFile

  /**
   * @brief read in a trace file and 
   * @param filepath the path to the file to be read
   * @return \c std::unique_ptr<std::multiset<TraceData>> - 
   */
  TraceFile readTraceFile(const std::string& filepath);


} //?namespace verif
} //?namespace scabbard
