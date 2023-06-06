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

#include <thread>
#include <cstdlib>
#include <iostream>


#ifdef __cpp_lib_filesystem
# include <filesystem>
#else
# include <experimental/filesystem>
  namespace std { namespace filesystem = experimental::filesystem;}
#endif
namespace { std::string __getExePath(); } //?namespace


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
      const std::string TRACE_FILE = ((_TRACE_FILE) 
                                      ? std::string(_TRACE_FILE) 
                                      : __getExePath());
      //TODO set up TraceWriter
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
      DEVICE_TRACE_LOGGER = (TRACE_LOGGER.deviceQ = tmp1);
      //TODO setup basics for scabbard trace
    }
    
    
    // << ======================================== Device ========================================== >> 
    namespace device {
      
      __device__
      void trace_append$mem(InstrData data, const void* PTR, const void* METADATA)
      {
        DEVICE_TRACE_LOGGER->append(TraceData(data,PTR,METADATA));
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
          } else if (attrs->device == 0) {
            data |= InstrData::HOST_HEAP;
          } else {
            data |= InstrData::DEVICE_HEAP;
          }
          trace_append$mem(data,PTR,METADATA);
        } else {
          //TODO handle the error
        }
      }
      
    } // namespace host
  
  
  } //?namespace trace
} //?namespace scabbard


#ifdef _WIN32
# include <windows.h>    //GetModuleFileNameW
#else
# include <limits.h>
# include <unistd.h>     //readlink
#endif

namespace { 
  std::string __GetExePath()
  {
#   ifdef _WIN32
      wchar_t path[MAX_PATH] = { 0 };
      GetModuleFileNameW(NULL, path, MAX_PATH);
      return path;
#   else
      char result[PATH_MAX];
      ssize_t count = readlink("/proc/self/exe", result, PATH_MAX);
      return std::string(result, (count > 0) ? count : 0);
    #endif
  }

} //?namespace
