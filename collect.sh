#!/bin/bash
cd /tmp/rom

. build/envsetup.sh
lunch nad_juice-user
export BUILD_USERNAME=lynx
export BUILD_HOSTNAME=cirrus-ci
export KBUILD_BUILD_USER=LynZx
export KBUILD_BUILD_HOST=Cirrus-CI
export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 20G
ccache -o compression=true
ccache -z
make nad -j8 &
sleep 90m
kill %1
ccache -s
