#!/bin/bash
cd /tmp/rom

. build/envsetup.sh
lunch palladium_juice-userdebug
export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 20G
ccache -o compression=true
ccache -z
export KBUILD_BUILD_USER=LynZx
export KBUILD_BUILD_HOST=Serber-UWU
export SELINUX_IGNORE_NEVERALLOWS=true
mka palladium -j8 &
sleep 90m
kill %1
ccache -s
