#!/bin/bash
cd /tmp/rom

export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 20G
ccache -o compression=true
ccache -z

. build/envsetup.sh
lunch nad_juice-userdebug
export BUILD_USERNAME=lynx
export BUILD_HOSTNAME=cirrus-ci
export KBUILD_BUILD_USER=LynZx
export KBUILD_BUILD_HOST=Cirrus-CI
export SELINUX_IGNORE_NEVERALLOWS=true
export TZ=Asia/Jakarta
mka nad -j8
