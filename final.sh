#!/bin/bash
cd ~/rom

. build/envsetup.sh
export BUILD_USERNAME=imannig
export BUILD_HOSTNAME=cirrus-kontol
export CCACHE_DIR=~/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 20G -F 0
ccache -o compression=true
ccache -z

$lunch
$make -j8