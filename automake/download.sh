#!/bin/bash
set -ex

# Create directory for source files
mkdir -p "$TARGET_COMPILE/source"
cd "$TARGET_COMPILE/source"

# automake
if [ ! -f automake-${PKG_AUTOMAKE}.tar.gz ]; then
  wget "https://ftp.gnu.org/gnu/automake/automake-${PKG_AUTOMAKE}.tar.gz"
  tar -xzf automake-${PKG_AUTOMAKE}.tar.gz
fi
