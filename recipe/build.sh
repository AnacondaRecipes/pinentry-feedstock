#!/usr/bin/env bash
set -e -o pipefail -x

cp -r ${BUILD_PREFIX}/share/libtool/build-aux/config.* ./build-aux

# make[2]: ar: Command not found (linux-aarch64 platform only!)
if [ $(uname -s) = "Linux" ] && [ ! -f "${BUILD_PREFIX}/bin/ar" ]; then
    ln -s "${BUILD}-ar" "${BUILD_PREFIX}/bin/ar"
    ln -s "$RANLIB" "${BUILD_PREFIX}/bin/ranlib"
    ln -sf "$LD" "${BUILD_PREFIX}/bin/ld"
fi

./autogen.sh
./configure --enable-pinentry-tty --disable-pinentry-curses --disable-pinentry-qt --disable-pinentry-gtk2 --disable-doc --prefix=${PREFIX}
make
make install

