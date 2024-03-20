
#include <iostream>
#include <chrono>
#include <cstring>
// #include <scabbard/trace/calls.hpp>
#include "scabbard/trace/calls.hpp"
#include "device-defs.cpp"

#ifdef ENABLE_HIP_CPU
// #include <hip/hip_ext.h>
#include <hip/hip_runtime.h>
#include <hip/hip_runtime_api.h>
#else
#include <hip/hip_ext.h>
#include <hip/hip_runtime.h>
#include <hip/hip_runtime_api.h>
#endif

__managed__ uint64_t device_src_id = 0ul;
uint64_t host_src_id = 0ul;
__host__ const char* src_file_path = "test/maybe-race-test.man.cpp";

void scabbard_ctor();

__global__ void __d_increment(int* d_mem, void* dt) {
    auto Id = threadIdx;
    int tmp;
    if (Id.x == 0) {
      tmp = 0;
    } else {
      tmp = d_mem[Id.x-1];
    }
    __syncthreads();
    tmp += 1;
    scabbard::trace::device::trace_append$mem(dt,
          (scabbard::InstrData)(scabbard::InstrData::WRITE | scabbard::InstrData::ON_DEVICE | scabbard::InstrData::DEVICE_HEAP),
          &(d_mem[Id.x]),
          &device_src_id, 39u, 5u);
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
    scabbard::trace::host::trace_append$alloc(
        (scabbard::InstrData)(scabbard::InstrData::ALLOCATE | scabbard::InstrData::ON_HOST | scabbard::InstrData::DEVICE_HEAP | scabbard::InstrData::_OPT_USED),
        d_mem,
        &host_src_id, 62u, 5u,
        ARRAY_BYTES
      );

    hipMemcpy(d_mem, h_in, ARRAY_BYTES, hipMemcpyHostToDevice);
    scabbard::trace::host::trace_append$mem(
        (scabbard::InstrData)(scabbard::InstrData::SYNC_EVENT | scabbard::InstrData::ON_HOST),
        nullptr,
        &host_src_id, 69u, 5u
      );
    
    auto dt = scabbard::trace::register_job(0);
    hipLaunchKernelGGL(__d_increment,dim3(1),dim3(ARRAY_SIZE),0,0, d_mem, dt);
    scabbard::trace::register_job_callback(dt, 0); 

    hipMemcpyAsync(h_out, d_mem, ARRAY_BYTES, hipMemcpyDeviceToHost);
    scabbard::trace::host::trace_append$alloc(
        (scabbard::InstrData)(scabbard::InstrData::READ | scabbard::InstrData::ON_HOST | scabbard::InstrData::DEVICE_HEAP | scabbard::InstrData::_OPT_USED),
        d_mem,
        &host_src_id, 80u, 5u, 
        ARRAY_BYTES
      );

    hipFree(d_mem);
    scabbard::trace::host::trace_append$mem(
        (scabbard::InstrData)(scabbard::InstrData::FREE | scabbard::InstrData::ON_HOST | scabbard::InstrData::DEVICE_HEAP),
        d_mem,
        &host_src_id, 88u, 5u
      );
}


void norm_increment(int* h_out, int* h_in, const size_t ARRAY_SIZE)
{
  for (size_t i=0; i<ARRAY_SIZE-1; i++)
    h_out[i+1] = h_in[i] + 1;
}


int main()
{
    scabbard_ctor();
    scabbard::trace::scabbard_init();
    const size_t ARRAY_SIZE = 1024ul; //4096;
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

void scabbard_ctor()
{
  device_src_id = host_src_id = scabbard::trace::metadata_register$src(src_file_path);
}
