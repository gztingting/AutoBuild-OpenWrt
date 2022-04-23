#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
# DIY扩展二合一了，在此处可以增加插件
# 自行拉取插件之前请SSH连接进入固件配置里面确认过没有你要的插件再单独拉取你需要的插件
# 不要一下就拉取别人一个插件包N多插件的，多了没用，增加编译错误，自己需要的才好
# 修改IP项的EOF于EOF之间请不要插入其他扩展代码，可以删除或注释里面原本的代码
# 如果你的OP是当主路由的话，网关、DNS、广播都不需要，代码前面加 # 注释掉，只保留后台地址和子网掩码就可以
# 如果你有编译ipv6的话，‘去掉LAN口使用内置的 IPv6 管理’代码前面也加 # 注释掉

git clone https://github.com/gztingting/luci-theme-argon-dark-mod package/luci-theme-argon-dark-mod
#git clone https://github.com/sirpdboy/luci-app-autotimeset package/luci-app-autotimeset

cat >$NETIP <<-EOF
#uci set network.lan.ipaddr='10.59.72.115'                                    # IPv4 地址(openwrt后台地址)
#uci set network.lan.netmask='255.255.255.128'                                 # IPv4 子网掩码
#uci set network.lan.gateway='10.59.72.1'                                   # IPv4 网关
#uci set network.lan.broadcast='10.59.72.127'                               # IPv4 广播
#uci set network.lan.dns='211.136.192.6 223.5.5.5'                         # DNS(多个DNS要用空格分开)
#uci set network.lan.delegate='0'                                            # 去掉LAN口使用内置的 IPv6 管理
#uci commit network                                                          # 不要删除跟注释,除非上面全部删除或注释掉了
#uci set dhcp.lan.ignore='1'                                                 # 关闭DHCP功能
#uci commit dhcp                                                             # 跟‘关闭DHCP功能’联动,同时启用或者删除跟注释
uci set system.@system[0].hostname='Phicomm-N1'                             # 修改主机名称为Phicomm-N1
EOF

sed -i 's/luci-theme-bootstrap/luci-theme-argon-dark-mod/g' feeds/luci/collections/luci/Makefile                  # 选择argon为默认主题

sed -i "s/OpenWrt /FlyStation $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" $ZZZ                                     # 增加个性名字FlyStation
sed -i 's/luci.main.lang=zh_cn/luci.main.lang=en_us/g' $ZZZ                                                       # 修改为英文系统
sed -i '/CYXluq4wUazHjmCDBCqXF/d' $ZZZ                                                                            # 设置密码为空
#sed -i 's/京东签到服务/JD-DailyBonus/g' package/lean/luci-app-jd-dailybonus/luasrc/controller/jd-dailybonus.lua      #修改中文为英文
#sed -i 's/kmod-batman-adv +wpad-openssl/kmod-batman-adv/g' package/lean/luci-app-easymesh/Makefile                #easymesh插件不冲突

# 设置打包固件的机型，内核组合（可用内核是时时变化的,过老的内核就删除的，所以要选择什么内核请看说明）
cat >$GITHUB_WORKSPACE/amlogic_openwrt <<-EOF
amlogic_model=s905d
amlogic_kernel=5.15.35
rootfs_size=768
EOF

find -name "rebootschedule.lua" | xargs -i sed -i 's/control/system/g' {} #放到system下
find -name "rebootschedule.lua" | xargs -i sed -i 's/Control/system/g' {} #放到system下
find -name "rebootschedule.lua" | xargs -i sed -i 's/定时任务/Schedule More/g' {} #放到system下
#chmod 755 package/luci-app-autotimeset/root/etc/init.d/autotimeset

#sed -i 's/LUCI_DEPENDS.*/LUCI_DEPENDS:=\@\(arm\|\|aarch64\)/g' package/lean/luci-app-cpufreq/Makefile #适配amlogic
#sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile         #为armvirt添加autocore 支持

cat >${GITHUB_WORKSPACE}/Clear <<-EOF
rm -rf *buildinfo
rm -rf *manifest
rm -rf sha256sums
rm -rf *rootfs*
rm -rf *64-Image
EOF
