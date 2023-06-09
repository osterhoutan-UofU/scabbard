/**
 * @file dim3.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief standing in for hip's dim3 type when compiling without hip
 * @version alpha 0.0.1
 * @date 2023-06-09
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#pragma once

#include <cstdint>

#ifndef HIP_INCLUDE_HIP_HIP_RUNTIME_API_H
// #define HIP_INCLUDE_HIP_HIP_RUNTIME_API_H

namespace scabbard {

struct dim3 {
  uint32_t x;  ///< x
  uint32_t y;  ///< y
  uint32_t z;  ///< z
# ifdef __cplusplus
    constexpr dim3(uint32_t _x = 1, uint32_t _y = 1, uint32_t _z = 1) : x(_x), y(_y), z(_z){};
# endif
};

} //?namespace scabbard

#endif
