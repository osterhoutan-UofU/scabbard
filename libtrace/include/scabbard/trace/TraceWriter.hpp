/**
 * @file TraceWriter.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief The utility to write the trace files.
 * @version alpha 0.0.1
 * @date 2023-05-30
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#pragma once

#include <scabbard/TraceData.hpp>

#include <string>


namespace scabbard {
  namespace trace {
  

    class TraceWriter {
      //TODO

    public:
      TraceWriter(const std::string& trace_filepath_);
      ~TraceWriter();

      friend TraceWriter& operator << (TraceWriter& out, const TraceData& data);
    };
    
  
  } //?namespace trace
} //?namespace scabbard