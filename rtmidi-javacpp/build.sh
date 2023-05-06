#!/bin/bash

mkdir -p build/$PLATFORM
cd build/$PLATFORM

DIST=`pwd`

set -e

PWD=`pwd`

pushd .
cd ../../../external/rtmidi
cmake -B build-$PLATFORM
cmake --build build-$PLATFORM
echo "PWD: $PWD"
echo "DIST: $DIST"
cmake --install build-$PLATFORM --prefix $DIST

popd
