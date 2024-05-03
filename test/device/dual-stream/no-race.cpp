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

#include <string>
#include <iostream>

#define DIM (32ul)

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
  double* A, * B, * C1, * C2;
  hipStream_t S1, S2;

  HIP_CHECK(hipMalloc(&A, sizeof(double)*DIM*DIM), "from `hipMalloc(&A, ...)`");
  HIP_CHECK(hipMalloc(&B, sizeof(double)*DIM*DIM), "from `hipMalloc(&B, ...)`");
  HIP_CHECK(hipMalloc(&C1, sizeof(double)*DIM*DIM), "from `hipMalloc(&C1, ...)`");
  HIP_CHECK(hipMalloc(&C2, sizeof(double)*DIM*DIM), "from `hipMalloc(&C2, ...)`");

  HIP_CHECK(hipStreamCreate(&S1), "from `hipStreamCreate(&S1)`");
  HIP_CHECK(hipStreamCreate(&S2), "from `hipStreamCreate(&S2)`");

  matrix_mul<<<(dim3){1u,1u,1u},(dim3){DIM,DIM,1u},0ul,S1>>>(A,B,C1);
  matrix_mul<<<(dim3){1u,1u,1u},(dim3){DIM,DIM,1u},0ul,S2>>>(A,B,C2);

  // syncing on 0ul (default stream) will sync all streams
  HIP_CHECK(hipStreamSynchronize(0ul), "from `hipStreamSynchronize(0ul)`"); // wait for all jobs to finish

  double res_sum = 0.0L;
  for (size_t i=0; i<DIM*DIM; ++i)
    res_sum += C1[i] + C2[i];

  HIP_CHECK(hipFree(A), "from `hipFree(A)`");
  HIP_CHECK(hipFree(B), "from `hipFree(B)`");
  HIP_CHECK(hipFree(C1), "from `hipFree(C1)`");
  HIP_CHECK(hipFree(C2), "from `hipFree(C2)`");

  std::cout << res_sum << std::endl;

  return 0;
}

