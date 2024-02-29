/**
 * @file managed_clock_test.cpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief test to see how frequently and when managed memory updates across GPU & CPU (when atomic)
 * @version alpha 0.0.1
 * @date 2024-01-17
 * 
 * @copyright Copyright (c) 2024
 * 
 */


#include <hip/hip_runtime.h>
#include <hip/hip_runtime_api.h>
#include <hip/math_functions.h>

#include <iostream>
#include <iomanip>
#include <string>
#include <atomic>
#include <chrono>
#include <thread>
#include <cstring>

__host__
void __HIP_CHECK__(hipError_t resCode);

__device__
void dummy_work(int64_t* dummy_data);
__global__
void dummy_init(int64_t* dummy_data);


// << ========================================================================================== >> 
// <<                                  SINGLE THREAD TICK TEST                                   >> 
// << ========================================================================================== >> 

// __global__
// void tick_single_kernel(std::atomic<uint64_t>* clk, uint64_t* val, int64_t* dummy_data)
// {
//   //TODO maybe? might not be necessary
// }

// __host__ 
// void tick_single_test()
// {
//   //TODO maybe? might not be necessary
// }



// << ========================================================================================== >> 
// <<                                   ALL THREAD TICK TEST                                     >> 
// << ========================================================================================== >> 

__global__
void tick_all_kernel(_Atomic(uint64_t)* clk, uint64_t* vals, int64_t* dummy_data, int test)
{
  dummy_work(dummy_data);
  vals[threadIdx.x+test] = (*clk += 1);
  __syncthreads();
  dummy_work(dummy_data);
}

__host__ __noinline__
void tick_all_test(int test)
{
  int device = 0;
  __HIP_CHECK__(hipGetDevice(&device));
  std::cout << "\n==== STARTING TEST: tick all ====\n\n" << std::flush;
  std::cout << "Using GPU with device ID: " << device << std::endl;
  const uint32_t SIZE = 1024;
  int64_t spin_limit = 64ul;
  const size_t DISPLAY_LIMIT = 128ul;
  const size_t DISPLAY_LINE_LIMIT = 16ul;
  assert(SIZE >= DISPLAY_LIMIT);


  _Atomic(uint64_t)* clk;
  __HIP_CHECK__(hipMallocManaged(&clk, hipMemAttachGlobal));
  // __HIP_CHECK__(hipMalloc(&clk, sizeof(uint64_t)));
  *clk = 0ul;


  uint64_t *h_vals = new uint64_t[SIZE];
  std::memset(h_vals, 0u, SIZE*sizeof(uint64_t));
  uint64_t* d_vals;
  __HIP_CHECK__(hipMalloc(&d_vals, SIZE*sizeof(uint64_t)));
  __HIP_CHECK__(hipMemcpy(d_vals, h_vals, SIZE*sizeof(uint64_t), hipMemcpyHostToDevice));


  int64_t *dummy_data; 
  __HIP_CHECK__(hipMalloc(&dummy_data, SIZE*sizeof(int64_t)));

 hipLaunchKernelGGL(dummy_init, dim3(1), dim3(SIZE), 0,0, dummy_data);
  
  // __HIP_CHECK__(hipDeviceSynchronize());
  int64_t *h_dummy_data = new int64_t[SIZE];
  std::memset(h_dummy_data, 0u, SIZE*sizeof(int64_t));
  __HIP_CHECK__(hipMemcpy(h_dummy_data, dummy_data, SIZE*sizeof(uint64_t), hipMemcpyDeviceToHost));
  std::cout << "Dummy Data init: {";
  for (size_t i=0; i<DISPLAY_LIMIT; ++i) {
    if (i % DISPLAY_LINE_LIMIT == 0)
      std::cout << "\n    ";
    std::cout << std::setfill(' ') << std::setw(8) << h_dummy_data[i] << " ";
  }
  if (DISPLAY_LIMIT < SIZE)
    std::cout << "\n    " << std::setfill(' ') << std::setw(8) << "...";
  std::cout << "\n  }\n" << std::flush;



  tick_all_kernel<<<dim3(1), dim3(SIZE), 0,0>>>(clk, d_vals, dummy_data, test);



  do {
    std::this_thread::sleep_for(std::chrono::milliseconds(1));
  } while (*clk == 0 || (--spin_limit)>0  );

  if (*clk != 0)
    std::cout << "\nSUCCESS managed mem registered change before call to sync!" << std::endl;



  // __HIP_CHECK__(hipDeviceSynchronize());



  __HIP_CHECK__(hipMemcpy(h_vals, d_vals, SIZE*sizeof(uint64_t), hipMemcpyDeviceToHost));



  std::cout << "\nFinal ``Clock'' time: " << *clk 
            << "\nGPU Threads modified as follows: {";
  
  for (size_t i=0; i<DISPLAY_LIMIT; ++i) {
    if (i % DISPLAY_LINE_LIMIT == 0)
      std::cout << "\n    ";
    std::cout << std::setfill(' ') << std::setw(8) << h_vals[i] << " ";
  }
  if (DISPLAY_LIMIT < SIZE)
    std::cout << "\n    " << std::setfill(' ') << std::setw(8) << "...";
  std::cout << "\n  }\n" << std::endl;



  __HIP_CHECK__(hipFree(d_vals));
  __HIP_CHECK__(hipFree(clk));
  __HIP_CHECK__(hipFree(dummy_data));
  delete[] h_vals; delete[] h_dummy_data;
  std::cout << "\n==== ENDING TEST: tick all ====\n\n" << std::flush;
}
__global__
void dummy_kernel()
{
  __syncthreads();
}


// << ========================================================================================== >> 
// <<                                           MAIN                                             >> 
// << ========================================================================================== >> 

int main(int argc, char** argv)
{
  using namespace std;
  hipDeviceProp_t devProp;
  __HIP_CHECK__(hipGetDeviceProperties(&devProp, 0));
  cout << " System minor " << devProp.minor << endl;
  cout << " System major " << devProp.major << endl;
  cout << " agent prop name " << devProp.name << endl;
  // tick_single_test();
  tick_all_test(argc);
  dummy_kernel<<<dim3(1024),dim3(1024),0,0>>>();
  return 0;
}

__host__
void __HIP_CHECK__(hipError_t resCode) {
  if (resCode != hipSuccess) {
    std::cerr << "\nHIP ERROR: " << resCode << std::endl; 
    exit(EXIT_FAILURE); 
  } 
}

__global__
void dummy_init(int64_t* dummy_data)
{
  int i = hipThreadIdx_x + hipBlockDim_x * hipBlockIdx_x;
  dummy_data[i] = 0l;
}

__device__
void dummy_work(int64_t* dummy_data)
{
  int i = hipThreadIdx_x + hipBlockDim_x * hipBlockIdx_x;
  dummy_data[i] += i;
}
