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

include_guard(GLOBAL)



    
# set(ENV{SCABBARD_METADATA_FILE} ${CMAKE_BINARY_DIR}/${CMAKE_PROJECT_NAME}.scabbard.meta)
if(NOT DEFINED SCABBARD_PATH)
    if(DEFINED ENV{SCABBARD_PATH})
        set(SCABBARD_PATH $ENV{SCABBARD_PATH})
    else()
        set(SCABBARD_PATH @SCABBARD_PATH@)
    endif()
    message(NOTICE "[scabbard:DBG] SCABBARD_PATH: '${SCABBARD_PATH}'")
endif()
# set(ENV{SABBARD_PATH} ${SCABBARD_PATH})

option(ENABLE_SCABBARD "instrument specified targets with scabbard" On)
option(SCABBARD_USE_COMPRESSION "was compression enabled in your scabbard build?" @SCABBARD_USE_COMPRESSION@)

if(SCABBARD_USE_COMPRESSION)
set(SCABBARD_ZLIB_LIBRARIES @SCABBARD_ZLIB_LIBRARIES@)
set(SCABBARD_LINK_ZLIB @SCABBARD_LINK_ZLIB@)
else()
set(SCABBARD_ZLIB_LIBRARIES "")
set(SCABBARD_LINK_ZLIB "")
endif()


function(scabbard_instrument_target target)
    # set(test_var "test_var")
    # message("[scabbard:DBG] test_var='${test_var}' and target='${target}' and ARGV0='${ARGV0}' and ARGC='${ARGC}' and ARGN='${ARGN}'")
    if(ENABLE_SCABBARD)
        get_target_property(target_type ${target} TYPE)
        # message(NOTICE "[scabbard:DBG] target_type='${target_type}'")
        if(target_type MATCHES "MODULE_LIBRARY|SHARED_LIBRARY|EXECUTABLE")
            message(NOTICE "[scabbard:NOTE] instrumenting '${target_type}': '${target}'")
            target_link_options(${target}
                PUBLIC
                -flto -fgpu-rdc 
                ${SCABBARD_ZLIB_LIBRARIES} ${SCABBARD_LINK_ZLIB}
                -Wl,--load-pass-plugin=${SCABBARD_PATH}/libinstr.so 
                -Xoffload-linker --load-pass-plugin=${SCABBARD_PATH}/libinstr.so 
                -L${SCABBARD_PATH} -ltrace -ltrace.device -lpthread)
            target_compile_options(${target} PUBLIC -g -fgpu-rdc -flto -foffload-lto) # debug info always required for scabbard
            # target_link_libraries(${target} PRIVATE instr)  #ensure that instrumentation gets built before a target that needs instrumenting
        elseif(target_type MATCHES "STATIC_LIBRARY|OBJECT_LIBRARY")
            message(NOTICE "[scabbard:NOTE] enabling GPU-RDC and LTO for '${target_type}' lib: '${target}'")
            target_compile_options(${target} PUBLIC -g -fgpu-rdc -flto -foffload-lto) # debug info always required for scabbard
            target_link_options(${target} PUBLIC -g -fgpu-rdc -flto -foffload-lto) # debug info always required for scabbard
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
        _scabbard_get_all_targets(${_result} "${_subdir}")
    endforeach()
    get_directory_property(_sub_targets DIRECTORY "${_dir}" BUILDSYSTEM_TARGETS)
    set(${_result} ${${_result}} ${_sub_targets} PARENT_SCOPE)
endfunction()

macro(scabbard_instrument_all)
    set(SCABBARD_SUPPRESS_TYPE_WARN On)
    set(_targets "")
    _scabbard_get_all_targets(_scabbard_targets ${CMAKE_CURRENT_SOURCE_DIR})
    scabbard_instrument_targets(${_scabbard_targets})
    unset(SCABBARD_SUPPRESS_TYPE_WARN)
    unset(_scabbard_targets)
endmacro()

