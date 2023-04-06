cmake_minimum_required(VERSION 3.16)
project(scabbard VERSION 0.1)

# we need LLVM_HOME in order to automatically set LLVM_DIR
if(NOT DEFINED ENV{LLVM_HOME})
    message(WARNING "$LLVM_HOME was not defined (looking for valid values)")
    # look for possibel values for llvm in the default locations (for linux)
    # list instead of range to select prefered values (12 or 10) before others and future values
    foreach(I IN ITEMS 12 10 11 13 14 15 16 17 18 19 20 21 22 23 24) 
        if(EXISTS "/usr/lib/llvm-${I}")
            set(ENV{LLVM_HOME} "/usr/lib/llvm-${I}")
            message("[NOTE] $LLVM_HOME was set to `/usr/lib/llvm-${I}` for llvm v${I}\n") 
            if(i GREATER 12)
                message(AUTHOR_WARNING "LLVM versions >12 are not officialy supported!")
            endif()
            break()
        endif()
    endforeach()
    if(NOT DEFINED ENV{LLVM_HOME})
        message(FATAL_ERROR "$LLVM_HOME could not be found or infered (is LLVM installed?)")
    else()

    endif()
endif()
set(ENV{LLVM_DIR} $ENV{LLVM_HOME}/lib/cmake/llvm)

find_package(LLVM REQUIRED CONFIG)
add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})
link_directories(${LLVM_LIBRARY_DIRS})
if (${LLVM_VERSION_MAJOR} VERSION_GREATER_EQUAL 10)
    set(CMAKE_CXX_STANDARD 14)
endif()

add_subdirectory(lib) # might neeed this might not
add_subdirectory(instr)
add_subdirectory(verif) # will need this latter
