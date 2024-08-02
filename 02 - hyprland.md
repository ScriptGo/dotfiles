# hyprland

hyprland 是基于 wayland 协议的窗口管理器

## 安装

1.更新系统

```bash
sudo pacman -Syyu
```

2.安装 hyprland

```bash
sudo pacman -S hyprland
sudo pacman -S qt5-wayland qt6-wayland glfw-wayland
sudo pacman -S xdg-desktop-portal-hyprland xdg-desktop-portal-gtk # 用于选取文件
sudo pacman -S xdg-user-dirs-gtk
```

3.必要软件

| 软件包     | 安装                             | 备注                       |
| ---------- | -------------------------------- | -------------------------- |
| bar        | sudo pacman -S waybar            |                            |
| 认证       | sudo pacman -S polkit-gnome      |                            |
| 终端       | sudo pacman -S kitty             |                            |
| 通知管理   | sudo pacman -S dunst             |                            |
| 登录管理器 | sudo pacman -S sddm              | sudo systemctl enable sddm |
| AUR        | sudo pacman -S yay               |                            |
| 快速启动   | sudo pacman -S rofi-wayland      |                            |
| 文件管理   | sudo pacman -S pcmanfm-gtk3 gvfs |                            |
| 剪贴板     | sudo pacman -S cliphist          |                            |

## 软件

### GUI

| 软件包    | 安装                                       | 备注                                                   |
| --------- | ------------------------------------------ | ------------------------------------------------------ |
| 文件压缩  | sudo pacman -S file-roller p7zip unrar     |                                                        |
| pdf阅读器 | sudo pacman -S zathura zathura-pdf-poppler |                                                        |
| nvim依赖  | sudo pacman -S python-pynvim               |                                                        |
| 办公软件  | sudo pacman - S libreoffice-fresh          | libreoffice-fresh-zh-cn                                |
| 字体管理  | sudo pacman -S font-manager                |                                                        |
| 笔记      | sudo pacman -S joplin-desktop              |                                                        |
| Pi-imager | sudo pacman -S rpi-imager                  |                                                        |
| ventoy    | sudo pacman -S ventoy                      |                                                        |
| 防火墙    | sudo pacman -S ufw                         | sudo ufw enable                                        |
| java      | sudo pacman -S jre17-openjdk               |                                                        |
| npm       | sudo pacman -S npm                         | npm config set registry https://registry.npmmirror.com |
| 科学上网  | sudo pacman -S v2raya                      |                                                        |
| 科学上网  | yay -S clash-verge-rev-bin                 |                                                        |
| 浏览器    | yay -S google-chrome                       |                                                        |
| 编辑器    | yay -S visual-studio-code-bin              |                                                        |

### CLI

| 软件包    | 安装                                                | 备注                   |
| --------- | --------------------------------------------------- | ---------------------- |
| 截图      | sudo pacman -S slurp grim                           |                        |
| 网络相关  | sudo pacman -S httpie net-tools                     |                        |
| 语法检查  | sudo pacman -S shellcheck shfmt                     |                        |
| 简化版man | yay -S tldr                                         | tldr --update          |
| 系统信息  | sudo pacman -S btop fastfetch                       | fastfetch --gen-config |
| 个性化    | sudo pacman -S fortune-mod sl cowsay cmatrix lolcat |                        |
| 其他      | sudo pacman -S bat fd fzf tree ripgrep zenity       |                        |

### 多媒体

| 软件包     | 安装                                                               | 备注 |
| ---------- | ------------------------------------------------------------------ | ---- |
| 图片相关   | sudo pacman -S ffmpeg ffmpegthumbnailer tumbler imagemagick gthumb |      |
| 音频控制   | sudo pacman -S pamixer pavucontrol                                 |      |
| 视频播放   | sudo pacman -S mpv                                                 |      |
| 音频播放   | sudo pacman -S mpd mpc ncmpcpp                                     |      |
| 音频可视化 | yay -S cava                                                        |      |

## 配置

### zsh

1.将shell切换为zsh

```bash
chsh -s $(which zsh)
```

2.配套软件

| 软件包   | 安装                                        | 备注 |
| -------- | ------------------------------------------- | ---- |
| 自动补全 | sudo pacman -S zsh-autosuggestions          |      |
| 语法高亮 | sudo pacman -S zsh-syntax-highlighting      |      |
| 命令搜索 | sudo pacman -S zsh-history-substring-search |      |
| 快速跳转 | yay -S z.lua                                |      |
| 界面美化 | sudo pacman -S starship                     |      |

### mpd

```bash
systemctl start mpd.service --user
systemctl enable mpd.service --user
```

### 目录重命名

将中文环境下的家目录名称修改为英文名称

```bash
export LANG=en_US.UTF-8
xdg-user-dirs-gtk-update  #
export LANG=zh-CN.UTF-8
```

### 缓存清理

自动清理软件包缓存

```bash
sudo pacman -S pacman-contrib
sudo systemctl enable paccache.timer
```

### SSD

自动清理 SSD 中的碎片

`sudo systemctl enable fstrim.timer`

### 功耗控制

```bash
sudo pacman -S tlp
sudo systemctl enable tlp
```

## 美化

美化资源存放位置:

| 资源类型 | 存放位置                                     |
| -------- | -------------------------------------------- |
| 字体     | ~/.local/share/fonts/ 或 /usr/share/fonts/   |
| 图、光标 | ~/.local/share/icons/ 或 /usr/share/icons/   |
| 主题     | ~/.local/share/themes/ 或 /usr/share/themes/ |

美化工具

| 软件包   | 安装                                        | 备注 |
| -------- | ------------------------------------------- | ---- |
| 设置工具 | sudo pacman -S nwg-look sassc kvantum qt5ct |      |
| 壁纸切换 | sudo pamcan -S swww                         |      |
| 锁屏     | sudo pacman -S swaylock-effects             |      |
| 空闲管理 | sudo pacman -S swayidle                     |      |

### 主题

1.从源里安装

`yay -S mojave-gtk-theme-git papirus-icon-theme`

2.从以下网站下载

```bash
https://www.gnome-look.org/browse/
https://www.pling.com/
https://store.kde.org/browse/
```

然后使用 `nwg-look` 进行设置

### grub

克隆下面的仓库

`git clone https://github.com/vinceliuice/grub2-themes.git && cd grub2-themes`

然后使用自带的脚本安装即可
`sudo ./install -t`

### sddm

1.安装主题

`yay -S sddm-theme-corners-git`

2.创建配置文件

`sudo cp /usr/lib/sddm/sddm.conf.d/default.conf /etc/sddm.conf`

3.修改配置文件

编辑 `/etc/sddm.conf` 文件，找到 `[Theme]` 修改 `Current` 选项。
