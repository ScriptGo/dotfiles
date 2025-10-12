# Created by newuser for 5.9

# #############################################################################
# 选项
# #############################################################################

# 自动纠正错误的命令
setopt correct
# 启用通配符
setopt EXTENDED_GLOB
# 通配符不区分大小写
setopt nocaseglob
# 以下字符视为单词的一部分
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'

# #############################################################################
# 历史记录
# #############################################################################

# 如果连续输入的命令相同，历史记录中只保留一个
setopt HIST_IGNORE_DUPS
# 以追加的方式写入历史记录
setopt appendhistory
# 使用多个 zsh 时，追加到历史文件而不是替换
setopt INC_APPEND_HISTORY
# 在不同的终端之间共享历史记录
setopt SHARE_HISTORY
# 为历史记录中的命令添加时间戳
setopt EXTENDED_HISTORY

HISTFILE=$HOME/.zhistory    # 记录文件的位置
HISTSIZE=10000              # 历史文件的最大行数
SAVEHIST=10000              # 历史记录的最大行数
HIST_STAMPS="yyyy-mm-dd"    # 历史命令的时间格式

# #############################################################################
# 自动补全
# #############################################################################

# 启用自动补全
autoload -U compinit
compinit
# 隐藏文件的自动补全
_comp_options+=(globdots)
# 加载 complist
zmodload zsh/complist

# 自动补全选项
zstyle ':completion:*:*:default' force-list always
zstyle ':completion:*' select-prompt '%SSelect:  lines: %L  matches: %M  [%p]'
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

# 彩色补全菜单
export ZLSCOLORS=$LS_COLORS
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# 修正大小写
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

# 错误校正
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# 缓存补全
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# 路径补全
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'

# 补全类型提示分组
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
zstyle ':completion:*:corrections' format $'\e[01;32m -- %d (errors: %e) --\e[0m'

# #############################################################################
# 按键绑定
# #############################################################################

# Emacs 绑定风格
bindkey -e

# ctrl + a 行首
# ctrl + b 删除左边所有内容
# ctrl + c 发送 SIGINT 信号
# ctrl + d 结束输入
# ctrl + e 行尾
# ctrl + f 删除右边一个词
# ctrl + g 删除右边所有内容
# ctrl + h 退格
# ctrl + i tab
# ctrl + j 回车（不能修改，不然影响 shift + 回车）
# ctrl + k 删除左边一个词
# ctrl + l 清屏
# ctrl + m 回车
# ctrl + n 下一个历史命令
# ctrl + o 用 vim 编辑命令行
# ctrl + p 上一个历史命令
# ctrl + q 清空当前行并暂存，自动填到下一行
# ctrl + r 向后搜索历史命令
# ctrl + s 向前搜索历史命令
# ctrl + t 输入转义字符（代替 ctrl + v）
# ctrl + u 向左移动一个词
# ctrl + v 输入转义字符
# ctrl + w 向右移动一个词
# ctrl + x 很多功能
# ctrl + y 命令前添加 sudo
# ctrl + z 休眠当前进程

# #############################################################################
# 别名
# #############################################################################

alias ls="ls  -F --color=auto"
alias ll="ls -al"

alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

alias cat="bat"
alias find="fd"
alias grep="rg"
alias szr="source $HOME/.zshrc"

# 在命令行直接输入带有以下后缀的文件，会在 nvim 中打开
alias -s html="nvim"
alias -s css="nvim"
alias -s py="nvim"
alias -s red="nvim"
alias -s sh="nvim"

# 在命令行直接输入带有以下后缀的文件，会自动解压
alias -s gz="tar -xzvf"
alias -s tgz="tar -xzvf"
alias -s zip="unzip"
alias -s bz2="tar -xjvf"

# #############################################################################
# 环境变量
# #############################################################################

# 将 ~/.local/bin 加入 PATH
export PATH=$HOME/.local/bin:$PATH

# #############################################################################
# 扩展
# #############################################################################

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
bindkey ';' autosuggest-accept

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# starship
eval "$(starship init zsh)"

# z.lua
eval "$(lua /usr/share/z.lua/z.lua --init zsh once enhanced)"

# #############################################################################
# 其他
# #############################################################################

# FZF
export FZF_DEFAULT_COMMAND="rg --files"
export FZF_DEFAULT_OPTS="--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

