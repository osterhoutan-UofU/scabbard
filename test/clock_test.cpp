
#include <iostream>
#include <chrono>
#include <cstring>
// #include <scabbard/trace/calls.hpp>

#ifdef ENABLE_HIP_CPU
// #include <hip/hip_ext.h>
#include <hip/hip_runtime.h>
#include <hip/hip_runtime_api.h>
#else
#include <hip/hip_ext.h>
#include <hip/hip_runtime.h>
#include <hip/hip_runtime_api.h>
#endif

__host__
void __HIP_CHECK__(hipError_t resCode) {
  if (resCode != hipSuccess) {
    std::cerr << "\nHIP ERROR: " << resCode << std::endl; 
    exit(EXIT_FAILURE); 
  } 
}


__global__ void __d_increment(int* d_mem, int64_t* d_time) {
    auto Id = threadIdx;
    int tmp;
    if (Id.x == 0) {
      d_time[0] = clock();
      d_time[1] = clock64();
      d_time[2] = wall_clock64();
      tmp = 0;
    } else {
      tmp = d_mem[Id.x-1];
    }
    __syncthreads();
    tmp += 1;
    d_mem[Id.x] = tmp;
    if (Id.x == blockDim.x-1) {
      d_time[3] = clock();
      d_time[4] = clock64();
      d_time[5] = wall_clock64();
    }
}

struct ClockTimes {
  int64_t clock_time;
  int64_t clock64_time;
  int64_t wall_clock64_time;

  ClockTimes& operator += (const ClockTimes& other) {
    this->clock_time += other.clock_time;
    this->clock64_time += other.clock64_time;
    this->wall_clock64_time += other.wall_clock64_time;
    return *this;
  }
};


ClockTimes hip_increment(int* h_out, int* h_in, const size_t ARRAY_SIZE)
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
    int64_t* d_times;
    int64_t kts[6] = {0l, 0l, 0l, 0l, 0l, 0l}; 
    __HIP_CHECK__(hipMalloc((void**) &d_mem, ARRAY_BYTES));
    __HIP_CHECK__(hipMalloc((void**) &d_times, sizeof(int64_t)*6));

    __HIP_CHECK__(hipMemcpy(d_mem, h_in, ARRAY_BYTES, hipMemcpyHostToDevice));
    __HIP_CHECK__(hipMemcpy(d_times, kts, sizeof(int64_t)*6, hipMemcpyHostToDevice));
    
    hipLaunchKernelGGL(__d_increment,dim3(1),dim3(ARRAY_SIZE),0,0,d_mem, d_times);
    __HIP_CHECK__(hipDeviceSynchronize());

    __HIP_CHECK__(hipMemcpy(h_out, d_mem, ARRAY_BYTES, hipMemcpyDeviceToHost));
    __HIP_CHECK__(hipMemcpy(kts, d_times, sizeof(int64_t)*6, hipMemcpyDeviceToHost));
    __HIP_CHECK__(hipFree(d_mem));
    __HIP_CHECK__(hipFree(d_times));
    if (   kts[0]==0 && kts[1]==0
        && kts[2]==0 && kts[3]==0
        && kts[4]==0 && kts[5]==0 ) {
      std::cerr << "\n\nERROR: ALL kernel time functions returned 0!\n" << std::endl;
      exit(EXIT_FAILURE);
    } else {
      // std::cout << '{' << kts[0] << ", " << kts[1] << ", " 
      //                  << kts[2] << ", " << kts[3] << ", " 
      //                  << kts[4] << ", " << kts[5] << "}" << std::endl;
    }
    return ClockTimes{kts[3]-kts[0], kts[4]-kts[1], kts[5]-kts[2]};
}


void norm_increment(int* h_out, int* h_in, const size_t ARRAY_SIZE)
{
  for (size_t i=0; i<ARRAY_SIZE-1; i++)
    h_out[i+1] = h_in[i] + 1;
}


int main()
{
    const size_t ARRAY_SIZE = 1024ul; //4096;
    const size_t ITERATIONS = ARRAY_SIZE; //986087543U; //1024;
    int *in = new int[ARRAY_SIZE];
    int *norm_out = new int[ARRAY_SIZE];
    int *hip_out = new int[ARRAY_SIZE];
    ClockTimes kernel_time{0l,0l,0l};
    int deviceId = 0; // default device
    int wallClkRate = 0;
    __HIP_CHECK__(hipDeviceGetAttribute(&wallClkRate, hipDeviceAttributeWallClockRate, deviceId));
    std::cout << "\nHip `wall_clock64()` Rate: " << wallClkRate << "kHz\n" << std::endl;

    for (int i=0; i<ARRAY_SIZE; i++)
        in[i] = 0;

    std::cout << "Increment through an array:\nsize: " << ARRAY_SIZE 
              << "\niterations: " << ITERATIONS << std::endl;

    auto hip_start_time = std::chrono::high_resolution_clock::now();


    for (size_t i=0; i<ITERATIONS; i++)
      kernel_time += hip_increment(hip_out, in, ARRAY_SIZE);
    // std::cout << "DEBUG: finished hip" << std::endl;

    auto hip_end_time = std::chrono::high_resolution_clock::now();

    std::cout << "HIP time: " << ((hip_end_time - hip_start_time)/std::chrono::microseconds(1)) << " micro sec" << std::endl;
    std::cout << "HIP Kernel time (`clock()`): " << kernel_time.clock_time << " micro sec\n"
                 "HIP Kernel time (`clock64()`): " << kernel_time.clock64_time << " micro sec\n" 
                 "HIP Kernel time (`wall_clock64()`): " << kernel_time.wall_clock64_time << " micro sec\n" 
              << std::endl;


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
