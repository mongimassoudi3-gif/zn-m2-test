# ZN-M2 无 WiFi 满血 NSS 固件

专为 **ZN M2** 打造的高性能 ImmortalWrt 固件，专注于**纯硬件路由弱电箱**场景。

### 核心特点
- **完全无 WiFi**：彻底禁用所有无线模块（ath11k、mac80211 等），显著降低功耗、缩小体积、避免干扰
- **满血 NSS 硬件加速**：开启 Qualcomm 全套 NSS（ECM、EDMA、BRIDGE、CRYPTO、IPSEC、GRE、VXLAN、PPPoE、TLS 等），NAT 与 VPN 性能极致
- **编译极致优化**：多级缓存（toolchain + ccache + dl + build_dir + staging_dir）+ download 预热，重复编译速度极快
- **默认配置**：IP `192.168.1.1`，无密码，中文界面，Material 主题
- **已包含常用插件**：HomeProxy、ZeroTier、Lucky、cpufreq、UPnP、BBR 等

### 编译方法（GitHub Actions）

1. 进入仓库 **Actions** 标签
2. 选择 **Firmware-M2** workflow
3. 点击右上角 **Run workflow**
   - `ax18_or_m2` 保持默认 `m2`
   - `only_config` 留空（不勾选）
4. 等待完成，下载 `OpenWrt_firmware_...` 或 `OpenWrt_bin_...` artifact

**编译耗时参考**：
- 首次编译：约 20~30 分钟
- 后续编译（缓存命中）：约 8~15 分钟

### 刷机建议
- 推荐使用 Web 界面 **sysupgrade** 刷入 squashfs 固件
- 刷机前备份当前配置
- NSS 加速默认开启，无需额外设置

### 项目文件说明
- `config-m2-nss-full.cfg` —— 核心配置（满血 NSS + 无 WiFi）
- `diy-part1.sh` —— 添加 lucky feeds
- `diy-part2.sh` —— 无 WiFi Q6 内存优化（8MB）+ LuCI 默认 IP 修正
- `.github/workflows/build-m2.yml` —— 已深度优化的云编译流程

### 注意事项
- 本固件**不包含任何 WiFi 驱动**，仅适用于旁路由、硬路由、纯转发等场景
- 追求极致性能的用户可继续在 LuCI 中安装 mwan3 等插件，NSS 会自动提供硬件加速

### 致谢
基于 ImmortalWrt 项目，参考 P3TERX Actions-OpenWrt 模板。

欢迎 Issue / PR 交流优化建议！

---

**最后更新**：2026.04  
**编译平台**：ubuntu-24.04 + GCC 14.3 + 多级缓存
