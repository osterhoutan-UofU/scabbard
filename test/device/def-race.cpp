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

#include <thread>
#include <chrono>
#include <string>
#include <iostream>

#define DIM (64ul)

__global__
auto matrix_mul(double* A, double* B, double* C) -> void
{
  const size_t ROW = blockIdx.y*blockDim.y+threadIdx.y;
  const size_t COL = blockIdx.x*blockDim.x+threadIdx.x;
  double tmp_sum = 0.0L;
  for (size_t i=0; i<DIM; ++i)
    tmp_sum += A[ROW*DIM + i] * B[i*DIM + COL];
  C[ROW*DIM + COL] = tmp_sum;
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
  double* A, * B, * C;
  double out[DIM*DIM];

  HIP_CHECK(hipMalloc(&A, sizeof(double)*DIM*DIM), "from `hipMalloc(&A, ...)`");
  HIP_CHECK(hipMalloc(&B, sizeof(double)*DIM*DIM), "from `hipMalloc(&B, ...)`");
  HIP_CHECK(hipMalloc(&C, sizeof(double)*DIM*DIM), "from `hipMalloc(&C, ...)`");

  matrix_mul<<<(dim3){1u,1u,1u,},(dim3){DIM,DIM,1},0ul,0ul>>>(A,B,C);

  double res_sum = 0.0L;
  for (int64_t i=(DIM*DIM)-1ul; i>=0ul; --i) // iterating backwards should ensure that we read something before a write.
    res_sum += C[i];

  HIP_CHECK(hipFree(A), "from `hipFree(A)`");
  HIP_CHECK(hipFree(B), "from `hipFree(B)`");
  HIP_CHECK(hipFree(C), "from `hipFree(C)`");

  return 0;
}

