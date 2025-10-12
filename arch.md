# Arch

## 安装

### 禁用 reflector

reflector 会为你选择速度合适的镜像源，但其结果并不准确，后面手动加入国内的源。

`systemctl stop reflector.service`

使用下面的命令查看服务是否被禁用，按 `q` 退出:

`systemctl status reflector.service`

### 验证引导模式

要验证系统目前的引导模式，请检查 UEFI 位数：

`cat /sys/firmware/efi/fw_platform_size`

- 如果命令结果为 64，则系统是以 UEFI 模式引导且使用 64 位 x64 UEFI。
- 如果命令结果为 32，则系统是以 UEFI 模式引导且使用 32 位 IA32 UEFI。

### 连接到互联网

1.确保系统已经列出并启用了网络接口

`ip link`

2.激活无线网卡设备

`ip link set wlan0 up`

若看到类似 `Operation not possible due to RF-kill` 的报错，尝试使用 `rfkill unblock wifi` 来解锁无线网卡。

3.查看设备是否激活

```bash
# blocked: yes 表示禁用
rfkill list
```

4.使用 `iwctl`进行连接

```bash
iwctl # 进入交互式命令行
device list # 列出无线网卡设备名，比如无线网卡看到叫 wlan0
station wlan0 scan # 扫描网络
station wlan0 get-networks # 列出所有 wifi 网络
station wlan0 connect SSID # 连接无线网, SSID 是无线网的名称
exit # 连接成功后退出
```

5.测试网络是否联通

`ping -c 3 www.archlinux.org`

### 更新系统时钟

```bash
# 将系统时间与网络时间进行同步
timedatectl set-ntp true
# 检查服务状态
timedatectl status
```

## 磁盘分区

### 创建分区

使用 `cfdisk` 分区，为每个分区分配合适的大小。

| 分区           | 分区类型 | 挂载点 |
| -------------- | -------- | ------ |
| /dev/nvme0n1p1 | EFI      | /boot  |
| /dev/nvme0n1p2 | root     | /      |
| /dev/nvme0n1p3 | home     | /home  |
| /dev/nvme0n1p4 | swap     | SWAP   |

### 格式化分区

```bash
mkfs.fat -F 32 /dev/nvme0n1p1   # efi
mkfs.ext4 /dev/nvme0n1p2        # root
mkfs.ext4 /dev/nvme0n1p3        # home
mkswap /dev/nvme0n1p4           # swap
```

### 挂载分区

必须先挂载 `root` 分区，然后挂载 `efi` 分区。

```bash
mount /dev/nvme0n1p2 /mnt
mount --mkdir /dev/nvme0n1p1 /mnt/boot
mount --mkidr /dev/nvme0n1p3 /mnt/home
swapon /dev/nvme0n1p4
```

### 添加国内镜像

使用 `nano` 编辑 `/etc/pacman.d/mirrorlist` 文件。

```bash
Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch
Server = https://mirrors.bfsu.edu.cn/archlinux/$repo/os/$arch
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch
```

## 安装系统

1.内核相关

```bash
pacstrap -K /mnt base base-devel linux linux-headers linux-firmware
```

2.必要的软件

```bash
pacstrap -K /mnt networkmanager network-manager-applet iwd dhcpcd man-db man-pages man-pages-zh_cn zsh git neovim
```

## 生成 fstab 文件

`genfstab -U /mnt >> /mnt/etc/fstab`

查看 `fstab` 有无错误

`cat /mnt/etc/fstab`

## 配置系统

将环境切换到新系统的 `/mnt` 下

`arch-chroot /mnt`

### 设置时区

`ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime`

将当前的正确 UTC 时间写入硬件时间。

`hwclock --systohc`

### 设置 locale

编辑 `/etc/locale.gen` 文件，去掉下面两行前面的注释符号。

```bash
# en_US.UTF-8
# zh_CN.UTF_8
```

接着使用 `locale-gen` 命令生成 locale。

最后向 `/etc/locale.conf` 写入下面的内容:

```bash
echo 'LANG=zh_CN.UTF-8' > /etc/locale.conf
```

### 设置主机名

首先在 `/etc/hostname` 中设置主机名，接着编辑 `/etc/hosts` 加入如下内容:

```bash
127.0.0.1    localhost
::1          localhost
127.0.0.1    主机名.localdomain    主机名
```

### 设置密码

`passwd root`

### 安装微码

`pacman -S intel-ucode`

### 配置引导程序

1.安装引导程序

`pacman -S grub efibootmgr`

将 `grub` 安装到 `efi` 分区

`grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ARCH`

2.编辑 `/etc/default/grub` 文件，找到下面这行:

```bash
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"
```

- 将 loglevel 的值改为 5
- 将 quiet 替换为 nowatchdog

  3.生成 `GRUB`所需的配置文件

`grub-mkconfig -o /boot/grub/grub.cfg`

## 完成安装

1.退回安装环境

`exit`

2.卸载 `/mnt`

`umount -R /mnt`

3.重启

`reboot`

## 配置

### 配置服务

```bash
systemctl enable NetworkManager
systemctl enable sshd
```

重启系统使服务生效

### 连接网络

使用 `nmcli` 命令连接无线网

```bash
nmcli dev wifi connect wifi名 password 密码
```

测试网络是否联通

```bash
ping -c 3 www.archlinux.org
```

### 编辑器

设置默认编辑

使用 `EDITOR=nvim sudoedit` 编辑 `/etc/profile` 文件，加入以下内容:

```bash
export EDITOR='nvim'
export DIFFPROG='nvim'
```

### 用户

1.添加用户

```bash
useradd -m -G wheel 用户名
```

2.为用户设置密码

```bash
passwd 用户名
```

3.为用户设置权限

使用 `EDITOR=nvim visudo` 编辑 `/etc/sudoers` 文件。

去掉下面这行前面的注释符:

```bash
# %wheel ALL=(ALL:ALL) ALL
```

### 配置 pacman

编辑 `/etc/pacman.conf` 文件

1.彩蛋

```bash
去掉以下内容前面的注释符:
#Color
#CheckSpace
#VerbosePkgLists

# 然后再加入这行
ILoveCandy
```

2.[multilib]

```bash
# 去掉下面两行前的#
#[multilib]
#Include = /etc/pacman.d/mirrorlist
```

3.添加 archlinuxcn 源

在文件的最后加入以下内容:

```bash
[archlinuxcn]
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
Server = https://mirrors.bfsu.edu.cn/archlinuxcn/$arch
```

4.更新源

`pacman -Syyu`

5.添加 archlinuxcn-keying

```bash
pacman -S archlinuxcn-keyring
```

### 显卡

**注意，根据自己显卡的型号安装对应的驱动!**

1.安装

`pacman -S nvidia-open nvidia-settings lib32-nvidia-utils`

2.修改 grub

编辑 `/etc/default/grub`

在 `GRUB_CMDLINE_LINUX_DEFAULT` 中，加入 `nvidia_drm.modeset=1`。

3.更新引导程序

`grub-mkconfig -o /boot/grub/grub.cfg`

4.编辑 `/etc/mkinitcpio.conf` 文件

修改 `MODULES=()` 为:

`MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)`

删除 `HOOKS=()` 中的 `kms`

生成一个新的 initramfs

`mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-custom.img`

5.编辑 `/etc/modprobe.d/nvidia.conf`，添加以下内容:

`options nvidia_drm modeset=1`

**再次确认 `/etc/modprobe.d/nvidia.conf` 内容无误!**

`options nvidia_drm modeset=1`

**接着执行 `mkinitcpio -P`**

6.为了避免更新 NVIDIA 驱动之后忘了更新 initramfs，你可以使用 Pacman Hooks：

- 先在 `/etc/pacman.d/` 创建目录 `hooks`

- 然后在 `hooks` 中创建 `nvidia.hook` 文件，并在文件中加入下面内容:

```bash
[Trigger]
Operation=Install
Operation=Upgrade
Operation=Remove
Type=Package
Target=nvidia
Target=linux

[Action]
Description=Update nvidia module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'
```

### 音频

| 安装                                                 | 备注 |
| ---------------------------------------------------- | ---- |
| pacman -S pipewire wireplumber                       |      |
| pacman -S pipewire-alsa pipewire-jack pipewire-pulse |      |

### 蓝牙

| 安装                                | 备注                       |
| ----------------------------------- | -------------------------- |
| pacman -S bluez bluez-utils blueman | systemctl enable bluetooth |

### 字体

| 安装                                                                | 备注 |
| ------------------------------------------------------------------- | ---- |
| pacman -S terminus-font noto-fonts noto-fonts-cjk noto-fonts-emoji  |      |
| pacman -S ttf-sarasa-gothic ttf-fira-code                           |      |
| pacman -S ttf-firacode-nerd awesome-terminal-fonts otf-font-awesome |      |
