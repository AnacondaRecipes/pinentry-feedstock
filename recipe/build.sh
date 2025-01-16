#!/usr/bin/env bash
set -e -o pipefail -x

cp -r ${BUILD_PREFIX}/share/libtool/build-aux/config.* ./build-aux

./autogen.sh
./configure --enable-pinentry-tty --disable-pinentry-curses --disable-pinentry-qt --disable-pinentry-gtk2 --disable-doc --prefix=${PREFIX}
make
make install

