#!/bin/bash
set -ex

export PREFIX_SUFFIX="os"
export TOOL_PREFIX_SUFFIX="os"

. $(dirname "$0")/_base.sh

sh "$BASEDIR/binutils.sh" "arm-bolthur" "/opt/bolthur/sysroot/arm"
#sh "$BASEDIR/binutils.sh" "aarch64-bolthur" "/opt/bolthur/sysroot/aarch64"

. $(dirname "$0")/_compiler.sh

# Download everything
sh "$BASEDIR/compiler/download.sh"

# Build dependencies
sh "$BASEDIR/compiler/dependency.sh"
sh "$BASEDIR/_base/automake.sh"
sh "$BASEDIR/_base/autoconf.sh"

# gcc
sh "$BASEDIR/compiler/gcc.sh" "arm-bolthur" "rmprofile,aprofile" "/opt/bolthur/sysroot/arm"
#sh "$BASEDIR/compiler/gcc.sh" "aarch64-bolthur" "ilp32,lp64" "/opt/bolthur/sysroot/aarch64"
