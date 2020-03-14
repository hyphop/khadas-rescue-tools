#!/bin/sh

## hyphop ##

#= make simg2img

D=$(dirname $0)

. $D/make_

VER=1.45.5
NAME=e2fsprogs
PKG=$NAME-$VER.tar.gz
SRC=https://github.com/tytso/e2fsprogs/archive/v$VER.tar.gz

echo "[i] make $PKG">&2

../download $SRC $PKG $DL || exit 1

cd $DL

D=${PKG%.tar.*}

[ -d $D ] || \
    tar -xf $PKG

cd *$D

./configure --prefix="$PRE2" --enable-elf-shlibs

make $MAKE_MT libs && \
    make install-libs
