cmake_minimum_required(VERSION 3.16)
project(instrlib VERSION 0.1)

find_package(hip)

add_library(instrlib MODULE
    src/defs.cpp
  )

set_property(TARGET instrlib PROPERTY HIP_STANDARD 17)

target_include_directories(instrlib
    PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
    PRIVATE
    src
    ./include
    ../lib/include
  )

target_link_libraries(instrlib 
    hip::host 
    hip::device
  )

# add lib scabbard
target_include_directories(instrlib
    PRIVATE
    src
    ${CMAKE_CURRENT_BINARY_DIR}/../lib/include
  )

install(TARGETS instrlib EXPORT libinstrlibConfig
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  )

# this is an llvm instr only lib, there are no include files
# install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

export(TARGETS instrlib FILE libinstrlibConfig.cmake)
