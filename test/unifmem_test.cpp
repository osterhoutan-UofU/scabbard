/**
 * @file unifmem_test.cpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief A simple program that uses unified memory for testing how the IR and races can be monitored.
 *        This is mostly meant just as a way to see the IR, 
 *         but latter might be reused/extended to test runtime impacts of accessing unified memory addresses
 * 
 * @version alpha 0.0.1
 * @date 2023-04-25
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include <iostream>
#include <chrono>
#include <cstring>
#include <atomic>

#ifdef ENABLE_HIP_CPU
// #include <hip/hip_ext.h>
#include <hip/hip_runtime.h>
#include <hip/hip_runtime_api.h>
#else
#include <hip/hip_ext.h>
#include <hip/hip_runtime.h>
#include <hip/hip_runtime_api.h>
#endif

#define VALUE_COUNT (8ul)

__managed__ std::size_t __m_val__ = 0xFACE;
__host__ std::size_t __h_val__ = 0x1ace;
__device__ std::size_t __d_val__ = 0xBA5E;
std::size_t __b_val__ = 0xFADE;

__managed__ _Atomic(size_t) __m_atomic__(0xDAB);
__host__ _Atomic(size_t) __h_atomic__(0xBAD);
__device__ _Atomic(size_t) __d_atomic__(0x5AD);
_Atomic(size_t) __b_atomic__(0x1ad);

struct time_data_t {
  long long read;
  long long write;
};

// macro that lets me write the test code once but implement it multiple times
#define GEN_UNIFMEM_TEST(t, v1) {\
    size_t v = 0ul; \
    v += (v1); \
    (v1) ^= !v; \
  }

// __device__ void __unifmem_device_test__impl__() {
//   GEN_UNIFMEM_TEST(std::size_t, __m_val__)
//   // GEN_UNIFMEM_TEST(std::size_t, __h_val__)
//   GEN_UNIFMEM_TEST(std::size_t, __d_val__)
//   // GEN_UNIFMEM_TEST(std::size_t, __b_val__)
//   GEN_UNIFMEM_TEST(_Atomic(size_t), __m_atomic__)
//   // GEN_UNIFMEM_TEST(_Atomic(size_t), __h_atomic__)
//   GEN_UNIFMEM_TEST(_Atomic(size_t), __d_atomic__)
//   // GEN_UNIFMEM_TEST(_Atomic(size_t), __b_atomic__)
// }

// __global__ void __unifmem_device_test__call__() {
//   __unifmem_device_test__impl__();
// }

__global__ void __unifmem_global_test__(std::size_t* __dh_val__, _Atomic(size_t)* __dh_atomic__,
                                        std::size_t* __hh_val__, _Atomic(size_t)* __hh_atomic__,
                                        std::size_t& __hl_val__, _Atomic(size_t)& __hl_atomic__) {
  GEN_UNIFMEM_TEST(std::size_t, __m_val__)
  // GEN_UNIFMEM_TEST(std::size_t, __h_val__)
  GEN_UNIFMEM_TEST(std::size_t, __d_val__)
  // GEN_UNIFMEM_TEST(std::size_t, __b_val__)
  GEN_UNIFMEM_TEST(_Atomic(size_t), __m_atomic__)
  // GEN_UNIFMEM_TEST(_Atomic(size_t), __h_atomic__)
  GEN_UNIFMEM_TEST(_Atomic(size_t), __d_atomic__)
  // GEN_UNIFMEM_TEST(_Atomic(size_t), __b_atomic__)
  GEN_UNIFMEM_TEST(std::size_t, *__dh_val__)
  GEN_UNIFMEM_TEST(_Atomic(size_t), *__dh_atomic__)
  GEN_UNIFMEM_TEST(std::size_t, *__hh_val__)
  GEN_UNIFMEM_TEST(_Atomic(size_t), *__hh_atomic__)
  GEN_UNIFMEM_TEST(std::size_t, __hl_val__)
  GEN_UNIFMEM_TEST(_Atomic(size_t), __hl_atomic__)
}

__host__ void __unifmem_host_test__(std::size_t* __dh_val__, _Atomic(size_t)* __dh_atomic__,
                                    std::size_t* __hh_val__, _Atomic(size_t)* __hh_atomic__,
                                    std::size_t& __hl_val__, _Atomic(size_t)& __hl_atomic__
                                    ) {
  GEN_UNIFMEM_TEST(std::size_t, __m_val__)
  GEN_UNIFMEM_TEST(std::size_t, __h_val__)
  GEN_UNIFMEM_TEST(std::size_t, __d_val__)
  GEN_UNIFMEM_TEST(std::size_t, __b_val__)
  GEN_UNIFMEM_TEST(_Atomic(size_t), __m_atomic__)
  GEN_UNIFMEM_TEST(_Atomic(size_t), __h_atomic__)
  GEN_UNIFMEM_TEST(_Atomic(size_t), __d_atomic__)
  GEN_UNIFMEM_TEST(_Atomic(size_t), __b_atomic__)
  GEN_UNIFMEM_TEST(std::size_t, *__dh_val__)
  GEN_UNIFMEM_TEST(_Atomic(size_t), *__dh_atomic__)
  GEN_UNIFMEM_TEST(std::size_t, *__hh_val__)
  GEN_UNIFMEM_TEST(_Atomic(size_t), *__hh_atomic__)
  GEN_UNIFMEM_TEST(std::size_t, __hl_val__)
  GEN_UNIFMEM_TEST(_Atomic(size_t), __hl_atomic__)
}


int main() {
 
  std::size_t __hl_val__ = 0x5AD;
  _Atomic(size_t) __hl_atomic__(0x5AD);
  std::size_t* __hh_val__ = (std::size_t*) std::malloc(sizeof(std::size_t));
  *__hh_val__ = 0x5AD;
  _Atomic(size_t)* __hh_atomic__ = (_Atomic(size_t)*) std::malloc(sizeof(_Atomic(size_t)));
  *__hh_atomic__ = 0x5AD;
  std::size_t* __dh_val__ = nullptr;
  hipMalloc(&__dh_val__, sizeof(std::size_t));
  *__dh_val__ = 0x5AD;
  _Atomic(size_t)* __dh_atomic__ = nullptr;
  hipMalloc(&__dh_atomic__,sizeof(_Atomic(size_t)));
  *__dh_atomic__ = 0x5AD;

  __unifmem_host_test__(__dh_val__, __dh_atomic__, 
                        __hh_val__, __hh_atomic__,
                        __hl_val__, __hl_atomic__);
  // __unifmem_global_test__(); // not valid for hip apparently (probs because it's interpreted as a kernel launch not just a general funct)
  hipLaunchKernelGGL(__unifmem_global_test__, dim3(1), dim3(16), 0,0,
                        __dh_val__, __dh_atomic__, 
                        __hh_val__, __hh_atomic__,
                        __hl_val__, __hl_atomic__);
  // hipLaunchKernelGGL(__unifmem_device_test__call__, dim3(1), dim3(16), 0,0);

  std::cout << "hello world " << __m_val__ << std::endl;

}
