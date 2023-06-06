cmake_minimum_required(VERSION 3.16)
project(libtrace VERSION 0.1)

find_package(hip)

add_library(trace STATIC
    src/defs.cpp
    src/AsyncQueue.cpp
    src/TraceWriter.cpp
  )

set_property(TARGET trace PROPERTY HIP_STANDARD 17)

target_include_directories(trace
    PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
    PRIVATE
    src
    ./include
    ../lib/include
  )

target_link_libraries(trace
    PUBLIC
    hip::host 
    hip::device
    PRIVATE
    libscabbard
  )


install(TARGETS trace EXPORT libtraceConfig
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  )
install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

# this is an llvm instr only lib, there are no include files
# install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

export(TARGETS trace FILE libtraceConfig.cmake)
