/**
 * @file memcpy-no-race.cpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief a simple test using device memory only and moving mem with hipMemcpy
 * @version alpha 0.0.1
 * @date 2024-04-16
 * 
 * @copyright Copyright (c) 2024
 * 
 */

#include <hip/hip_runtime.h>
#include <scabbard/calls.hpp>
#include <src/device-defs.cpp>

#include <thread>
#include <chrono>
#include <string>
#include <iostream>

#define DIM (64ul)

__managed__ size_t src_id = 0;

__global__
auto matrix_mul(double* A, double* B, double* C) -> void
{
  using namespace scabbard;
  const size_t ROW = blockIdx.y*blockDim.y+threadIdx.y;
  const size_t COL = blockIdx.x*blockDim.x+threadIdx.x;
  double tmp_sum = 0.0d;
  for (size_t i=0; i<DIM; ++i)
    tmp_sum += A[ROW*DIM + i] * B[i*DIM + COL];
  double& tmp = C[ROW*DIM + COL];
  scabbard.trace.device.trace_append$mem(DT,
        InstrData::WRITE | InstrData::ON_DEVICE | InstrData::DEVICE_HEAP,
        &tmp,
        &src_id, 40u, 3u
      );
  tmp = tmp_sum;
}

__host__
auto HIP_CHECK(hipResult_t hipRes, const std::string& errMsg) -> void
{
  if (hipRes == hipSuccess) return;
  std::cerr << "\n[hip ERR: " << hipRes << "] " << errMsg << std::endl;
  exit(EXIT_FAILURE);
}

__host__
auto main() -> int 
{
  using namespace scabbard;
  src_id = scabbard.trace.metadata_register("test/device/maybe-race.man.cpp");
  scabbard::trace::scabbard_init();

  double* A,B,C;

  HIP_CHECK(hipMalloc(&A, sizeof(double)*DIM*DIM), "from `hipMalloc(&A, ...)`");
  scabbard.trace.host.trace_append$alloc(
      InstrData::ALLOCATE | InstrData::ON_HOST | InstrData::DEVICE_HEAP,
      A,
      &src_id, 60u, 13u,
      sizeof(double)*DIM*DIM
    );
  HIP_CHECK(hipMalloc(&B, sizeof(double)*DIM*DIM), "from `hipMalloc(&B, ...)`");
  scabbard.trace.host.trace_append$alloc(
      InstrData::ALLOCATE | InstrData::ON_HOST | InstrData::DEVICE_HEAP,
      B,
      &src_id, 67u, 13u,
      sizeof(double)*DIM*DIM
    );
  HIP_CHECK(hipMalloc(&C, sizeof(double)*DIM*DIM), "from `hipMalloc(&C, ...)`");
  scabbard.trace.host.trace_append$alloc(
      InstrData::ALLOCATE | InstrData::ON_HOST | InstrData::DEVICE_HEAP,
      C,
      &src_id, 74u, 13u,
      sizeof(double)*DIM*DIM
    );

  void* DT = scabbard.trace.register_job(0ul);
  matrix_mul<<<{1u,1u},{DIM,DIM},0ul,0ul>>>(A,B,C,DT);
  scabbard.trace.register_job_callback(DT, 0ul);

  // this is what makes this maybe race (we don't know how driver and OS will time things)
  std::this_thread::sleep_for(500ms);

  double res_sum = 0.0d;
  for (size_t i=0; i<DIM*DIM; ++i) {
    res_sum += C[i];
    scabbard::trace::host::trace_append$mem(
        InstrData::READ | InstrData::ON_HOST | InstrData::DEVICE_HEAP,
        &(C[i]),
        &src_id, 92u, 5u
      );
  }

  HIP_CHECK(hipFree(A), "from `hipFree(A)`");
  scabbard.trace.host.trace_append$mem(
      InstrData::FREE | InstrData::ON_HOST | InstrData::DEVICE_HEAP,
      A,
      &src_id, 90u, 13u
    );
  HIP_CHECK(hipFree(B), "from `hipFree(B)`");
  scabbard.trace.host.trace_append$mem(
      InstrData::FREE | InstrData::ON_HOST | InstrData::DEVICE_HEAP,
      B,
      &src_id, 105u, 13u
    );
  HIP_CHECK(hipFree(C), "from `hipFree(C)`");
  scabbard.trace.host.trace_append$mem(
      InstrData::FREE | InstrData::ON_HOST | InstrData::DEVICE_HEAP,
      C,
      &src_id, 115u, 13u
    );

  return 0;
}

