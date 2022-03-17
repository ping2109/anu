#!/bin/bash
cd ~/rom

. build/envsetup.sh

export BUILD_USERNAME=ping2109
export BUILD_HOSTNAME=freefire-server
export CCACHE_DIR=~/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
export ALLOW_MISSING_DEPENDENCIES=true
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=false
mka clean && mka api-stubs-docs && mka hiddenapi-lists-docs && mka system-api-stubs-docs && mka test-api-stubs-docs
ccache -M 8G -F 0
$lunch
$mka bacon -j16 &
kill %1
ccache -s
