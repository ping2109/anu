#!/bin/bash
cd /tmp/rom

. build/envsetup.sh
lunch evolution_juice-user
export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 20G
ccache -o compression=true
ccache -z
mka evolution -j8 &
sleep 90m
kill %1
ccache -s
