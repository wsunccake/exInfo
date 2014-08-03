#include <stdio.h>  // puts, printf 
#include <unistd.h> // gethostid
#include <time.h>   // time_t, struct tm, time, localtime

void hostid_(long *id){
  *id = gethostid();

#ifdef DEBUGPRINT
  printf("hostid: %x\n", *id);
  printf("hostid: %d\n", *id);
#endif
}

int nowdate_(){
  time_t rawtime;
  struct tm * timeinfo;
  int mydate;

  time(&rawtime);
  timeinfo = localtime (&rawtime);
  mydate = (timeinfo->tm_year + 1900)*100 + (timeinfo->tm_mon + 1);
  mydate = mydate*100 + timeinfo->tm_mday;

#ifdef DEBUGPRINT
  printf("Current local time and date: %s", asctime(timeinfo));
  printf("year: %i\n", timeinfo->tm_year + 1900);
  printf("month: %i\n", timeinfo->tm_mon + 1);
  printf("day: %i\n", timeinfo->tm_mday);
  printf("date: %i\n", mydate);
#endif

  return mydate;
}
