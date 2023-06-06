cmake_minimum_required(VERSION 3.16)
project(instrlib VERSION 0.1)

find_package(hip)

add_library(instrlib STATIC
    src/defs.cpp
    src/AsyncQueue.cpp
    src/TraceWriter.cpp
  )

set_property(TARGET instrlib PROPERTY HIP_STANDARD 17)

target_include_directories(instrlib
    PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
    PRIVATE
    src
    ./include
    ../lib/include
  )

target_link_libraries(instrlib
    PUBLIC
    hip::host 
    hip::device
    PRIVATE
    libscabbard
  )


install(TARGETS scabbard EXPORT libscabbardConfig
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  )
install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

# this is an llvm instr only lib, there are no include files
# install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

export(TARGETS instrlib FILE libinstrlibConfig.cmake)
