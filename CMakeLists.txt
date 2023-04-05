cmake_minimum_required(VERSION 3.16)
project(scabbard VERSION 0.1)

# set(CLANG_DIR "/usr/lib/llvm-10/lib/cmake/clang") # tmp way to get cmake to recognise the libclang-dev install
find_package(Clang REQUIRED)
find_package(LLVM REQUIRED CONFIG)

set(CMAKE_CXX_STANDARD 14)

set(CMAKE_CXX_COMPILER "${LLVM_TOOLS_BINARY_DIR}/clang++")
set(CMAKE_C_COMPILER "${LLVM_TOOLS_BINARY_DIR}/clang")

list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
# Use `add_llvm_...` functions.
include(AddLLVM)
# Set compiler flags.
include(HandleLLVMOptions)
# Use LLVM and clang headers.
include_directories(${LLVM_INCLUDE_DIRS} ${CLANG_INCLUDE_DIRS})

# add_clang_executable(scabbard src/scabbard.cpp)
add_library(scabbard
    src/scabbard.cpp
    src/Consumer.cpp
  )

target_link_libraries(scabbard
    PRIVATE
    clangAST
    clangBasic
    clangFrontend
    clangSerialization
    clangTooling
  )
