#!/bin/bash
cd /tmp/rom

export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 20G
ccache -o compression=true
ccache -z
export BUILD_USER=lynx
export BUILD_HOST=Serber-UWU
export BUILD_USERNAME=LynZx
export BUILD_HOSTNAME=Serber-UWU

. build/envsetup.sh
lunch nad_juice-userdebug
mka nad -j8
