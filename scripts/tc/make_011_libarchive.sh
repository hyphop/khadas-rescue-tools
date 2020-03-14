#!/bin/sh

## hyphop ##

#= make xz

D=$(dirname $0)

. $D/make_

VER=3.4.2
NAME=libarchive
PKG=$NAME-$VER.tar.gz

echo "[i] make $PKG">&2

../download https://github.com/libarchive/libarchive/releases/download/v$VER/$NAME-$VER.tar.gz $PKG $DL || exit 1

cd $DL

D=${PKG%.tar.*}

[ -d "$D" ] || \
    tar -xf $PKG

cd $D

export CFLAGS="-I$PRE2/include"
export LDFLAGS="-L$PRE2/lib -Wl,-rpath=$PRE2/lib"
export LT_SYS_LIBRARY_PATH=$PRE2/lib
export PKG_CONFIG_LIBDIR=$PRE2

make clean

#    --disable-bsdtar \
./configure --prefix="$PRE2" \
    --disable-bsdcpio \
    --disable-bsdcat \
    --disable-rpath \
    --disable-acl \
    --disable-xattr \
    --without-cng \
    --without-iconv \
    --without-lz4 \
    --without-lzo2 \
    --without-nettle \
    --without-xml2 \
    --without-zlib \
    --without-bz2lib \
    --without-expat \
    --without-zstd \
    --without-openssl \
  && \
    make $MAKE_MT && \
	make install
