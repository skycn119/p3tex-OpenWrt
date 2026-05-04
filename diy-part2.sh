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

ROOTFS_DIR=$(find openwrt/build_dir/target-* -maxdepth 1 -type d -name "root-*" | head -n 1)

if [ -z "$ROOTFS_DIR" ]; then
  echo "❌ rootfs not found, skip inject"
  exit 0
fi

echo "✅ Found rootfs: $ROOTFS_DIR"

# ---------- 示例：替换 ppp 相关文件 ----------
# mkdir -p $ROOTFS_DIR/usr/sbin
cp -f pppd $ROOTFS_DIR/usr/sbin/pppd
chmod 0755 $ROOTFS_DIR/usr/sbin/pppd
cp -f ppp.sh $ROOTFS_DIR/lib/netifd/proto/ppp.sh
chmod 0755 $ROOTFS_DIR/lib/netifd/proto/ppp.sh


