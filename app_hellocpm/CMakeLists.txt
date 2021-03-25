cmake_minimum_required(VERSION 3.14)

#**********************
# Setup XMOS toolchain
#**********************
include("${CMAKE_CURRENT_SOURCE_DIR}/../cmake/xmos_toolchain.cmake")

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

project(hellocpm VERSION 1.0.0)

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

add_executable(hellocpm)
target_compile_options(hellocpm PRIVATE ${BUILD_FLAGS})
target_link_options(hellocpm PRIVATE ${BUILD_FLAGS})
set_target_properties(hellocpm PROPERTIES OUTPUT_NAME hellocpm.xe)

target_sources(hellocpm
  PRIVATE ${LIB_LOGGING_SOURCES}
  PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/main.c"
)

target_include_directories(hellocpm
  PRIVATE ${LIB_LOGGING_INCLUDES}
  PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
)

install(TARGETS hellocpm DESTINATION ${INSTALL_DIR})
