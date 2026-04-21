#!/bin/bash
# diy-part2.sh - ZN M2 无 WiFi 专用

# 修改 LuCI 中默认 IP 显示
sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.1.1/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js" 2>/dev/null || true)

# 无 WiFi 配置：缩小 Q6 内存到 8MB（重要！）
find ./target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ -type f ! -iname '*nowifi*' -exec sed -i 's/ipq$$   6018\|8074   $$\.dtsi/ipq\1-nowifi.dtsi/g' {} + 2>/dev/null || true
sed -i 's/0x1000000/0x800000/g' ./target/linux/qualcommax/files/arch/arm64/boot/dts/qcom/ipq6018-nowifi.dtsi 2>/dev/null || true
