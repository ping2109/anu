#!/bin/bash
cd /tmp/rom

export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 20G
ccache -o compression=true
ccache -z

. build/envsetup.sh
lunch kasumi_juice-userdebug
export BUILD_USERNAME=lynx
export BUILD_HOSTNAME=serbersangar
export TZ=Asia/Jakarta
mka bandori -j8
