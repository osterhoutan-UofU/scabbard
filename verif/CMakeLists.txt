cmake_minimum_required(VERSION 3.16)
project(scabbard-verif VERSION 0.1)

add_executable(verif
    src/main.cpp
  )

target_include_directories(verif
    PRIVATE
    src
    ${CMAKE_CURRENT_BINARY_DIR}/../lib
  )
