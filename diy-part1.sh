#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

pushd package/lean
git clone https://github.com/gztingting/luci-theme-argon-dark-mod
git clone https://github.com/kenzok8/luci-theme-ifit
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-fileassistant
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-filebrowser
git clone https://github.com/sirpdboy/luci-app-autotimeset
git clone https://github.com/fw876/helloworld
#rm -rf luci-lib-docker
#svn co https://github.com/lisaac/luci-app-dockerman/trunk/applications/luci-app-dockerman
#git clone https://github.com/lisaac/luci-lib-docker
popd
