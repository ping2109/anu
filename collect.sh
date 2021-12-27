#!/bin/bash
cd /tmp/rom

. build/envsetup.sh
lunch exthm_juice-userdebug
export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 20G
ccache -o compression=true
ccache -z
mka bacon -j8 &
sleep 100m
kill %1
ccache -s

