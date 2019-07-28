! -*- coding: utf-8 -*-
!===============================================================================
!> @brief
!> @author Qingming He, NECP
!> @date 2019-07-27 10:58:54
!===============================================================================
program main

  use iso_c_binding

  implicit none

  interface
    subroutine print_array_1d_c(n, a) bind(C, name="print_array_1d_c")
      import C_INT, C_PTR
      integer(C_INT), value :: n
      type(C_PTR), value :: a
    end subroutine print_array_1d_c

    function new_TwoDArray(n0, n1) result(a) bind(C, name="new_TwoDArray")
      import C_INT, C_PTR
      integer(C_INT), value :: n0
      integer(C_INT), value :: n1
      type(C_PTR) :: a
    end function new_TwoDArray

    subroutine set_TwoDArray(a, i, b) bind(C, name="set_TwoDArray")
      import C_INT, C_PTR
      type(C_PTR), value :: a
      integer(C_INT), value :: i
      type(C_PTR), value :: b
    end subroutine set_TwoDArray

    subroutine print_TwoDArray(a) bind(C, name="print_TwoDArray")
      import C_PTR
      type(C_PTR), value :: a
    end subroutine print_TwoDArray
  end interface

  type(C_PTR) :: a
  integer, target :: b(2)

  a = new_TwoDArray(2, 2)
  b = [1, 2]
  call set_TwoDArray(a, 1, c_loc(b))
  b = [3, 4]
  call set_TwoDArray(a, 2, c_loc(b))
  call print_TwoDArray(a)

end program main
