#!/bin/bash
cd ../sysroot/usr/lib/arm-linux-gnueabihf
for i in $(find -L . -lname "/lib/arm-linux-gnueabihf*");
do
	echo "ln -f -s ../../..$(readlink $i) $i"
	sudo ln -f -s ../../..$(readlink $i) $i
done
cd -
