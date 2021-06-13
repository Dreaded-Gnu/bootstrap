#!/bin/bash
set -x
# save parameters
export SYSROOT=$1
export NEWLIB=$2
# create directory
mkdir -p $SYSROOT/usr/include
# copy include files
cp -RT $NEWLIB/newlib/libc/include $SYSROOT/usr/include
