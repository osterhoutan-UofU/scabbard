#[[**
   * @file scabbard.cmake
   * @author Andrew Osterhout
   * @brief this cmake file provides a simple interface to allow for easy instrumentation
   *         of cmake builds with the scabbard build system.
   *
   * @date 2023-03-28
   *
   * @copyright Copyright (c) 2023
   *
   *]]



function(scabbard_set_scabbard_path)
    if(EXISTS ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/build/scabbard)    # scabbard built localy this file AND this file loaded from outside build dir
        return(PROPAGATE SCABBARD_PATH ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/build/scabbard) 
    elseif(EXISTS ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/libinstr.so)   # scabbard installed into rocm AND/OR thsi file included from build dir
        return(PROPAGATE SCABBARD_PATH ${CMAKE_CURRENT_FUNCTION_LIST_DIR})
    endif()
endfunction()

# set(ENV{SCABBARD_METADATA_FILE} ${CMAKE_BINARY_DIR}/${CMAKE_PROJECT_NAME}.scabbard.meta)
if(NOT DEFINED SCABBARD_PATH)
    scabbard_set_scabbard_path()
endif()
set(ENV{SABBARD_PATH} ${SCABBARD_PATH})

option(ENABLE_SCABBARD "instrument specified targets with scabbard" On)

function(scabbard_instrument_target target)
    if(ENABLE_SCABBARD)
        get_target_property(target_type ${target} TYPE)
        if(target_type MATCHES "MODULE_LIBRARY|SHARED_LIBRARY|EXECUTABLE")
            target_link_options(${target}
                -flto -fgpu-rdc 
                -Wl,--load-pass-plugin=${SCABBARD_PATH}/libinstr.so 
                -Xoffload-linker --load-pass-plugin=${SCABBARD_PATH}/libinstr.so 
                -L${SCABBARD_PATH} -ltrace -ltrace.device -lpthread)
            target_compile_options(${target} -g -fgpu-rdc -flto) # debug info always required for scabbard
            add_dependencies(${target} instr)  #ensure that instrumentation gets built before a target that needs instrumenting
        elseif(target_type STREQUAL "STATIC_LIBRARY")
            target_compile_options(${target} -g -fgpu-rdc -flto) # debug info always required for scabbard
        elseif(NOT DEFINED SCABBARD_SUPPRESS_TYPE_WARN)
            message(NOTICE "[scabbard:NOTE] \`${target}\` is not a target of a supported type for the scabbard cmake module.\n"
                           "[scabbard:NOTE]  If this target is a custom target meant to build a hip/c/c++ object try adding the\n"
                           "[scabbard:NOTE]  following flags to the build command to manually add the scabbard instrumentation passes:\n"
                           "[scabbard:NOTE]    -g -flto -fgpu-rdc -Wl,--load-pass-plugin=\${SCABBARD_PATH}/libinstr.so -Xoffload-linker --load-pass-plugin=\${SCABBARD_PATH}/libinstr.so -L\${SCABBARD_PATH} -ltrace -ltrace.device -lpthread")
        endif()
    endif()
endfunction()

function(scabbard_instrument_targets)
    if(ENABLE_SCABBARD)
        foreach(target in ${ARGN})
            scabbard_instrument_target(${target})
        endforeach()
    endif()
endfunction()

macro(scabbard_instrument_all)
    set(SCABBARD_SUPPRESS_TYPE_WARN)
    scabbard_instrument_targets(${BUILDSYSTEM_TARGETS})
    unset(SCABBARD_SUPPRESS_TYPE_WARN)
endmacro()

