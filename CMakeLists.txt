cmake_minimum_required(VERSION 2.8.10 FATAL_ERROR)

if(CMAKE_CURRENT_SOURCE_DIR STREQUAL CMAKE_CURRENT_BINARY_DIR)
  message(FATAL_ERROR ": In-source builds are not allowed!")
endif()

# Set project name
set(PROJECT_NAME mix-f-c-cxx)

# Enable languages
project(${PROJECT_NAME} Fortran C CXX)

# Enable testing
enable_testing()
include(CTest)

add_subdirectory(src)
