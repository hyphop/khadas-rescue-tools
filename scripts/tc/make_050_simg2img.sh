#!/bin/sh

## hyphop ##

#= make simg2img

D=$(dirname $0)

. $D/make_

VER=1.1.3
NAME=simg2img
PKG=$NAME-$VER.tar.gz

echo "[i] make $PKG">&2

../download https://github.com/anestisb/android-simg2img/archive/$VER.tar.gz $PKG $DL || exit 1

cd $DL

D=${PKG%.tar.*}

[ -d $D ] || \
    tar -xf $PKG

cd *$D

make && \
    cp simg2img $PRE2/bin
