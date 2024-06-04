cmake_minimum_required(VERSION 3.16)
project(libtrace VERSION 0.1.0)

find_package(hip)

configure_file(${CMAKE_SOURCE_DIR}/config/sub-version.h.config
                ./src/version.h)

add_library(trace STATIC
    src/defs.cpp
    src/AsyncQueue.cpp
    src/TraceWriter.cpp
    # src/MetadataStore.cpp
  )

set_property(TARGET trace PROPERTY HIP_STANDARD 17)

target_include_directories(trace
    PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
    PRIVATE
    src
    ./include
    ../lib/include
  )

target_link_libraries(trace
    PUBLIC
    hip::host
    hip::device
    $<BUILD_INTERFACE:${SCABBARD_PATH}/libscabbard.so>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_LIBDIR}/libscabbard.so>
    # PRIVATE
    # libscabbard
  )


set(LIBTRACE_DEVICE_PATH_IR_TMP ${CMAKE_CURRENT_BINARY_DIR}/libtrace-device.ll.tmp)
set(LIBTRACE_DEVICE_PATH_IR ${SCABBARD_PATH}/libtrace-device.ll)

add_custom_target(trace-device
    ${ROCM_PATH}/bin/hipcc ${CMAKE_CXX_FLAGS} -x hip -std=c++17 -I../lib/include -I./include -S -emit-llvm -o ${LIBTRACE_DEVICE_PATH_IR_TMP} ./src/device-defs.cpp
    COMMAND awk '/\; __CLANG_OFFLOAD_BUNDLE____START__ host.+/{p=1} /\; __CLANG_OFFLOAD_BUNDLE____END__ host.+/{p=0\; next}!p' ${LIBTRACE_DEVICE_PATH_IR_TMP} > ${LIBTRACE_DEVICE_PATH_IR}
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    DEPENDS ./src/device-defs.cpp 
            ./include/scabbard/trace/globals.hpp 
            ./include/scabbard/trace/calls.hpp 
            ./include/scabbard/trace/AsyncQueue.hpp 
            ../lib/include/scabbard/TraceData.hpp 
            ../lib/include/scabbard/Enums.hpp
    SOURCES ./src/device-defs.cpp 
            ./include/scabbard/trace/globals.hpp 
            ./include/scabbard/trace/calls.hpp 
            ./include/scabbard/trace/AsyncQueue.hpp 
            ../lib/include/scabbard/TraceData.hpp 
            ../lib/include/scabbard/Enums.hpp
    BYPRODUCTS ${LIBTRACE_DEVICE_PATH_IR}
               ${LIBTRACE_DEVICE_PATH_IR_TMP}
  )
# add_library(trace-device STATIC
#     src/device-defs.cpp
#   )

# target_include_directories(trace-device
#     PUBLIC
#     $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
#     $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
#     PRIVATE
#     src
#     ./include
#     ../lib/include
#   )

# target_link_libraries(trace-device
#     PUBLIC
#     hip::device
#     # $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/lib/libscabbard.so>
#     # $<INSTALL_INTERFACE:${CMAKE_INSTALL_LIBDIR}/libscabbard.so>
#     # PRIVATE
#     # libscabbard
#   )


install(TARGETS trace EXPORT libtraceConfig
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  )
  

# this is an llvm instr only lib, there are no include files
# install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

export(TARGETS trace FILE libtraceConfig.cmake)
