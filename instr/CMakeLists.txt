cmake_minimum_required(VERSION 3.16)
project(instr VERSION 0.1)

include(GNUInstallDirs)


add_library(instr MODULE
    src/ScabbardPass.cpp
    src/DepTrace.cpp
    src/DepTrace_HOST.cpp
    src/DepTrace_DEVICE.cpp
    src/registry.cpp
  )

# add lib instr
target_include_directories(instr
    PRIVATE
    src
    ${CMAKE_CURRENT_BINARY_DIR}/../lib
  )

target_compile_features(instr PRIVATE cxx_range_for cxx_auto_type)

# LLVM is (typically) built with no C++ RTTI. We need to match that;
# otherwise, we'll get linker errors about missing RTTI data.
set_target_properties(instr PROPERTIES
    COMPILE_FLAGS "-fno-rtti"
  )

# Get proper shared-library behavior (where symbols are not necessarily
# resolved when the shared library is linked) on OS X.
if(APPLE)
    set_target_properties(instr PROPERTIES
        LINK_FLAGS "-undefined dynamic_lookup"
      )
endif(APPLE)
