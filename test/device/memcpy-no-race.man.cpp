/**
 * @file memcpy-no-race.cpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief a simple test using device memory only and moving mem with hipMemcpy
 *        (manual instrumentation version)
 * @version alpha 0.0.1
 * @date 2024-04-16
 * 
 * @copyright Copyright (c) 2024
 * 
 */

#include <hip/hip_runtime.h>
#include <scabbard/trace/calls.hpp>
#include <src/device-defs.cpp>

#include <string>
#include <iostream>

#define DIM (64ul)

__managed__ size_t src_id = 0;

__global__
auto matrix_mul(double* A, double* B, double* C, void* DT) -> void
{
  using namespace scabbard;
  const size_t ROW = blockIdx.y*blockDim.y+threadIdx.y;
  const size_t COL = blockIdx.x*blockDim.x+threadIdx.x;
  double tmp_sum = 0.0L;
  for (size_t i=0; i<DIM; ++i)
    tmp_sum += A[ROW*DIM + i] * B[i*DIM + COL];
  double& tmp = C[ROW*DIM + COL];
  scabbard::trace::device::trace_append$mem(DT,
        (InstrData)(InstrData::WRITE | InstrData::ON_DEVICE | InstrData::DEVICE_HEAP),
        &tmp,
        &src_id, 39u, 3u
      );
  tmp = tmp_sum;
}

__host__
auto HIP_CHECK(hipError_t hipRes, const std::string& errMsg) -> void
{
  if (hipRes == hipSuccess) return;
  std::cerr << "\n[hip ERR: " << hipRes << "] " << errMsg << std::endl;
  exit(EXIT_FAILURE);
}

__host__
auto main(int argc, char** argv) -> int 
{
  using namespace scabbard;
  src_id = scabbard::trace::metadata_register$src("test/device/memcpy-no-race.man.cpp");
  scabbard::trace::scabbard_init();
  double* A, * B, * C;
  double out[DIM*DIM];

  HIP_CHECK(hipMalloc(&A, sizeof(double)*DIM*DIM), "from `hipMalloc(&A, ...)`");
  scabbard::trace::host::trace_append$alloc(
      InstrData::ALLOCATE | InstrData::ON_HOST | InstrData::DEVICE_HEAP,
      A,
      &src_id, 59u, 13u,
      sizeof(double)*DIM*DIM
    );
  HIP_CHECK(hipMalloc(&B, sizeof(double)*DIM*DIM), "from `hipMalloc(&B, ...)`");
  scabbard::trace::host::trace_append$alloc(
      InstrData::ALLOCATE | InstrData::ON_HOST | InstrData::DEVICE_HEAP,
      B,
      &src_id, 66u, 13u,
      sizeof(double)*DIM*DIM
    );
  HIP_CHECK(hipMalloc(&C, sizeof(double)*DIM*DIM), "from `hipMalloc(&C, ...)`");
  scabbard::trace::host::trace_append$alloc(
      InstrData::ALLOCATE | InstrData::ON_HOST | InstrData::DEVICE_HEAP,
      C,
      &src_id, 73u, 13u,
      sizeof(double)*DIM*DIM
    );

  void* DT = scabbard::trace::register_job(0ul);
  matrix_mul<<<(dim3){1u,1u,1u},(dim3){DIM,DIM,1u},0ul,0ul>>>(A,B,C,DT);
  scabbard::trace::register_job_callback(DT, 0ul);

  HIP_CHECK(hipMemcpy(out, C, sizeof(double)*DIM*DIM), "from `hipMemcpy(out, C, ...)`");
  scabbard::trace::host::trace_append$mem(
      InstrData::SYNC | InstrData::ON_HOST,
      0ul,
      &src_id, 85u, 13u
    );
  scabbard::trace::host::trace_append$alloc(
      InstrData::READ | InstrData::ON_HOST | InstrData::DEVICE_HEAP,
      C,
      &src_id, 85u, 13u,
      sizeof(double)*DIM*DIM
    );

  HIP_CHECK(hipFree(A), "from `hipFree(A)`");
  scabbard::trace::host::trace_append$mem(
      InstrData::FREE | InstrData::ON_HOST | InstrData::DEVICE_HEAP,
      A,
      &src_id, 98u, 13u
    );
  HIP_CHECK(hipFree(B), "from `hipFree(B)`");
  scabbard::trace::host::trace_append$mem(
      InstrData::FREE | InstrData::ON_HOST | InstrData::DEVICE_HEAP,
      B,
      &src_id, 104u, 13u
    );
  HIP_CHECK(hipFree(C), "from `hipFree(C)`");
  scabbard::trace::host::trace_append$mem(
      InstrData::FREE | InstrData::ON_HOST | InstrData::DEVICE_HEAP,
      C,
      &src_id, 110u, 13u
    );

  return 0;
}

