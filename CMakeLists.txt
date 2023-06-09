cmake_minimum_required(VERSION 3.16)
project(scabbard VERSION 0.1.0)

include(GNUInstallDirs)
configure_file(${CMAKE_SOURCE_DIR}/version.h.config
                ${CMAKE_SOURCE_DIR}/lib/include/scabbard/version.h)

# we need rocm and hip paths to be defined
if (DEFINED ENV{ROCM_PATH} OR DEFINED ENV{HIP_PATH})
    if (NOT DEFINED ENV{ROCM_PATH})
        set(ENV{ROCM_PATH} "$ENV{HIP_PATH}/..")
    elseif (NOT DEFINED ENV{HIP_PATH} AND EXISTS )
        set(ENV{HIP_PATH} "$ENV{ROCM_PATH}/hip")
    endif()
elseif (EXISTS "/opt/rocm") # if both are nto defined define them if possible
    set(ENV{ROCM_PATH} "/opt/rocm")
    set(ENV{HIP_PATH} "$ENV{ROCM_PATH}/hip")
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
    if(EXISTS "../../llvm-project") # for using a local debug build of llvm 
        set(ENV{LLVM_HOME} "../../llvm-project")
        message("[NOTE] $LLVM_HOME was set to `../llvm-project` for a local debug build of llvm\n")
    else()
        # define teh ROCM and HIP path variables
        if (EXISTS "$ENV{ROCM_PATH}/llvm") # try to use the default rocm llvm install
            set(ENV{LLVM_HOME} "$ENV{ROCM_PATH}/llvm")
            message("[NOTE] $LLVM_HOME was set to `$ENV{ROCM_PATH}/llvm` for a version of amd-llvm\n")
        else() # try using a normal llvm install
            # list instead of range to select prefered values (15 or 12) before other/future values
            foreach(I IN ITEMS 15 16 17 18 19 20 21 22 23 24 25 12 14 13 11 10) 
                if(EXISTS "/usr/lib/llvm-${I}")
                    set(ENV{LLVM_HOME} "/usr/lib/llvm-${I}")
                    message("[NOTE] $LLVM_HOME was set to `/usr/lib/llvm-${I}` for llvm v${I}\n") 
                    if(i GREATER 12)
                        message(AUTHOR_WARNING "[WARNING] LLVM versions >12 are not officialy supported!")
                    endif()
                    break()
                endif()
            endforeach()
        endif()
        if(NOT DEFINED ENV{LLVM_HOME})
            message(FATAL_ERROR "[ERROR] $LLVM_HOME could not be found or infered (is LLVM installed?)")
        endif()
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

set(CMAKE_C_COMPILER $ENV{ROCM_PATH}/llvm/bin/clang-15 CACHE FILEPATH "set C compiler to amd-clang" FORCE)
set(CMAKE_CXX_COMPILER $ENV{ROCM_PATH}/llvm/bin/clang-15 CACHE FILEPATH "set C++ compiler to amd-clang" FORCE)

set(CMAKE_INSTALL_LIBDIR ${ROCM_PATH}/lib/scabbard)
# set(CMAKE_INSTALL_BINDIR ${ROCM_PATH}/bin)
set(CMAKE_INSTALL_INCLUDEDIR ${ROCM_PATH}/include)

add_subdirectory(lib) # might neeed this might not
add_subdirectory(libtrace) # might neeed this might not
add_subdirectory(instr)
add_subdirectory(verif) # will need this latter
