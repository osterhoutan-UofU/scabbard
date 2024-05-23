cmake_minimum_required(VERSION 3.16)
project(scabbard-intercept VERSION 0.1)

set(__HIPCC_WRAPPER__ ${CMAKE_CURRENT_BINARY_DIR}/driver.py)
set(__CLANG_WRAPPER__ ${CMAKE_CURRENT_BINARY_DIR}/driver.py)
set(__CLANGPP_WRAPPER__ ${CMAKE_CURRENT_BINARY_DIR}/driver.py)
set(__GCC_WRAPPER__ ${CMAKE_CURRENT_BINARY_DIR}/driver.py)
set(__GPP_WRAPPER__ ${CMAKE_CURRENT_BINARY_DIR}/driver.py)

set(WRAPPER_PATHS "-D__HIPCC_WRAPPER__=${__HIPCC_WRAPPER__} -D__CLANG_WRAPPER__=${__CLANG_WRAPPER__} -D__CLANGPP_WRAPPER__=${__CLANGPP_WRAPPER__}")

add_custom_target(intercept
    cc ${WRAPPER_PATHS} -std=c99 -o ${CMAKE_CURRENT_BINARY_DIR}/intercept.so -shared ${CMAKE_CURRENT_SOURCE_DIR}/intercept.c -Wall -fPIC -g -ldl
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/intercept.c
    SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/intercept.c
    BYPRODUCTS ${CMAKE_CURRENT_BINARY_DIR}/intercept.so
  )

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/scabbard.py ${CMAKE_CURRENT_BINARY_DIR}/scabbard.py COPYONLY)
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/scabbard ${CMAKE_CURRENT_BINARY_DIR}/scabbard COPYONLY)
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/colors.py ${CMAKE_CURRENT_BINARY_DIR}/colors.py COPYONLY)
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/driver.py ${CMAKE_CURRENT_BINARY_DIR}/driver.py COPYONLY)


