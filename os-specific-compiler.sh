#!/bin/bash
set -ex

export PREFIX_SUFFIX="os"
export TOOL_PREFIX_SUFFIX="os"

. $(dirname "$0")/_base.sh

sh "$BASEDIR/binutils.sh" "arm-bolthur-eabi" "/opt/bolthur/sysroot/arm"
#sh "$BASEDIR/binutils.sh" "aarch64-bolthur-elf" "/opt/bolthur/sysroot/aarch64"

. $(dirname "$0")/_compiler.sh

# Download everything
sh "$BASEDIR/compiler/download.sh"

# automake autoconf for gcc
sh "$BASEDIR/_base/automake.sh"
sh "$BASEDIR/_base/autoconf.sh"

# gcc
sh "$BASEDIR/compiler/gcc.sh" "arm-bolthur-eabi" "rmprofile,aprofile" "/opt/bolthur/sysroot/arm"
#sh "$BASEDIR/compiler/gcc.sh" "aarch64-bolthur-elf" "ilp32,lp64" "/opt/bolthur/sysroot/aarch64"
