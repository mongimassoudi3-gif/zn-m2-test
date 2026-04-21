# ZN M2 无 WiFi 满血 NSS 固件

专为 **ZN M2** 路由器定制的 ImmortalWrt 固件，主打**高性能旁路由 / 硬件加速转发**。

### 核心特点
- **完全无 WiFi**：禁用所有无线模块（ath11k、mac80211 等），减少干扰、降低功耗、缩小固件体积。
- **满血 NSS 硬件加速**：启用全套 Qualcomm NSS（ECM、EDMA、BRIDGE、IPSEC、CRYPTO、TLS、GRE、VXLAN、PPPOE 等），支持极致 NAT、VPN 卸载。
- **VPN 优化**：原生支持 HomeProxy + ZeroTier，后续可无缝添加 mwan3（多 WAN 负载均衡）。
- **编译优化**：GCC 13.3 + 多级缓存（toolchain/ccache/dl/build_dir/staging_dir），单次编译约 20-25 分钟，重复编译更快。
- **默认配置**：IP `192.168.1.1`，无密码，中文界面，Material 主题。

### 已包含插件
- luci-app-cpufreq、luci-app-firewall、luci-app-upnp
- luci-app-homeproxy、luci-app-zerotier、luci-app-lucky
- iperf3、dnsmasq-full、ip-full、BBR 等网络优化组件

### 编译方法（GitHub Actions）

1. Fork 或直接使用本仓库
2. 进入 **Actions** → 选择 **Firmware-M2** workflow
3. 点击 **Run workflow**
   - `ax18_or_m2` 选 `m2`
   - `only_config` 可勾选（仅生成配置，不编译）
4. 等待编译完成，下载 `OpenWrt_firmware_...` 或 `OpenWrt_bin_...` artifact

**提示**：首次编译可能稍慢，后续因缓存加速会明显变快。

### 刷机建议
- 通过 Web 界面或 sysupgrade 刷入 squashfs 固件
- 刷机后建议先备份当前配置，再进行初始设置
- NSS 加速默认开启，无需额外配置

### 项目文件说明
- `config-m2-nss-full.cfg`：核心配置文件（满血 NSS + 无 WiFi）
- `diy-part1.sh`：添加 lucky feeds 等前期自定义
- `diy-part2.sh`：无 WiFi Q6 内存优化（8MB）+ LuCI IP 显示修正
- `.github/workflows/build-m2.yml`：GitHub 云编译流程（已优化缓存）
- `.gitignore`：排除编译中间文件

### 注意事项
- 本固件**不含任何 WiFi 驱动**，适合旁路由、硬路由、纯转发场景。
- NSS 满血配置会占用较多内存和编译时间，适合追求极致性能的用户。
- 如需添加 mwan3 等功能，可在 LuCI 中安装对应插件，NSS 会自动提供硬件加速支持。

### 致谢
基于 ImmortalWrt 项目，参考 P3TERX Actions-OpenWrt 模板。

欢迎 Issue / PR 交流优化建议。

---

**最后更新**：2026 年  
**编译耗时**：约 20-25 分钟（满血 NSS 配置）
