#!/bin/bash
cd /tmp/rom

. build/envsetup.sh
$lunch
export BUILD_USERNAME=imannig
export BUILD_HOSTNAME=cirrus-kontol
export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 20G
ccache -o compression=true
ccache -z
$make -j8
