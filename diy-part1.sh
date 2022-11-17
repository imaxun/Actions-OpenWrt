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
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default


#1.配置软件包源#
echo 'src-git kenzo  https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
echo 'src-git Lienol https://github.com/Lienol/openwrt-package' >>feeds.conf.default
echo 'src-git small  https://github.com/kenzok8/small' >>feeds.conf.default


#3.配置插件#
mkdir -p package/custom
cd package/custom

git clone --depth=1 https://github.com/zzsj0928/luci-app-pushbot                #推送机器人
git clone --depth=1 https://github.com/rufengsuixing/luci-app-adguardhome       #去广告
git clone --depth=1 https://github.com/pymumu/openwrt-smartdns                  #选择Network > smartdns
git clone --depth=1 https://github.com/vernesong/OpenClash                      #翻墙
git clone --depth=1 https://github.com/fw876/helloworld                         #翻墙

#3.配置主题#
git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon.git


