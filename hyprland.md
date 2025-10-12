# hyprland

更新系统

```bash
sudo pacman -Syyu
```

安装 hyprland

```bash
sudo pacman -S hyprland

sudo pacman -S qt5-wayland glfw-wayland
sudo pacman -S xdg-desktop-portal-hyprland xdg-desktop-portal-gtk
sudo pacman -S xdg-user-dirs-gtk
```

必装

| 软件包     | 安装                             | 备注                       |
| ---------- | -------------------------------- | -------------------------- |
| bar        | sudo pacman -S waybar            |                            |
| 认证       | sudo pacman -S hyprpolkitagent   |                            |
| 终端       | sudo pacman -S kitty             |                            |
| 通知管理   | sudo pacman -S dunst libnotify   |                            |
| 登录管理器 | sudo pacman -S sddm              | sudo systemctl enable sddm |
| 快速启动   | sudo pacman -S rofi-wayland      |                            |
| 文件管理   | sudo pacman -S gvfs pcmanfm-gtk3 |                            |
| 剪贴板     | sudo pacman -S cliphist xclip    |                            |
| AUR 助手   | sudo pacman -S yay               |                            |

## GUI

| 软件包   | 安装                                        | 备注                       |
| -------- | ------------------------------------------- | -------------------------- |
| 文件管理 | sudo pacman -S doublecmd-qt6                |                            |
| 文件压缩 | sudo pacman -S file-roller 7zip unzip unrar |                            |
| 办公软件 | sudo pacman -S libreoffice-fresh            | libreoffice-fresh-zh-cn    |
| 字体管理 | sudo pacman -S font-manager                 |                            |
| 防火墙   | sudo pacman -S ufw                          | sudo ufw enable            |
| 科学上网 | sudo pacman -S v2raya                       | yay -S clash-verge-rev-bin |
| 浏览器   | yay -S google-chrome                        |                            |
| 其他     | sudo pacman -S rpi-imager                   |                            |

## CLI

| 软件包   | 安装                                                | 备注                   |
| -------- | --------------------------------------------------- | ---------------------- |
| 截图     | sudo pacman -S slurp grim                           |                        |
| 网络相关 | sudo pacman -S httpie net-tools                     |                        |
| 语法检查 | sudo pacman -S shellcheck shfmt                     |                        |
| 系统信息 | sudo pacman -S btop fastfetch                       | fastfetch --gen-config |
| 个性化   | sudo pacman -S fortune-mod sl cowsay cmatrix lolcat |                        |
| 流程图   | sudo pacman -S graphviz                             |                        |
| 其他     | sudo pacman -S bat fd fzf tree ripgrep zenity       |                        |

## 编程

| 软件包 | 安装                          | 备注                                                     |
| ------ | ----------------------------- | -------------------------------------------------------- |
| 编辑器 | yay -S visual-studio-code-bin |                                                          |
| 笔记   | sudo pacman -S joplin-desktop |                                                          |
| nvim   | sudo pacman -S python-pynvim  |                                                          |
| java   | sudo pacman -S jre17-openjdk  |                                                          |
| npm    | sudo pacman -S npm            | npm config set registry <https://registry.npmmirror.com> |
| red    | sudo pacman -S lib32-gtk3     |                                                          |
| scheme | sudo pacman -S racket         |                                                          |

## 多媒体

| 软件包     | 安装                                                               | 备注                                |
| ---------- | ------------------------------------------------------------------ | ----------------------------------- |
| 图片相关   | sudo pacman -S ffmpeg ffmpegthumbnailer tumbler imagemagick gthumb |                                     |
| 音频控制   | sudo pacman -S pamixer pavucontrol                                 |                                     |
| 视频播放   | sudo pacman -S mpv                                                 |                                     |
| 音频播放   | sudo pacman -S mpd mpc ncmpcpp                                     | systemctl enable mpd.service --user |
| 音频可视化 | sudo pacman -S cava                                                |                                     |
| 游戏       | sudo pacman -S steam                                               |                                     |

## 配置

**目录重命名**

```bash
export LANG=en_US.UTF-8
xdg-user-dirs-gtk-update # 点击 Update 按钮
export LANG=zh_CN.UTF-8
```

**zsh**

先安装软件

| 软件包   | 安装                                        | 备注 |
| -------- | ------------------------------------------- | ---- |
| 自动补全 | sudo pacman -S zsh-autosuggestions          |      |
| 语法高亮 | sudo pacman -S zsh-syntax-highlighting      |      |
| 命令搜索 | sudo pacman -S zsh-history-substring-search |      |
| 快速跳转 | yay -S z.lua                                |      |
| 界面美化 | sudo pacman -S starship                     |      |

再将 shell 切换为 zsh

```bash
chsh -s $(which zsh)
```

**清理 SSD 中的碎片**

```bash
sudo systemctl enable fstrim.timer
```

**清理缓存**

```bash
sudo pacman -S pacman-contrib
sudo systemctl enable paccache.timer
```

**电源管理**

```bash
sudo pacman -S tlp
sudo systemctl enable tlp
```

## 美化

先安装以下软件

| 软件包   | 安装                                        | 备注 |
| -------- | ------------------------------------------- | ---- |
| 设置工具 | sudo pacman -S nwg-look sassc kvantum qt5ct |      |
| idle     | sudo pacman -S hypridle hyprlock            |      |
| 壁纸切换 | sudo pamcan -S swww                         |      |

### 主题

1.从源里安装

`sudo pacman -S papirus-icon-theme`

2.从以下网站下载

```bash
https://www.gnome-look.org/browse/
https://www.pling.com/
https://store.kde.org/browse/
```

将下载后的文件解压，放到下面的位置:

| 资源类型 | 存放位置                                     |
| -------- | -------------------------------------------- |
| 字体     | ~/.local/share/fonts/ 或 /usr/share/fonts/   |
| 图、光标 | ~/.local/share/icons/ 或 /usr/share/icons/   |
| 主题     | ~/.local/share/themes/ 或 /usr/share/themes/ |

### grub

克隆下面的仓库

`git clone https://github.com/vinceliuice/grub2-themes.git && cd grub2-themes`

然后使用自带的脚本安装即可

`sudo ./install.sh -t`

### sddm

安装主题

`yay -S sddm-theme-corners-git`

创建配置文件

`sudo cp /usr/lib/sddm/sddm.conf.d/default.conf /etc/sddm.conf`

修改配置文件

编辑 `/etc/sddm.conf` 文件，找到 `[Theme]` 修改 `Current` 选项为 `corners`。

修改登录界面的背景图片

```bash
1. 将任意格式为 png 的图片复制到如下目录:

/usr/share/sddm/themes/corners/backgrounds

2. 返回到 backgrounds 的上级目录并编辑 theme.conf 文件:

找到 BgSource="backgrounds/xxx.png"
将 xxx.png 修改为你复制的图片
```
