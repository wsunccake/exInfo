#CC = gcc
#FC = gfotran
CC = icc
FC = ifort
#CDFLAGS = -DDEBUGPRINT
CDFLAGS =
FDFLAGS =

.SUFFIX : .F .c .o

#getInfo.o: getInfo.c
#	icc -c ${CDFLAGS} getInfo.c
.c.o:
	${CC} -c ${CDFLAGS} $<


#FPP: 
#	for FPP in `ls *.FPP`; do ${FC} -E ${FDFLAGS} $${FPP} > $${FPP%.*}.f90 ; done
#check_expire_date.o: check_expire_date.F
#	${FC} -E ${FDFLAGS} check_expire_date.F > check_expire_date.f90
#	${FC} -c check_expire_date.f90
#main.o: main.f90
#	${FC} -E ${FDFLAGS} main.F > main.f90
#	${FC} -c main.f90
%.o: %.F
	${FC} -E ${FDFLAGS} $< > `basename $< .F`.f90
	${FC} -c $<


all: main.o check_expire_date.o getInfo.o
	${FC} -o main.exe $?
#	ifort -o main.exe main.o check_expire_date.o getInfo.o


clean: 
	rm main.exe *.o *.f90
