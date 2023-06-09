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

#include <hip/hip_ext.h>
#include <hip/hip_runtime_api.h>

#include <thread>
#include <cstdlib>
#include <chrono>
#include <iostream>



// for getting the name of the executing program
#ifdef __cpp_lib_filesystem
# include <filesystem>
  // using filesystem = std::filesystem;
  using namespace std::filesystem;
#else
# include <experimental/filesystem>
  // namespace std { namespace filesystem = std::experimental::filesystem; } //?namespace std
  // using filesystem = std::experimental::filesystem;
  using namespace std::experimental::filesystem;
#endif
// namespace { std::filesystem::path __getExePath(); } //?namespace
// namespace { filesystem::path __getExePath(); } //?namespace
namespace { path __getExePath(); } //?namespace


namespace scabbard {
  namespace trace {


    // << ========================================================================================== >> 
    // <<                                          GLOBALS                                           >> 
    // << ========================================================================================== >> 

    AsyncQueue TRACE_LOGGER; // created in scabbard init
    __device__ DeviceAsyncQueue* DEVICE_TRACE_LOGGER;




    // << ========================================================================================== >> 
    // <<                                           CALLS                                            >> 
    // << ========================================================================================== >> 

    __host__ 
    void __scabbard_init() 
    {
      const auto _TRACE_FILE = std::getenv("SCABBARD_TRACE_FILE");
      const path _EXE_PATH = __getExePath();
      const std::string TRACE_FILE = ((_TRACE_FILE) 
                                      ? std::string(_TRACE_FILE) 
                                      : "./" + _EXE_PATH.filename().string() + ".scabbard.trace");
      TRACE_LOGGER.set_trace_writer(TRACE_FILE, _EXE_PATH.string(), 
                                    std::chrono::system_clock::now().time_since_epoch().count());

      DeviceAsyncQueue* tmp1;
      if (hipMalloc(&tmp1, sizeof(DeviceAsyncQueue)) != hipSuccess) {
        std::cerr << "\n[scabbard::trace::init::ERROR] could not allocate space for the device side async queue!\n" 
                  << std::endl;
        exit(EXIT_FAILURE);
      }
      DeviceAsyncQueue tmp2;
      if (hipMemcpy(tmp1, &tmp2, sizeof(DeviceAsyncQueue), hipMemcpyHostToDevice)
            != hipSuccess) {
        std::cerr << "\n[scabbard::trace::init::ERROR] failed to copy the initial device side async queue to the device(s)!\n" 
                  << std::endl;
        exit(EXIT_FAILURE);
      }
      DEVICE_TRACE_LOGGER = tmp1;
      TRACE_LOGGER.set_device_queue(tmp1);
      //TODO setup basics for scabbard trace
      TRACE_LOGGER.start();
    }
    
    
    // << ======================================== Device ========================================== >> 
    namespace device {

      __device__ inline 
      size_t getLaneId() // const
      {
        return (size_t)(((blockDim.x*blockIdx.x) + (blockDim.y*blockIdx.y) + (blockDim.z*blockIdx.z)
                + threadIdx.x + threadIdx.y + threadIdx.z) % SCABBARD_DEVICE_CYCLE_BUFFER_LANE_COUNT);
      }
      
      __device__
      void trace_append$mem(InstrData data, const void* PTR, const void* METADATA)
      {
        const size_t lId = getLaneId();
        DEVICE_TRACE_LOGGER->data[lId].data[(++(DEVICE_TRACE_LOGGER->data[lId].next))  // atomic so increment should happen at same time as load/copy
                  % SCABBARD_DEVICE_CYCLE_BUFFER_LANE_LENGTH] = TraceData(data,
                                                                          blockIdx, threadIdx,
                                                                          PTR, METADATA, 
                                                                          clock64());
        // *DEVICE_TRACE_LOGGER += TraceData(data,
        //                                   blockIdx, threadIdx,
        //                                   PTR, METADATA, 
        //                                   clock64());
        // DEVICE_TRACE_LOGGER->append(TraceData(data,
        //                                       blockIdx, threadIdx,
        //                                       PTR, METADATA, 
        //                                       clock64()));
      }


    } //?namespace device


    // << ========================================= Host =========================================== >> 
    namespace host {

      __host__ 
      void trace_append$mem(InstrData data, const void* PTR, const void* METADATA)
      {
        TRACE_LOGGER.append(TraceData(data, PTR, METADATA));
      }

      __host__ 
      void trace_append$mem$cond(InstrData data, const void* PTR, const void* METADATA)
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
          trace_append$mem(data,PTR,METADATA);
        } else {
          std::cerr << "\n[scabbard::trace::cond::ERROR] could not get the properties of a pointer with `hipPointerGetAttributes()`!\n"
                    << std::endl;
#         ifdef DEBUG
            exit(EXIT_FAILURE);
#         endif
        }
      }
      
    } // namespace host


    
  
  
  } //?namespace trace
} //?namespace scabbard


// for getting the name of the executing program
#ifdef _WIN32
# include <windows.h>    //GetModuleFileNameW
#else
# include <limits.h>
# include <unistd.h>     //readlink
#endif

// for getting the name of the executing program
namespace { 
  path __getExePath()
  {
#   ifdef _WIN32
      wchar_t _path[MAX_PATH] = { 0 };
      GetModuleFileNameW(NULL, _path, MAX_PATH);
      return path(_path);
#   else
      char result[PATH_MAX];
      ssize_t count = readlink("/proc/self/exe", result, PATH_MAX);
      return path(std::string(result, (count > 0) ? count : 0));
    #endif
  }

} //?namespace
