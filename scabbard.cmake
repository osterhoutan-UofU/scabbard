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


set(ENV{SCABBARD_METADATA_FILE} ${CMAKE_BINARY_DIR}/${CMAKE_PROJECT_NAME}.scabbard.meta)
set(ENV{SABBARD_PATH} ${SCABBARD_PATH})


function(scabbard_instrument_targets)
    foreach(target in ${ARGN})
        if (ENABLE_SCABBARD)
            target_link_options(${target}
                -flto -fgpu-rdc 
                -Cl,--load-pass-plugin=${SCABBARD_PATH}/libinstr.so 
                -Xoffload-linker --load-pass-plugin=${SCABBARD_PATH}/libinstr.so 
                -L${SCABBARD_PATH} -ltrace -ltrace.device)
            target_compile_options(${target} -g -fgpu-rdc -flto) # debug info always required for scabbard
        endif()
    endforeach(TARGET in ARGN)
endfunction(scabbard_instrument_targets)

