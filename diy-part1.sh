#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
## This is free software, licensed under the MIT License.
# See /LICENSE for more information.
## https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

#rm -R ./feeds/luci/applications/luci-app-aliyundrive-webdav

pushd feeds/luci/applications
git clone https://github.com/gztingting/luci-theme-argon-dark-mod
#git clone https://github.com/kenzok8/luci-theme-ifit
git clone https://github.com/DevOpenWRT-Router/luci-app-rebootschedule
git clone https://github.com/gztingting/luci-app-fileassistant
#svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-fileassistant
#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-aliyundrive-webdav
svn co https://github.com/281677160/openwrt-package/trunk/cdnspeedtest
svn co https://github.com/281677160/openwrt-package/trunk/luci-app-cloudflarespeedtest
#svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-filebrowser
#git clone https://github.com/sirpdboy/luci-app-autotimeset
git clone https://github.com/fw876/helloworld
#svn co https://github.com/lisaac/luci-app-dockerman/trunk/applications/luci-app-dockerman
#git clone https://github.com/awesome-openwrt/luci-app-syncthing
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus
git clone https://github.com/281677160/openwrt-passwall
#git clone https://github.com/xiaorouji/openwrt-passwall.git -b packages ./passwall_package
#git clone https://github.com/xiaorouji/openwrt-passwall.git -b luci ./passwall
#cp -rf ./passwall_package/* ./passwall
#rm -rf ./passwall_package
popd
