#!/bin/bash

test -z "${SYSROOT:-}" && echo "SYSROOT not set" && exit 1

echo "SYSROOT: ${SYSROOT}"
echo

for i in $(find -L ${SYSROOT}/usr/lib/arm-linux-gnueabihf -lname "/lib/arm-linux-gnueabihf*");
do
        echo -n "Relinking $i... "
        sudo ln -f -s ../../..$(readlink $i) $i
        echo "done."
done
