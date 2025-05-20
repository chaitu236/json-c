#!/bin/bash
rm -rf json-c-build
mkdir json-c-build

cd json-c-build
emcmake ../cmake-configure -- -DCMAKE_INSTALL_PREFIX=/tmp/emscripten_root
emmake make
