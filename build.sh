#!/bin/bash

set -e

ROOT=$(cd "$(dirname "$0")" && pwd)
PREFIX=${PREFIX:-/tmp/emscripten_root}
BUILD_DIR=${BUILD_DIR:-"$ROOT/json-c-build"}
export EMCC_CFLAGS="${EMCC_CFLAGS:+$EMCC_CFLAGS }-s USE_PTHREADS=1"

rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

emcmake "$ROOT/cmake-configure" -- \
	-DCMAKE_INSTALL_PREFIX="$PREFIX" \
	-DBUILD_SHARED_LIBS=OFF \
	-DBUILD_STATIC_LIBS=ON \
	-DBUILD_APPS=OFF \
	-DBUILD_TESTING=OFF
emmake make
emmake make install
