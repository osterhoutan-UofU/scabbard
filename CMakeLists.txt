cmake_minimum_required(VERSION 3.20)
project(scabbard VERSION 0.3.0)

include(GNUInstallDirs)
configure_file(${CMAKE_SOURCE_DIR}/config/version.h.config
                ${CMAKE_SOURCE_DIR}/lib/include/scabbard/version.h)

# tmp build with debug llvm-project on external drive
# set(ENV{LLVM_HOME} /mnt/d/repos/llvm-project/build)

# we need rocm and hip paths to be defined
if (DEFINED ENV{ROCM_PATH} OR DEFINED ENV{HIP_PATH})
    if (NOT DEFINED ENV{ROCM_PATH})
        set(ENV{ROCM_PATH} "$ENV{HIP_PATH}/..")
        # set(ENV{LLVM_HOME} $ENV{ROCM_PATH}/llvm)
    elseif (NOT DEFINED ENV{HIP_PATH} AND EXISTS )
        set(ENV{HIP_PATH} "$ENV{ROCM_PATH}/hip")
    endif()
elseif (EXISTS "/opt/rocm") # if both are not defined define them if possible
        set(ENV{ROCM_PATH} "/opt/rocm")
        set(ENV{HIP_PATH} "$ENV{ROCM_PATH}/hip")
        set(ENV{LLVM_HOME} $ENV{ROCM_PATH}/llvm)
else ()
    message(FATAL_ERROR "[ERROR] hip/rocm could not be found try defining $HIP_PATH and $ROCM_PATH\n")
endif()
list(APPEND CMAKE_PREFIX_PATH $ENV{HIP_PATH} $ENV{ROCM_PATH})
if (NOT DEFINED ENV{ROCM_DIR})
    set(ENV{ROCM_DIR} $ENV{ROCM_PATH}/lib/cmake)
endif()
if (NOT DEFINED ENV{HIP_DIR})
    set(ENV{HIP_DIR} $ENV{ROCM_DIR}/hip)
endif()

# we need LLVM_HOME in order to automatically set LLVM_DIR
if(NOT DEFINED ENV{LLVM_HOME})
    message(WARNING "$LLVM_HOME was not defined (looking for valid values)")
    # look for possibel values for llvm in the default locations (for linux)
    if (EXISTS "$ENV{ROCM_PATH}/llvm") # try to use the default rocm llvm install
        set(ENV{LLVM_HOME} "$ENV{ROCM_PATH}/llvm")
        message("[NOTE] $LLVM_HOME was set to `$ENV{ROCM_PATH}/llvm` for a version of amd-llvm\n")
    elseif(EXISTS "../../llvm-project/build") # for using a local debug build of llvm 
        set(ENV{LLVM_HOME} "../../llvm-project/build")
        message("[NOTE] $LLVM_HOME was set to `../../llvm-project/build` for a local debug build of llvm\n")
    else() # try using a normal llvm install
        # list instead of range to select prefered values (15 or 12) before other/future values
        foreach(I IN ITEMS 16 17 18 19 20 21 22 23 24 25 15 12 14 13 11 10) 
            if(EXISTS "/usr/lib/llvm-${I}")
                set(ENV{LLVM_HOME} "/usr/lib/llvm-${I}")
                message("[NOTE] $LLVM_HOME was set to `/usr/lib/llvm-${I}` for llvm v${I}\n") 
                if(i GREATER 16)
                    message(AUTHOR_WARNING "[WARNING] LLVM versions >16 are not officialy supported!")
                endif()
                break()
            endif()
        endforeach()
    endif()
    if(NOT DEFINED ENV{LLVM_HOME})
        message(FATAL_ERROR "[ERROR] $LLVM_HOME could not be found or infered (is LLVM installed?)")
    endif()
endif()
set(ENV{LLVM_DIR} $ENV{LLVM_HOME}/lib/cmake/llvm)

find_package(LLVM REQUIRED CONFIG)
add_definitions(${LLVM_DEFINITIONS_LIST})
include_directories(${LLVM_INCLUDE_DIRS})
link_directories(${LLVM_LIBRARY_DIRS})
if (${LLVM_VERSION_MAJOR} VERSION_GREATER_EQUAL 10)
    set(CMAKE_CXX_STANDARD 17)
    message("[NOTE] $LLVM_HOME version was greater than 10 => compiling with C++17\n")
else()
    set(CMAKE_CXX_STANDARD 11)
    message("[NOTE] $LLVM_HOME version was less than 10 => compiling with C++11\n")
endif()

set(CMAKE_C_COMPILER $ENV{ROCM_PATH}/llvm/bin/clang CACHE FILEPATH "set C compiler to amd-clang" FORCE)
set(CMAKE_CXX_COMPILER $ENV{ROCM_PATH}/llvm/bin/clang++ CACHE FILEPATH "set C++ compiler to amd-clang" FORCE)

set(CMAKE_INSTALL_LIBDIR ${ROCM_PATH}/scabbard)
set(CMAKE_INSTALL_BINDIR ${ROCM_PATH}/scababrd)
set(CMAKE_INSTALL_INCLUDEDIR ${ROCM_PATH}/scabbard/include)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/scabbard)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/scabbard)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/scabbard)
set(SCABBARD_PATH ${CMAKE_BINARY_DIR}/scabbard)

add_subdirectory(lib)
add_subdirectory(libtrace)
add_subdirectory(instr)
add_subdirectory(verif) # will need this latter
add_subdirectory(interception)
