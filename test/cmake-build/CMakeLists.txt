cmake_minimum_required(VERSION 3.10)

project(HIPExample LANGUAGES CXX HIP)
include($ENV{SCABBARD_PATH}/scabbard.cmake)
# Find HIP package
find_package(HIP REQUIRED)
# Set HIP compiler flags (optional)
set(CMAKE_HIP_FLAGS "${CMAKE_HIP_FLAGS} -std=c++14")

# Add executable

add_executable(HIPExample HIPExample.cpp)

# Link against HIP libraries
target_link_libraries(HIPExample PRIVATE hip::device)

#scabbard_instrument_all() # instrument all targets (skips custom targets)
scabbard_instrument_target(HIPExample)
