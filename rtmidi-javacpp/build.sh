#!/bin/bash

mkdir -p build/$PLATFORM
cd build/$PLATFORM

DIST=`pwd`

set -e

PWD=`pwd`

pushd .
cd ../../../external/rtmidi
if [ ! -f .patch.stamp ] ; then
    patch -i ../../workaround-javacpp-code-generator-issue.patch -p1
    touch .patch.stamp
fi
cmake -B build-$PLATFORM
cmake --build build-$PLATFORM
echo "PWD: $PWD"
echo "DIST: $DIST"
cmake --install build-$PLATFORM --prefix $DIST
if [ -e $DIST/lib/librtmidi.7.0.0.dylib ]; then
    mv $DIST/lib/librtmidi.7.0.0.dylib $DIST/lib/librtmidi.7.dylib # un-symlink
else
    mv $DIST/lib/librtmidi.7.0.0.so $DIST/lib/librtmidi.so # un-symlink
fi

popd
