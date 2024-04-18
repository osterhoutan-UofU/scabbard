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
#include <scabbard/trace/calls.hpp>
#include <src/device-defs.cpp>

#include <string>
#include <iostream>

#define DIM (32ul)

__managed__ size_t src_id = 0;

__global__
auto matrix_mul(double* A, double* B, double* C, void* DT) -> void
{// This is a device tracker passed through kernel fns /\
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
        &src_id, 38u, 3u
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
auto main() -> int 
{
  using namespace scabbard;
  src_id = scabbard::trace::metadata_register$src("test/device/dual-stream/def-race.man.cpp");
  scabbard::trace::scabbard_init();

  double* A, * B, * C1, * C2;
  hipStream_t S1, S2;

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
  HIP_CHECK(hipMalloc(&C1, sizeof(double)*DIM*DIM), "from `hipMalloc(&C1, ...)`");
  scabbard::trace::host::trace_append$alloc(
      InstrData::ALLOCATE | InstrData::ON_HOST | InstrData::DEVICE_HEAP,
      C1,
      &src_id, 73u, 13u,
      sizeof(double)*DIM*DIM
    );
  HIP_CHECK(hipMalloc(&C2, sizeof(double)*DIM*DIM), "from `hipMalloc(&C2, ...)`");
  scabbard::trace::host::trace_append$alloc(
      InstrData::ALLOCATE | InstrData::ON_HOST | InstrData::DEVICE_HEAP,
      C2,
      &src_id, 80u, 13u,
      sizeof(double)*DIM*DIM
    );

  HIP_CHECK(hipStreamCreate(&S1), "from `hipStreamCreate(&S1)`");
  HIP_CHECK(hipStreamCreate(&S2), "from `hipStreamCreate(&S2)`");

  void* DT1 = scabbard::trace::register_job(S1);
  matrix_mul<<<(dim3){1u,1u,1u},(dim3){DIM,DIM,1u},0ul,S1>>>(A,B,C1,DT1);
  scabbard::trace::register_job_callback(DT1, S1);
  void* DT2 = scabbard::trace::register_job(S2);
  matrix_mul<<<(dim3){1u,1u,1u},(dim3){DIM,DIM,1u},0ul,S2>>>(A,B,C2,DT2);
  scabbard::trace::register_job_callback(DT2, S2);


  // NOT SYNCING on any stream will almost grantee that a race occurs (given other measures taken)


  double tmp1, tmp2, res_sum = 0.0L;
  for (size_t i=(DIM*DIM)-1ul; i>=0ul; --i) { // iterating backwards can help ensure that the race occurs
    tmp1 = C1[i];
    scabbard::trace::host::trace_append$mem(
        InstrData::READ | InstrData::ON_HOST | InstrData::DEVICE_HEAP,
        &(C1[i]),
        &src_id, 104u, 5u
      );
    tmp1 = C2[i];
    scabbard::trace::host::trace_append$mem(
        InstrData::READ | InstrData::ON_HOST | InstrData::DEVICE_HEAP,
        &(C2[((DIM*DIM)-1)-i]),
        &src_id, 110u, 5u
      );
    res_sum += tmp1 + tmp2;
  }

  HIP_CHECK(hipFree(A), "from `hipFree(A)`");
  scabbard::trace::host::trace_append$mem(
      InstrData::FREE | InstrData::ON_HOST | InstrData::DEVICE_HEAP,
      A,
      &src_id, 119u, 13u
    );
  HIP_CHECK(hipFree(B), "from `hipFree(B)`");
  scabbard::trace::host::trace_append$mem(
      InstrData::FREE | InstrData::ON_HOST | InstrData::DEVICE_HEAP,
      B,
      &src_id, 125u, 13u
    );
  HIP_CHECK(hipFree(C1), "from `hipFree(C1)`");
  scabbard::trace::host::trace_append$mem(
      InstrData::FREE | InstrData::ON_HOST | InstrData::DEVICE_HEAP,
      C1,
      &src_id, 131u, 13u
    );
  HIP_CHECK(hipFree(C2), "from `hipFree(C2)`");
  scabbard::trace::host::trace_append$mem(
      InstrData::FREE | InstrData::ON_HOST | InstrData::DEVICE_HEAP,
      C2,
      &src_id, 137u, 13uDIM
    );

  return 0;
}

