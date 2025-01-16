#!/usr/bin/env bash
set -e -o pipefail -x

cp -r ${BUILD_PREFIX}/share/libtool/build-aux/config.* ./build-aux

# make[2]: ar: Command not found (linux-aarch64 platform only!)
if [[ "${target_platform}" == "linux-aarch64" ]]; then
    export AR=$(basename $AR)
fi

./autogen.sh
./configure --enable-pinentry-tty --disable-pinentry-curses --disable-pinentry-qt --disable-pinentry-gtk2 --disable-doc --prefix=${PREFIX}
make
make install

