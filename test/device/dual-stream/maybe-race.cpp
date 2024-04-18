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

  HIP_CHECK(hipStreamCreateWithPriority(&S1, hipStreamDefault, 0u), "from `hipStreamCreateWithPriority(&S1, ..., 0u)`");
  HIP_CHECK(hipStreamCreateWithPriority(&S2, hipStreamDefault, 8u), "from `hipStreamCreateWithPriority(&S2, ..., 8u)`");

  matrix_mul<<<(dim3){1u,1u,1u},(dim3){DIM,DIM,1u},0ul,S1>>>(A,B,C1);
  matrix_mul<<<(dim3){1u,1u,1u},(dim3){DIM,DIM,1u},0ul,S2>>>(A,B,C2);

  // syncing only one stream (especially the one created and launched first with a higher priority) leaves you at risk for data races
  HIP_CHECK(hipStreamSynchronize(S1), "from `hipStreamSynchronize(S1)`"); // only waiting for S1 job to finish

  double res_sum = 0.0L;
  for (size_t i=0; i<DIM*DIM; ++i)
    res_sum += C1[i] + C2[((DIM*DIM)-1ul)-i];  // Going backwards for C2 can make it technically possible to get a data race when S2 is left unsynced (but always a warning)

  HIP_CHECK(hipFree(A), "from `hipFree(A)`");
  HIP_CHECK(hipFree(B), "from `hipFree(B)`");
  HIP_CHECK(hipFree(C1), "from `hipFree(C1)`");
  HIP_CHECK(hipFree(C2), "from `hipFree(C2)`");

  return 0;
}

