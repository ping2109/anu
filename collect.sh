#!/bin/bash
cd ~/rom

. build/envsetup.sh

export BUILD_USERNAME=ping2109
export BUILD_HOSTNAME=freefire-server
export CCACHE_DIR=~/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
export ALLOW_MISSING_DEPENDENCIES=true
ccache -M 8G -F 0
$lunch
$make -j32 &
sleep 99m
kill %1
ccache -s 
