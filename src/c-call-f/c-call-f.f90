! -*- coding: utf-8 -*-
!===============================================================================
!> @brief
!> @author Qingming He, NECP
!> @date 2019-07-27 11:31:11
!===============================================================================
module c_call_f

  use iso_c_binding

  implicit none

contains

  subroutine print_1d(a)
    integer :: a(:)
    integer :: i
    do i = 1, size(a)
      write(*, *) a(i)
    end do
  end subroutine print_1d

  subroutine print_2d(a)
    integer :: a(:, :)
    integer :: n0
    integer :: n1
    integer :: i
    integer :: j
    n0 = size(a, 1)
    n1 = size(a, 2)
    do j = 1, n1
      do i = 1, n0
        write(*, *) a(i, j)
      end do
    end do
  end subroutine print_2d

  subroutine print_1d_f(n, a) bind(C, name="print_1d_f")
    integer(C_INT), value :: n
    integer(C_INT) :: a(n)
    call print_1d(a)
  end subroutine print_1d_f

  subroutine print_2d_f_right1(n0, n1, a) bind(C, name="print_2d_f_right1")
    integer(C_INT), value :: n0
    integer(C_INT), value :: n1
    integer(C_INT) :: a(n0, n1)
    call print_2d(a)
  end subroutine print_2d_f_right1

  subroutine print_2d_f_right2(n0, n1, a) bind(C, name="print_2d_f_right2")
    integer(C_INT), value :: n0
    integer(C_INT), value :: n1
    integer(C_INT) :: a(n0, n1)

    call print_2d(a)

  end subroutine print_2d_f_right2

  subroutine print_2d_f_wrong(n0, n1, a) bind(C, name="print_2d_f_wrong")
    integer(C_INT), value :: n0
    integer(C_INT), value :: n1
    integer(C_INT) :: a(n0, n1)

    call print_2d(a)

  end subroutine print_2d_f_wrong

end module c_call_f
