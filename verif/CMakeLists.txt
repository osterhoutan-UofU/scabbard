cmake_minimum_required(VERSION 3.16)
project(scabbard-verif VERSION 0.1)

add_executable(verif
    src/main.cpp
    src/StateMachine.cpp
    src/TraceReader.cpp
  )

target_include_directories(verif
    PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
    PRIVATE
    src
    ./include
    ../lib/include
  )

target_link_libraries(verif
  PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/../lib/libscabbard.so>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_LIBDIR}/libscabbard.so>
)
