! -*- coding: utf-8 -*-
!===============================================================================
!> @brief
!> @author Qingming He, NECP
!> @date 2019-07-27 15:59:06
!===============================================================================
module cxx_call_f

  use iso_c_binding

  implicit none


contains

  subroutine print_1d(n, a) bind(C, name="print_1d")
    integer(C_INT), value :: n
    integer(C_INT) :: a(n)
    integer :: i
    do i = 1, size(a)
      write(*, *) a(i)
    end do
  end subroutine print_1d

end module cxx_call_f
