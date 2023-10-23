/**
 * @file calls.cpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief implementation of the scabbard/trace/calls.hpp 
 *        and the scabbard/trace/globals.hpp include files
 * @version alpha 0.0.1
 * @date 2023-05-30
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include <scabbard/trace/calls.hpp>
#include <scabbard/trace/globals.hpp>
#include <scabbard/trace/AsyncQueue.hpp>
#include <scabbard/trace/TraceWriter.hpp>
#include <scabbard/Metadata.hpp>

#include <hip/hip_ext.h>
#include <hip/hip_runtime_api.h>

#include <thread>
#include <cstdlib>
#include <chrono>
#include <iostream>



// for getting the name of the executing program
// #ifdef __cpp_lib_filesystem
// # include <filesystem>
//   // using filesystem = std::filesystem;
//   using namespace std::filesystem;
// #else
// # include <experimental/filesystem>
//   // namespace std { namespace filesystem = std::experimental::filesystem; } //?namespace std
//   // using filesystem = std::experimental::filesystem;
//   using namespace std::experimental::filesystem;
// #endif
// // namespace { std::filesystem::path __getExePath(); } //?namespace
// // namespace { filesystem::path __getExePath(); } //?namespace
// namespace { path __getExePath(); } //?namespace


namespace scabbard {
  namespace trace {


    // << ========================================================================================== >> 
    // <<                                          GLOBALS                                           >> 
    // << ========================================================================================== >> 

    AsyncQueue TRACE_LOGGER; // created in scabbard init
    // __device__ DeviceAsyncQueue* DEVICE_TRACE_LOGGER;




    // << ========================================================================================== >> 
    // <<                                           CALLS                                            >> 
    // << ========================================================================================== >> 

    __host__ 
    void scabbard_init()
    {
      // if (__hip_gpubin_handle == nullptr)
      //   __hip_gpubin_handle = __hipRegisterFatBinary(__hip_fatbin_wrapper);
      
      const auto _EXE_NAME = std::getenv("SCABBARD_INSTRUMENTED_EXE_NAME");
      const std::string EXE_NAME = ((_EXE_NAME)
                                    ? std::string(_EXE_NAME)
                                    : "unknown_exe");
      const auto _TRACE_FILE = std::getenv("SCABBARD_TRACE_FILE");
      const std::string TRACE_FILE = ((_TRACE_FILE) 
                                      ? std::string(_TRACE_FILE) 
                                      : "./" + EXE_NAME + ".scabbard.trace");
      TRACE_LOGGER.set_trace_writer(TRACE_FILE, EXE_NAME, 
                                    std::chrono::system_clock::now().time_since_epoch().count());
      hipError_t hipRes;
      DeviceAsyncQueue* tmp1;
      if ((hipRes = hipMalloc(&tmp1, sizeof(DeviceAsyncQueue))) != hipSuccess) {
        std::cerr << "\n[scabbard::trace::init::ERROR] could not allocate space for the device side async queue! [hipError_t: " << hipRes << "]\n" 
                  << std::endl;
        int device_count = 0;
        if (hipRes == hipErrorInvalidDevice) {
          if ((hipRes = hipGetDeviceCount(&device_count)) == hipSuccess)
            std::cerr << "\n[scabbard::trace::init::INFO] api reports " << device_count << " compatible devices on this system\n" 
                      << std::endl;
          else
            std::cerr << "\n[scabbard::trace::init::ERROR] could not get the number of compatible devices! [hipError_t: " << hipRes << "]\n" 
                      << std::endl;
        }
        exit(EXIT_FAILURE);
      }
      DeviceAsyncQueue tmp2;
      if (hipMemcpy(tmp1, &tmp2, sizeof(DeviceAsyncQueue), hipMemcpyHostToDevice)
            != hipSuccess) {
        std::cerr << "\n[scabbard::trace::init::ERROR] failed to copy the initial device side async queue to the device(s)! [hipError_t: " << hipRes << "]\n" 
                  << std::endl;
        exit(EXIT_FAILURE);
      }
      DEVICE_TRACE_LOGGER = tmp1;
      TRACE_LOGGER.set_device_queue(tmp1);
      //TODO setup basics for scabbard trace
      TRACE_LOGGER.start();
    }

    __host__ 
    void scabbard_close()
    {
      //TODO
    }


    __host__ 
    std::uint64_t metadata_register$src(const char* src_file) 
    {
      return TRACE_LOGGER.register_src(src_file);
    }
    
    
    // << ======================================== Device ========================================== >> 

    namespace device {
      //NOTE: moved to device-defs.cpp for crosswise compilation
      // __global__ 
      // void call_stub(int* data_stub)
      // {
      //   size_t i = threadIdx.x;
      //   data_stub[i*2] += data_stub[i*2+1]; 
      // }
    } //?namespace device


    // << ========================================= Host =========================================== >> 
    namespace host {

      __host__ 
      void trace_append$mem(InstrData data, const void* PTR, const std::uint64_t* src_id, std::uint32_t line, std::uint32_t col)
      {
        TRACE_LOGGER.append(TraceData(data, PTR, {*src_id, line,col}));
      }

      __host__ 
      void trace_append$mem$cond(InstrData data, const void* PTR, const std::uint64_t* src_id, std::uint32_t line, std::uint32_t col)
      {
        hipPointerAttribute_t* attrs;
        const auto status = hipPointerGetAttributes(attrs,PTR);
        if (status == hipSuccess) {
          if (attrs->isManaged) {
            data |= InstrData::MANAGED_MEM;
          } else if (attrs->devicePointer == nullptr) {
            data |= InstrData::HOST_HEAP;
          } else {
            data |= InstrData::DEVICE_HEAP;
          }
          trace_append$mem(data,PTR, src_id, line,col);
        } else {
          std::cerr << "\n[scabbard::trace::cond::ERROR] could not get the properties of a pointer with `hipPointerGetAttributes()`!\n"
                    << std::endl;
#         ifdef DEBUG
            exit(EXIT_FAILURE);
#         endif
        }
      }

      __host__ 
      void trace_append$alloc(InstrData data, const void* PTR, const std::uint64_t* src_id, std::uint32_t line, std::uint32_t col, std::size_t size)
      {
        TRACE_LOGGER.append(TraceData(data, PTR, LocationMetadata{*src_id, line,col}, size));
      }
      
    } // namespace host

  
  } //?namespace trace
} //?namespace scabbard


// // for getting the name of the executing program
// #ifdef _WIN32
// # include <windows.h>    //GetModuleFileNameW
// #else
// # include <limits.h>
// # include <unistd.h>     //readlink
// #endif

// // for getting the name of the executing program
// namespace { 
//   path __getExePath()
//   {
// #   ifdef _WIN32
//       wchar_t _path[MAX_PATH] = { 0 };
//       GetModuleFileNameW(NULL, _path, MAX_PATH);
//       return path(_path);
// #   else
//       char result[PATH_MAX];
//       ssize_t count = readlink("/proc/self/exe", result, PATH_MAX);
//       return path(std::string(result, (count > 0) ? count : 0));
//     #endif
//   }

// } //?namespace
