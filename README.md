# K230 Linux Pangofly SDK

基于 K230 Linux SDK 并集成 Pangofly 共享内存通信库。

## 概述

本仓库基于 K230 Linux SDK，提供高性能共享内存通信功能。

## 目录结构

```
k230_linux_pangofly/
├── buildroot-overlay/  # Buildroot 配置覆盖层
│   └── configs/        # 配置文件
├── output/             # 编译输出目录
├── tools/              # 工具脚本
├── docs/               # 文档
├── pangofly/           # Pangofly 共享内存库
├── Makefile            # 主 Makefile
└── README.md           # 本文件
```

## 使用 Docker 编译（推荐）

### 前提条件

- 安装 Docker
```bash
# Ubuntu/Debian
sudo apt install docker.io
sudo usermod -aG docker $USER && newgrp docker
```

- 配置 Git 用户信息
```bash
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

### 安装 k230 命令

```bash
curl -fsSL https://www.kendryte.com/misc/install.sh | bash
source ~/.bashrc
```

### 快速开始

```bash
# 1) 克隆代码
git clone <repository-url> k230_linux_pangofly
cd k230_linux_pangofly

# 2) 拉取 docker 镜像
k230 pull

# 3) 下载工具链（仅需首次执行一次）
k230 download-toolchains TC2

# 4) 编译（CONF 参数指定配置名）
k230 make CONF=k230_canmv_defconfig
```

编译完成后，镜像输出在 `output/<conf>/images/` 目录下。

### 常用命令

```bash
k230 list-toolchains                      # 查看可用工具链列表
k230 download-toolchains TC4              # 下载 ILP32 工具链（可选）
k230 make CONF=k230_canmv_defconfig       # 编译指定配置
k230 bash                                 # 进入容器终端
k230 pull                                 # 更新 k230-builder 镜像
```

可用的配置名见 `buildroot-overlay/configs/` 目录。

## 直接本机编译

### 前提条件

- Ubuntu 20.04/22.04 LTS（64位）
- 至少 16GB 内存
- 至少 100GB 磁盘空间

### 安装依赖

```bash
sudo make toolchain_and_depend
```

### 编译

```bash
make CONF=k230_canmv_defconfig
```

### 编译输出

`output/<conf>/images/sysimage-sdcard.img.gz`

烧录前需解压缩。

## Pangofly 集成

Pangofly 作为子模块集成，提供高性能共享内存通信：

```bash
# 初始化 Pangofly 子模块
git submodule init
git submodule update

# 编译 Pangofly
cd pangofly
mkdir -p build && cd build
cmake ..
make -j$(nproc)
```

## 可用配置

- `k230_canmv_defconfig` - K230 CanMV 镜像
- `k230d_canmv_defconfig` - K230D CanMV 镜像（64位）
- `k230d_canmv_ilp32_defconfig` - K230D CanMV 镜像（32位根文件系统）

## 镜像烧录

参考官方文档：[K230 Linux 镜像烧录指南](https://www.kendryte.com/k230_linux/zh/main/userguide/how_to_flash.html)

## 获取预编译镜像

从官方下载：[K230 Linux SDK 镜像中心](https://kendryte-download.canaan-creative.com/k230/release/linux_sdk_images/daily_build/)

## 技术支持

- **官方文档**: [K230 Linux 文档中心](https://www.kendryte.com/k230_linux)
- **GitHub**: [k230_linux_pangofly](https://github.com/sgf201/k230_linux_pangofly)
- **Pangofly**: [pangofly](https://github.com/sgf201/pangofly)
