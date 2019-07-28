! -*- coding: utf-8 -*-
!===============================================================================
!> @brief
!> @author Qingming He, NECP
!> @date 2019-07-25 11:35:36
!===============================================================================
program main

  use iso_c_binding

  implicit none

  interface
    subroutine print_array_1d(a, n) bind(C, name="print_array_1d")
      import C_INT, C_PTR
      type(C_PTR), value :: a
      integer(C_INT), value :: n
    end subroutine print_array_1d

    subroutine print_array_1d_1(n, a) bind(C, name="print_array_1d_1")
      import C_INT
      integer(C_INT), value :: n
      integer(C_INT) :: a(n)
    end subroutine print_array_1d_1

    subroutine print_array_2d(n0, n1, a) bind(C, name="print_array_2d")
      import C_INT, C_PTR
      integer(C_INT), value :: n0
      integer(C_INT), value :: n1
      integer(C_INT) :: a(n0, n1)
    end subroutine print_array_2d

    subroutine change_val(a, n, b) bind(C, name="change_val")
      import C_PTR, C_INT
      type(C_PTR), value :: a
      integer(C_INT), value :: n
      integer(C_INT) :: b
    end subroutine change_val

    subroutine get_3_chars_interface(str0, str1) bind(C, name="get_3_chars")
      import C_PTR
      type(C_PTR), value :: str0
      type(C_PTR), value :: str1
    end subroutine get_3_chars_interface
  end interface

  integer, target :: a(4)
  integer, target :: b
  integer, allocatable :: c(:, :)
  integer :: n
  character(len=10) :: str0
  character(len=3) :: str1

  n = 4
  a = [1, 2, 3, 4]
  b = 0
  allocate(c(2, 3))
  c(:, 1) = [0, 1]
  c(:, 2) = [2, 3]
  c(:, 3) = [4, 5]

  write(*, *) 'values of array a'
  ! integer, target :: a(4)
  ! integer :: n
  call print_array_1d(c_loc(a(1)), n)
  call print_array_1d_1(n, a)

  call change_val(c_loc(a), n, b)
  write(*, *) 'a=', a
  write(*, *) 'b=', b
  call change_val(c_loc(a), n, b)
  write(*, *) 'a=', a
  write(*, *) 'b=', b

  write(*, *) 'values of array c'
  ! integer, allocatable :: c(:, :)
  ! allocate(c(2, 3))
  call print_array_2d(3, 2, c)

  str0 = "1234567890"
  call get_3_chars(str0, str1)
  write(*, *) str1

contains

  subroutine get_3_chars(str0, str1)
    character(*) :: str0
    character(*) :: str1
    character, target :: str0_(len(str0)+1)
    character, target :: str1_(len(str1)+1)
    integer :: i

    do i = 1, len(str0)
      str0_(i) = str0(i:i)
    end do
    str0_(size(str0_)) = C_NULL_CHAR

    call get_3_chars_interface(c_loc(str0_), c_loc(str1_))

    do i = 1, len(str1)
      str1(i:i) = str1_(i)
    end do

  end subroutine get_3_chars

end program main
