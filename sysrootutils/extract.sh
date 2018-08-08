#!/bin/bash

[ "x$1" == "x" ] && PARM="*.deb" || PARM="$1*.deb"

for file in $(ls ${PARM});
do
	echo "Extracting $file..."
	ar x $file data.tar.xz && 
	tar xJf data.tar.xz -C ../sysroot &&
	rm data.tar.xz
	echo
done
