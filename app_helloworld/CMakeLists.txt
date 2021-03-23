cmake_minimum_required(VERSION 3.14)

#**********************
# Setup XMOS toolchain
#**********************
set(CMAKE_C_COMPILER "xcc")
set(CMAKE_AR "xmosar")
set(CMAKE_C_COMPILER_AR "xmosar")

set(CMAKE_RANLIB "")
set(CMAKE_C_COMPILER_FORCED TRUE)
set(CMAKE_ASM_COMPILER_FORCED TRUE)

set(CMAKE_C_FLAGS "" CACHE STRING "C Compiler Base Flags" FORCE)
set(CMAKE_EXE_LINKER_FLAGS "" CACHE INTERNAL "" FORCE)

enable_language(C)

#**********************
# Disable in-source build.
#**********************
if("${CMAKE_SOURCE_DIR}" STREQUAL "${CMAKE_BINARY_DIR}")
    message(FATAL_ERROR "In-source build is not allowed! Please specify a build folder.\n\tex:cmake -B build")
endif()

#**********************
# Setup project
#**********************
include("${CMAKE_CURRENT_SOURCE_DIR}/dependencies.cmake")

project(helloworld VERSION 1.0.0)

#**********************
# install
#**********************
set(INSTALL_DIR "${PROJECT_SOURCE_DIR}/bin")

#**********************
# Build flags
#**********************
set(BUILD_FLAGS
  "-target=XCORE-AI-EXPLORER"
  "-mcmodel=large"
  "-report"
  "-march=xs3a"
  "-DDEBUG_PRINT_ENABLE=1"
  "-Os"
)

add_executable(helloworld)
target_compile_options(helloworld PRIVATE ${BUILD_FLAGS})
target_link_options(helloworld PRIVATE ${BUILD_FLAGS})
set_target_properties(helloworld PROPERTIES OUTPUT_NAME helloworld.xe)

target_sources(helloworld
  PRIVATE ${LIB_LOGGING_SOURCES}
  PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/main.c"
)

target_include_directories(helloworld
  PRIVATE ${LIB_LOGGING_INCLUDES}
  PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
)

install(TARGETS helloworld DESTINATION ${INSTALL_DIR})
