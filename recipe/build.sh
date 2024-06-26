#!/usr/bin/env bash
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./build-aux

if [[ "${target_platform}" == linux-* ]]; then
  export CFLAGS=${CFLAGS//-O2/}
  export CPPFLAGS=${CPPFLAGS//-O2/}
  export CXXFLAGS=${CXXFLAGS//-O2/}
fi

./configure --prefix=$PREFIX

make -j$CPU_COUNT
make install -j$CPU_COUNT
