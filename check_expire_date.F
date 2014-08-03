      subroutine check_expire_date(expireDate)
          integer :: expireDate, myDate
          character(8)  :: date
          character(10) :: time
          character(5)  :: zone
          integer,dimension(8) :: values
          call date_and_time(date,time,zone,values)
!          print '(a,2x,a,2x,a)', date, time, zone
          read(date, '(i)') myDate
          if (expireDate > myDate) then
#ifdef DEBUGPRINT
              write(*,*) "now date"
#endif
              write(*,*) myDate
          else
#ifdef DEBUGPRINT
              write(*,*) "expireDate date"
#endif
              write(*,*) expireDate
              stop
!              exit
          endif
          return
      end

