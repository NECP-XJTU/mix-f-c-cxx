include_directories(${CMAKE_CURRENT_SOURCE_DIR})
add_library(f-call-cxx-cxx ${CMAKE_CURRENT_SOURCE_DIR}/f-call-cxx.cpp)

add_executable(f-call-cxx-c ${CMAKE_CURRENT_SOURCE_DIR}/f-call-cxx.c)
target_link_libraries(f-call-cxx-c f-call-cxx-cxx)
set_property(TARGET f-call-cxx-c PROPERTY LINKER_LANGUAGE C)

add_executable(f-call-cxx-f ${CMAKE_CURRENT_SOURCE_DIR}/f-call-cxx.f90)
target_link_libraries(f-call-cxx-f f-call-cxx-cxx)
set_property(TARGET f-call-cxx-f PROPERTY LINKER_LANGUAGE Fortran)
