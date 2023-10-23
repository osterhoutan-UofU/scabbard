/**
 * @file less.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief redefinition of std::less for trace data 
 * @version alpha 0.0.1
 * @date 2023-10-20
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#pragma once

#include <scabbard/TraceData.hpp>

#include <functional>

namespace std {

template<>
struct less<scabbard::TraceData> {
  bool operator() ( const scabbard::TraceData& l, const scabbard::TraceData& r) const
  {
    if (l.time_stamp < r.time_stamp)
      return true;
    // else if (l.time_stamp == r.time_stamp) // might need this might not
    //   return ...
  }
};

} //?namespace std
