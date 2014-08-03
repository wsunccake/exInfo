      program main
          integer i, j
          write(*,*) "Begin"
!          call check_expire_date(20140530)
          call hostid(i) 
          write(*,*) "Hostid: ", i
!          write(*,*) i
          j = nowdate()
          write(*,*) "Now date:", j
          write(*,*) "Finish"
      end
