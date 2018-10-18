#!/bin/bash

test -z "${SYSROOT:-}" && echo "SYSROOT not set" && exit 1

echo "SYSROOT: ${SYSROOT}"
echo

[ "x$1" == "x" ] && PARM="*.deb" || PARM="$1*.deb"

for file in $(find -name "${PARM}");
do
	echo -n "Extracting $file... "
	ar x $file data.tar.xz && 
	tar xJvf data.tar.xz -C ${SYSROOT} &&
	rm data.tar.xz
	echo "done."
done

echo

if [ -d ${SYSROOT}/usr/lib/arm-linux-gnueabihf ]
then
	for i in $(find -L ${SYSROOT}/usr/lib/arm-linux-gnueabihf -lname "/lib/arm-linux-gnueabihf*");
	do
	        echo -n "Relinking $i... "
	        sudo ln -f -s ../../..$(readlink $i) $i
		echo "done."
	done
fi
