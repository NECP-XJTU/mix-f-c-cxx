add_library(f-call-c-c ${CMAKE_CURRENT_SOURCE_DIR}/f-call-c.c)

add_executable(f-call-c-f ${CMAKE_CURRENT_SOURCE_DIR}/f-call-c.f90)
target_link_libraries(f-call-c-f f-call-c-c)
set_property(TARGET f-call-c-f PROPERTY LINKER_LANGUAGE Fortran)
