/**
 * @file test.cpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief a synthetic test for determining the impact on how much reads and writes impact scabbard performance
 *        Won't build unless CPU_READ_MOD, GPU_WRITE_MOD, and DATA_SIZE are defined in your compile command
 * @version alpha 0.0.1
 * @date 2025-01-17
 * 
 * @copyright Copyright (c) 2025
 * 
 */

#include <hip/hip_runtime.h>

#include <thread>
#include <chrono>
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
  for (size_t I=0ul; I<GPU_WRITE_MOD; I++) {
    C[ROW*DIM + COL] = tmp_sum + I;
  }
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

  matrix_mul<<<(dim3){1u,1u,1u},(dim3){DIM,DIM,1u},0ul,0ul>>>(A,B,C);

  // sync will prevent any data races from occurring
  HIP_CHECK(hipStreamSynchronize(0ul), "from `hipStreamSynchronize(0ul)`");

    double res_sum = 0.0L;
    for (size_t i=0; i<(DIM*DIM); ++i)
      for (size_t I=0ull; I<CPU_READ_MOD; ++I) {
        res_sum += C[i] + I;
      }

  HIP_CHECK(hipFree(A), "from `hipFree(A)`");
  HIP_CHECK(hipFree(B), "from `hipFree(B)`");
  HIP_CHECK(hipFree(C), "from `hipFree(C)`");

  std::cout << res_sum << std::endl;

  return 0;
}

