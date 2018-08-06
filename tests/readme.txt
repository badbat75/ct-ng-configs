Use the tests in this directory to validate the cross compile environment.

Use the following CFLAGS to test RaspberryPi executables:

CC=arm-rpi-linux-gnueabihf-gcc
CXX=arm-rpi-linux-gnueabihf-g++

RaspberryPi and Pi0:
	CFLAGS="-mcpu=arm1176jzf-s -mfloat-abi=hard -mfpu=vfp -mtune=arm1176jzf-s"

RaspberryPi2:
	CFLAGS="-mcpu=cortex-a7 -mfloat-abi=hard -mfpu=neon-vfpv4 -mtune=cortex-a7"

RaspberryPi3:
	CFLAGS="-mcpu=cortex-a53 -mfloat-abi=hard -mfpu=neon-fp-armv8 -mneon-for-64bits -mtune=cortex-a53"

To build run:

	make

To test in host environment with qemu:

	qemu-arm -L /opt/x-tools/arm-rpi-linux-gnueabihf/arm-rpi-linux-gnueabihf/sysroot helloworld
