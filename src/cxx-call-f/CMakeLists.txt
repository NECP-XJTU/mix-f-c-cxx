add_library(cxx-call-f-f ${CMAKE_CURRENT_SOURCE_DIR}/cxx-call-f.f90)
set_property(TARGET cxx-call-f-f PROPERTY LINKER_LANGUAGE Fortran)

add_executable(cxx-call-f-c ${CMAKE_CURRENT_SOURCE_DIR}/cxx-call-f.c)
target_link_libraries(cxx-call-f-c cxx-call-f-f)
set_property(TARGET cxx-call-f-c PROPERTY LINKER_LANGUAGE C)

add_executable(cxx-call-f-cxx ${CMAKE_CURRENT_SOURCE_DIR}/cxx-call-f.cpp)
target_link_libraries(cxx-call-f-cxx cxx-call-f-f)
