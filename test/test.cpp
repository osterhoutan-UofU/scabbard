
#include <iostream>
#include <chrono>
#include <cstring>

#ifdef ENABLE_HIP_CPU
// #include <hip/hip_ext.h>
#include <hip/hip_runtime.h>
#include <hip/hip_runtime_api.h>
#else
#include <hip/hip_ext.h>
#include <hip/hip_runtime.h>
#include <hip/hip_runtime_api.h>
#endif


__global__ void __d_increment(int* d_mem) {
    auto Id = threadIdx;
    int tmp;
    if (Id.x == 0) {
      tmp = 0;
    } else {
      tmp = d_mem[Id.x-1];
    }
    __syncthreads();
    tmp += 1;
    d_mem[Id.x] = tmp;
}



void hip_increment(int* h_out, int* h_in, const size_t ARRAY_SIZE)
{
  // auto __ld_increment = [=] __global__ (int* d_mem) {
  //     size_t i = threadIdx.x;
  //     int tmp;
  //     if (i == 0) {
  //       tmp = 0;
  //     } else {
  //       tmp = d_mem[i-1];
  //     }
  //     __syncthreads();
  //     tmp += 1;
  //     d_mem[i] = tmp;
  //   };
    const size_t ARRAY_BYTES = ARRAY_SIZE * sizeof(int);
    int* d_mem;

    hipMalloc((void**) &d_mem, ARRAY_BYTES);

    hipMemcpy(d_mem, h_in, ARRAY_BYTES, hipMemcpyHostToDevice);
    
    hipLaunchKernelGGL(__d_increment,dim3(1),dim3(ARRAY_SIZE),0,0,d_mem);
    hipDeviceSynchronize();

    hipMemcpy(h_out, d_mem, ARRAY_BYTES, hipMemcpyDeviceToHost);

    hipFree(d_mem);
}


void norm_increment(int* h_out, int* h_in, const size_t ARRAY_SIZE)
{
  for (size_t i=0; i<ARRAY_SIZE-1; i++)
    h_out[i+1] = h_in[i] + 1;
}


int main()
{
    const size_t ARRAY_SIZE = 0b100000000000000; //46945;
    const size_t ITERATIONS = ARRAY_SIZE; //986087543U; //1024;
    int *in = new int[ARRAY_SIZE];
    int *norm_out = new int[ARRAY_SIZE];
    int *hip_out = new int[ARRAY_SIZE];

    for (int i=0; i<ARRAY_SIZE; i++)
        in[i] = 0;

    std::cout << "Increment through an array:\nsize: " << ARRAY_SIZE 
              << "\niterations: " << ITERATIONS << std::endl;

    auto hip_start_time = std::chrono::high_resolution_clock::now();

    for (size_t i=0; i<ITERATIONS; i++)
      hip_increment(hip_out, in, ARRAY_SIZE);
    // std::cout << "DEBUG: finished hip" << std::endl;

    auto hip_end_time = std::chrono::high_resolution_clock::now();

    std::cout << "HIP time: " << ((hip_end_time - hip_start_time)/std::chrono::microseconds(1)) << " micro sec" << std::endl;


    auto norm_start_time = std::chrono::high_resolution_clock::now();

    for (size_t i=0; i<ITERATIONS; i++)
      norm_increment(norm_out, in, ARRAY_SIZE);

    
    // std::cout << "DEBUG: finished norm" << std::endl;

    auto norm_end_time = std::chrono::high_resolution_clock::now();

    std::cout << "NORM time: " << ((norm_end_time - norm_start_time)/std::chrono::microseconds(1)) << " micro sec" << std::endl;

    // std::cout << "DEBUG:\ni#  hip  NORM" << std::endl;
    // for (int i=0; i<ARRAY_SIZE; i++)
    //   std::cout << i << ":  " << hip_out[i] << "  " << norm_out[i] << std::endl;
    // std::cout << "DEBUG: reached end" << std::endl;

    delete[] in;
    delete[] norm_out;
    delete[] hip_out;
    return 0;
}