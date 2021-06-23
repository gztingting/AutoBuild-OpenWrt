#!/bin/bash
ZZZ="package/lean/default-settings/files/zzz-default-settings"
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#

sed -i "/uci commit fstab/a\uci commit network" $ZZZ
sed -i "/uci commit network/i\uci set network.lan.ipaddr='192.168.50.1'" $ZZZ                      # IPv4 地址(openwrt后台地址)
sed -i "/uci commit network/i\uci set network.lan.netmask='255.255.255.0'" $ZZZ                   # IPv4 子网掩码
sed -i "/uci commit network/i\uci set network.lan.gateway='192.168.50.1'" $ZZZ                     # IPv4 网关
sed -i "/uci commit network/i\uci set network.lan.broadcast='192.168.50.255'" $ZZZ                 # IPv4 广播
sed -i "/uci commit network/i\uci set network.lan.dns='192.168.50.1'" $ZZZ                         # DNS(多个DNS要用空格分开)
sed -i "/uci commit network/i\uci set network.lan.delegate='0'" $ZZZ                              # 去掉LAN口使用内置的 IPv6 管理
# echo "close_dhcp" > package/base-files/files/etc/closedhcp                                        # 关闭DHCP服务
#sed -i "/uci commit network/i\uci set network.lan.ipaddr='10.59.72.119'" $ZZZ
#sed -i "/uci commit network/i\uci set network.lan.netmask='255.255.255.128'" $ZZZ
#sed -i "/uci commit network/i\uci set network.lan.gateway='10.59.72.1'" $ZZZ
#sed -i "/uci commit network/i\uci set network.lan.broadcast='10.59.72.127'" $ZZZ
#sed -i "/uci commit network/i\uci set network.lan.dns='10.129.128.151 10.137.130.151'" $ZZZ
#sed -i "/uci commit network/i\uci set network.lan.delegate='0'" $ZZZ

sed -i 's/luci-theme-bootstrap/luci-theme-argon-dark-mod/g' feeds/luci/collections/luci/Makefile           # 选择argon为默认主题

sed -i "s/OpenWrt /FlyStation $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" $ZZZ          # 增加个性名字FlyStation

sed -i "/uci commit system/i\uci set system.@system[0].hostname='FlyStation'" $ZZZ            # 修改主机名称为FlyStation
sed -i 's/京东签到服务/JD-DailyBonus/g' package/lean/luci-app-jd-dailybonus/luasrc/controller/jd-dailybonus.lua #修改中文为英文
#sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0/$1$PhflQnJ1$yamWfH5Mphs4hXV7UXWQ21:18725/g' $ZZZ  # 替换密码（要替换密码就不能设置密码为空）

sed -i '/CYXluq4wUazHjmCDBCqXF/d' $ZZZ                                                            # 设置密码为空

#sed -i 's/PATCHVER:=5.4/PATCHVER:=4.19/g' target/linux/x86/Makefile                              # 修改内核版本为4.19
