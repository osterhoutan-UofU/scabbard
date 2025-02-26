cmake_minimum_required(VERSION 3.10)

project(HIPExample LANGUAGES CXX HIP)
# include($ENV{SCABBARD_PATH}/scabbard.cmake)
##[[

    function(scabbard_set_scabbard_path)
        if(DEFINED $ENV{SCABBARD_PATH})
            set(SCABBARD_PATH $ENV{SCABBARD_PATH})
            return(PROPAGATE SCABBARD_PATH $ENV{SCABBARD_PATH})
        elseif(EXISTS ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/build/scabbard)    # scabbard built localy this file AND this file loaded from outside build dir
            set(SCABBARD_PATH ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/build/scabbard)    
            return(PROPAGATE SCABBARD_PATH ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/build/scabbard) 
        elseif(EXISTS ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/libinstr.so)   # scabbard installed into rocm AND/OR thsi file included from build dir
            set(SCABBARD_PATH ${CMAKE_CURRENT_FUNCTION_LIST_DIR})
            return(PROPAGATE SCABBARD_PATH ${CMAKE_CURRENT_FUNCTION_LIST_DIR})
        endif()
    endfunction()
    
    # set(ENV{SCABBARD_METADATA_FILE} ${CMAKE_BINARY_DIR}/${CMAKE_PROJECT_NAME}.scabbard.meta)
    if(NOT DEFINED SCABBARD_PATH)
        if(DEFINED ENV{SCABBARD_PATH})
            set(SCABBARD_PATH $ENV{SCABBARD_PATH})
        else()
            scabbard_set_scabbard_path()
        endif()
        message(NOTICE "[scabbard:DBG] SCABBARD_PATH: '${SCABBARD_PATH}'")
    endif()
    # set(ENV{SABBARD_PATH} ${SCABBARD_PATH})
    
    option(ENABLE_SCABBARD "instrument specified targets with scabbard" On)
    
    function(scabbard_instrument_target target)
        #    set(test_var "test_var")
        #    message("[scabbard:DBG] test_var='${test_var}' and target='${target}' and ARGV0='${ARGV0}' and ARGC='${ARGC}' and ARGN='${ARGN}'")
        if(ENABLE_SCABBARD)
            get_target_property(target_type ${target} TYPE)
            #    message(NOTICE "[scabbard:DBG] target_type='${target_type}'")
            if(target_type MATCHES "MODULE_LIBRARY|SHARED_LIBRARY|EXECUTABLE")
                message(NOTICE "[scabbard:NOTE] instrumenting: '${target}' ${SCABBARD_PATH}")
                target_link_options(${target}
                    PUBLIC
                    -flto -fgpu-rdc 
                    -Wl,--load-pass-plugin=${SCABBARD_PATH}/libinstr.so 
                    -Xoffload-linker --load-pass-plugin=${SCABBARD_PATH}/libinstr.so 
                    -L${SCABBARD_PATH} -ltrace -ltrace.device -lpthread)
                target_compile_options(${target} PUBLIC -g -fgpu-rdc -flto) # debug info always required for scabbard
                target_link_libraries(${target} PRIVATE instr)  #ensure that instrumentation gets built before a target that needs instrumenting
            elseif(target_type STREQUAL "STATIC_LIBRARY")
                target_compile_options(${target} -g -fgpu-rdc -flto) # debug info always required for scabbard
            elseif(NOT DEFINED SCABBARD_SUPPRESS_TYPE_WARN)
                message(NOTICE "[scabbard:NOTE] '${target}' is not a target of a supported type for the scabbard cmake module.\n"
                                "[scabbard:NOTE]  If this target is a custom target meant to build a hip/c/c++ object try adding the\n"
                                "[scabbard:NOTE]  following flags to the build command to manually add the scabbard instrumentation passes:\n"
                                "[scabbard:NOTE]    -g -flto -fgpu-rdc -Wl,--load-pass-plugin=\${SCABBARD_PATH}/libinstr.so -Xoffload-linker --load-pass-plugin=\${SCABBARD_PATH}/libinstr.so -L\${SCABBARD_PATH} -ltrace -ltrace.device -lpthread")
            endif()
        endif()
    endfunction()
    
    function(scabbard_instrument_targets)
        if(ENABLE_SCABBARD)
            foreach(scabbard_target IN LISTS ARGN)
                scabbard_instrument_target(${scabbard_target})
            endforeach()
        endif()
    endfunction()
    
    # Collect all currently added targets in all subdirectories
    #
    # Parameters:
    # - _result the list containing all found targets
    # - _dir root directory to start looking from
    function(_scabbard_get_all_targets _result _dir)
        get_property(_subdirs DIRECTORY "${_dir}" PROPERTY SUBDIRECTORIES)
        foreach(_subdir IN LISTS _subdirs)
            get_all_targets(${_result} "${_subdir}")
        endforeach()
        get_directory_property(_sub_targets DIRECTORY "${_dir}" BUILDSYSTEM_TARGETS)
        set(${_result} ${${_result}} ${_sub_targets} PARENT_SCOPE)
    endfunction()
    
    macro(scabbard_instrument_all)
        set(SCABBARD_SUPPRESS_TYPE_WARN On)
        set(_targets "")
        _scabbard_get_all_targets(_targets ${CMAKE_CURRENT_SOURCE_DIR})
        #    message(NOTICE "[scabbard:DBG] _targets='${_targets}'")
        scabbard_instrument_targets(${_targets})
        unset(SCABBARD_SUPPRESS_TYPE_WARN)
    endmacro()
   
   
#]]
# Find HIP package
find_package(HIP REQUIRED)
# Set HIP compiler flags (optional)
set(CMAKE_HIP_FLAGS "${CMAKE_HIP_FLAGS} -std=c++14")
set(CMAKE_CXX_COMPILER "$ENV{ROCM_PATH}/bin/amdclang")

# Add executable

add_executable(HIPExample HIPExample.cpp)
set_property(TARGET HIPExample PROPERTY LANGUAGE HIP)

# Link against HIP libraries
target_link_libraries(HIPExample PRIVATE hip::device)

# get_target_property(_target_type_test HIPExample TYPE)
# message(NOTICE "[scabbard:DBG] HIPExample.TYPE='${_target_type_test}'")

# _scabbard_get_all_targets(_targets_test ${CMAKE_CURRENT_SOURCE_DIR})
# message(NOTICE "[scabbard:DBG] _targets_test='${_targets_test}'")

scabbard_instrument_all() # instrument all targets (skips custom targets)
