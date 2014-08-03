! checkFlag:
!           0: now under expired date 
!           1: now over expired date
      subroutine expire_date(expireDate, checkFlag)
          implicit none
          integer :: expireDate, checkFlag
          integer :: myDate

          integer :: nowdate

          myDate = nowdate()

          if (expireDate > myDate) then
              write(*,*) "under expired date(", expireDate, ")"
              checkFlag = 0
          else
              write(*,*) "over expired date(", expireDate, ")"
              checkFlag = 1
!              write(*,*) "exit program"
!              stop
          endif
          return
      end subroutine expire_date

! checkFlag:
!           0: doesn't exist in hostids
!           1: exist in hostids
      subroutine check_hostid(hostids, n, checkFlag)
          implicit none
          integer :: n, checkFlag
          integer(8) :: hostids(n)

          integer :: tmpHostid, i
          call hostid(tmpHostid)
          checkFlag = 0

          do i = 1, n
              if (tmpHostid == hostids(i)) then
                  checkFlag = 1
              endif
          enddo
      end subroutine check_hostid

      program main
          implicit none
          integer, parameter :: n = 3
          integer(8) :: hostids(n), myHostid
          integer :: myDate, expireDate, checkFlag

          integer :: nowdate

          write(*,*) "Test Begin"
!          call check_expire_date(20140530)

! get hostid
          call hostid(myHostid) 
          write(*,*) "Hostid: ", myHostid

! check hostids
          hostids(1) = 1234567890
          hostids(2) = 1837925474
          hostids(3) = 9876543210
          call check_hostid(hostids, n, checkFlag)
          write(*,*) "check hostids flag :", checkFlag

! get now date
          myDate = nowdate()
          write(*,*) "Now date:", myDate

! check expire date
          expireDate = 20150101
          call expire_date(expireDate, checkFlag)
          write(*,*) "check expired date flag :", checkFlag

          write(*,*) "Test Finish"
      end
