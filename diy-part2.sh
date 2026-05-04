#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# 进入 openwrt 源码目录
cd openwrt || exit

# 创建 files/usr/sbin 目录（如果不存在）
mkdir -p files/usr/sbin

# 将自定义 pppd 复制到 files 目录，并赋予可执行权限
cp "$GITHUB_WORKSPACE/pppd" files/usr/sbin/pppd
chmod +x files/usr/sbin/pppd
cp "$GITHUB_WORKSPACE/pppd" files/lib/netifd/proto/ppp.sh
chmod +x files/lib/netifd/proto/ppp.sh
