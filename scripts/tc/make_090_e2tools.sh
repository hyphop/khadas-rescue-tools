#!/bin/sh

## hyphop ##

#= make simg2img

D=$(dirname $0)

. $D/make_

VER=0.1.0
NAME=e2tools
PKG=$NAME-$VER.tar.gz
BASE=https://github.com/e2tools/e2tools/releases/download/v$VER/

echo "[i] make $PKG">&2

[ "$APT" ] && {
CMD="apt-get install $NAME"
echo "# $CMD # NEED privs">&2
sudo $CMD || exit 1
exit 0
}

../download $BASE$PKG $PKG $DL || exit 1

cd $DL

D=${PKG%.tar.*}

[ -d $D ] || \
    tar -xf $PKG

cd *$D

export PKG_CONFIG_PATH=$PRE2/lib/pkgconfig

./configure --prefix="$PRE2"

make $MAKE_MT && \
    make install

