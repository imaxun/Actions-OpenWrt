#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate


sed -i 's/net.netfilter.nf_conntrack_max=.*/net.netfilter.nf_conntrack_max=65535/g' package/kernel/linux/files/sysctl-nf-conntrack.conf
#修改默认网关
sed -i 's/192.168.1.1/172.16.1.1/g' package/base-files/files/bin/config_generate
#修改主机名
sed -i 's/OpenWrt/LEDE/g' package/base-files/files/bin/config_generate
#修改默认密码
sed -i 's/root::0:0:99999:7:::/root:$1$jhtxo0rP$rQhY1u5GZLxMmlmRJPvzQ0:0:0:99999:7:::/g' package/base-files/files/etc/shadow
#修改默认wifi以及wifi密码
sed -i '/set wireless.default_radio${devidx}.encryption=none/a\                        set wireless.default_radio${devidx}.key=imaxun112233' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/set wireless.default_radio${devidx}.encryption=none/set wireless.default_radio${devidx}.encryption=psk-mixed/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/wireless.default_radio${devidx}.ssid=OpenWrt/wireless.default_radio${devidx}.ssid=imaxun/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh