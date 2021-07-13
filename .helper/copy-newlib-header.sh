#!/bin/bash
set -x
# save parameters
export SYSROOT=$1
export NEWLIB=$2
# create directory
mkdir -p $SYSROOT/include
# copy include files
if [[ "$OSTYPE" == "darwin"* ]]; then
  cp -R $NEWLIB/newlib/libc/include/ $SYSROOT/include
else
  cp -RT $NEWLIB/newlib/libc/include $SYSROOT/include
fi
