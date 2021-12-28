#!/bin/bash
cd /tmp/rom

export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 20G
ccache -o compression=true
ccache -z

source build/envsetup.sh
lunch fuse_juice-userdebug
export BUILD_USERNAME=lynx
export BUILD_HOSTNAME=serber-uwu
export SELINUX_IGNORE_NEVERALLOWS=true
export TZ=Asia/Jakarta
make fuse-prod -j8
