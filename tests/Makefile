helloworld :	helloworld.c
		${CC} ${CFLAGS} helloworld.c -o helloworld

helloworld-static: helloworld.c
		${CC} ${CFLAGS} -static helloworld.c -o helloworld-static

all:		helloworld helloworld-static

clean :	
		rm helloworld helloworld-static
