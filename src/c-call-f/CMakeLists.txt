add_library(c-call-f-f ${CMAKE_CURRENT_SOURCE_DIR}/c-call-f.f90)
set_property(TARGET c-call-f-f PROPERTY LINKER_LANGUAGE Fortran)

add_executable(c-call-f-c ${CMAKE_CURRENT_SOURCE_DIR}/c-call-f.c)
target_link_libraries(c-call-f-c c-call-f-f)
set_property(TARGET c-call-f-c PROPERTY LINKER_LANGUAGE C)
