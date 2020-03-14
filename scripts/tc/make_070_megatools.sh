#!/bin/sh

## hyphop ##

#= make simg2img

D=$(dirname $0)

. $D/make_

# easy to use as binary

VER=1.11.0-git-20191107-linux-x86_64
NAME=megatools
PKG=$NAME-$VER.tar.gz
BASE=https://megatools.megous.com/builds/experimental/

#https://megatools.megous.com/builds/experimental/

# need last meson build fail
#https://megatools.megous.com/builds/experimental/megatools-1.11.0-git-20191107.tar.gz

# make from sources OK
#https://megatools.megous.com/builds/experimental/megatools-1.11.0-git-20190608.tar.gz

echo "[i] make $PKG">&2

../download $BASE$PKG $PKG $DL || exit 1

cd $DL

D=${PKG%.tar.*}

tar -O -xf $PKG --wildcards "*/$NAME" > $PRE2/bin/$NAME || exit 1
chmod 0777 $PRE2/bin/$NAME
