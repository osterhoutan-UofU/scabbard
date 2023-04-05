cmake_minimum_required(VERSION 3.16)
project(libscabbard VERSION 0.1)

add_library(libscabbard MODULE
    src/tmp.cpp
  )

target_include_directories(libscabbard
    PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
    PRIVATE
    src
  )
install(TARGETS libscabbard EXPORT libscabbardConfig
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
  )
install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

export(TARGETS libscabbard FILE libscabbardConfig.cmake)