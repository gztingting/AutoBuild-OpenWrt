#!/bin/bash
ZZZ="package/lean/default-settings/files/zzz-default-settings"
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#

#sed -i "/uci commit fstab/a\uci commit network" $ZZZ
#sed -i "/uci commit network/i\uci set network.lan.ipaddr='192.168.50.1'" $ZZZ                      # IPv4 地址(openwrt后台地址)
#sed -i "/uci commit network/i\uci set network.lan.netmask='255.255.255.0'" $ZZZ                   # IPv4 子网掩码
#sed -i "/uci commit network/i\uci set network.lan.gateway='192.168.50.1'" $ZZZ                     # IPv4 网关
#sed -i "/uci commit network/i\uci set network.lan.broadcast='192.168.50.255'" $ZZZ                 # IPv4 广播
#sed -i "/uci commit network/i\uci set network.lan.dns='192.168.50.1'" $ZZZ                         # DNS(多个DNS要用空格分开)
#sed -i "/uci commit network/i\uci set network.lan.delegate='0'" $ZZZ                              # 去掉LAN口使用内置的 IPv6 管理
#echo "close_dhcp" > package/base-files/files/etc/closedhcp                                        # 关闭DHCP服务
#sed -i "/uci commit network/i\uci set network.lan.ipaddr='10.59.72.119'" $ZZZ
#sed -i "/uci commit network/i\uci set network.lan.netmask='255.255.255.128'" $ZZZ
#sed -i "/uci commit network/i\uci set network.lan.gateway='10.59.72.1'" $ZZZ
#sed -i "/uci commit network/i\uci set network.lan.broadcast='10.59.72.127'" $ZZZ
#sed -i "/uci commit network/i\uci set network.lan.dns='10.129.128.151 10.137.130.151'" $ZZZ
#sed -i "/uci commit network/i\uci set network.lan.delegate='0'" $ZZZ
#echo "close_dhcp" > package/base-files/files/etc/closedhcp

sed -i 's/luci-theme-bootstrap/luci-theme-argon-dark-mod/g' feeds/luci/collections/luci/Makefile                  # 选择argon为默认主题
#sed -i 's/京东签到服务/JD-DailyBonus/g' package/lean/luci-app-jd-dailybonus/luasrc/controller/jd-dailybonus.lua    #修改京东签到中文为英文

sed -i 's/luci.main.lang=zh_cn/luci.main.lang=en_us/g' $ZZZ                            # 修改为英文系统
sed -i "s/OpenWrt /FlyStation $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" $ZZZ          # 增加个性名字FlyStation
sed -i '/CYXluq4wUazHjmCDBCqXF/d' $ZZZ                                                 # 设置密码为空
sed -i "/uci commit system/i\uci set system.@system[0].hostname='FlyStation'" $ZZZ     # 修改主机名称为FlyStation

sed -i "/CONFIG_DUMMY_CONSOLE=y/a\CONFIG_64BIT=y" target/linux/x86/config-5.10 #增加i915显卡
sed -i "/CONFIG_64BIT=y/i\CONFIG_DRM=y" target/linux/x86/config-5.10
sed -i "/CONFIG_64BIT=y/i\CONFIG_DRM_I915=y" target/linux/x86/config-5.10
sed -i "/CONFIG_64BIT=y/i\CONFIG_DRM_I915_GVT=y" target/linux/x86/config-5.10

sed -i "/CONFIG_DNOTIFY=y/a\CONFIG_64BIT=y" target/linux/x86/config-5.4 #增加i915显卡
sed -i "/CONFIG_64BIT=y/i\CONFIG_DRM=y" target/linux/x86/config-5.4
sed -i "/CONFIG_64BIT=y/i\CONFIG_DRM_I915=y" target/linux/x86/config-5.4
sed -i "/CONFIG_64BIT=y/i\CONFIG_DRM_I915_GVT=y" target/linux/x86/config-5.4

#sed -i 's/=0.4.0/=0.4.7/g' package/lean/aliyundrive-webdav/Makefile #升级到最新版本
#chmod 755 package/lean/luci-app-autotimeset/root/etc/init.d/autotimeset

sed -i '7d' package/lean/luci-app-rebootschedule/luasrc/controller/rebootschedule.lua
sed -i 's/"control"/"system"/g' package/lean/luci-app-rebootschedule/luasrc/controller/rebootschedule.lua #move to system entry
sed -i 's/services/nas/g' package/lean/luci-app-aliyundrive-webdav/luasrc/controller/aliyundrive-webdav.lua #move to nas entry
#sed -i 's/文件助手/File Assistant/g' package/lean/luci-app-fileassistant/luasrc/controller/fileassistant.lua
