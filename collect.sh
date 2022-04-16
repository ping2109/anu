#!/bin/bash
cd ~/rom

. build/envsetup.sh

export BUILD_USERNAME=ping2109
export BUILD_HOSTNAME=freefire-server
export CCACHE_DIR=~/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
export SKIP_ABI_CHECKS=true
export ALLOW_MISSING_DEPENDENCIES=true
export SELINUX_IGNORE_NEVERALLOWS=true
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES=true
ccache -M 8G -F 0
$lunch
$make -j8 &
sleep 100m
kill %1
ccache -s 
