local set = vim.opt

-- 编码
set.encoding = "utf-8"
set.fileencoding = "utf-8"
set.helplang = "cn,en"
set.fileformats = "unix,dos,mac"

-- 延迟
set.timeout = true
set.timeoutlen = 500
set.ttimeoutlen = 300
set.updatetime = 200

-- leader 键配置
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- UI
set.number = true        -- 显示行号
set.signcolumn = "yes"   -- 显示左侧图标指示列
set.cursorline = true    -- 高亮当前在行
set.colorcolumn = "80"   -- 右侧参考线
set.termguicolors = true -- 启用真彩色
set.title = true
set.showmode = false     -- 使用lualine替代
set.cmdheight = 2        -- 命令行高度
set.showtabline = 2      -- 始终显示标签页
set.conceallevel = 3
set.scrolloff = 5        -- jkhl 移动时光标周围保留5行
set.sidescrolloff = 5
set.equalalways = true
set.winminwidth = 10  -- 窗口最小宽度
set.winblend = 15     -- 浮动窗口透明度
set.cmdheight = 2     -- 命令行高度
set.pumheight = 15    -- 补全显示数目
set.pumblend = 15     -- 弹出菜单透明度
set.splitbelow = true -- 新窗口放到当前窗口下面
set.splitright = true -- 新窗口放到当前窗口右面
set.list = true       -- 不可见字符提示
set.listchars = {
    space = "•",
    tab = "»•",
    nbsp = "+",
    extends = "↷",
    precedes = "↶",
    eol = "⏎",
    trail = "␣",
}

-- 字体
vim.o.guifont = "Fira Code,Sarasa Term SC:h16"

-- 鼠标
set.mouse = "a"                     -- 启用鼠标
set.selectmode = { "mouse", "key" } -- 使用鼠标或按键进行选择
set.selection = "inclusive"         -- 从光标处进行选择
set.mousemodel = "popup"            -- Set the behaviour of mouse
set.mousehide = true                -- 键入时隐藏鼠标光标

-- 缩进
set.shiftwidth = 4     -- 缩进宽度
set.tabstop = 4        -- 一个tab等于4个空格
set.expandtab = true   -- 用空格替代tab
set.softtabstop = 4    -- 软制表符宽度(设置4个空格为制表符)
set.shiftround = true  --
set.smartindent = true -- 智能的选择对齐方式

-- 折叠
set.foldenable = true
set.foldlevel = 99
set.foldlevelstart = 99
set.foldcolumn = "0"
set.fillchars = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    vert = "▕",
    foldsep = "│",
    msgsep = "‾",
    diff = "─",
    eob = " ",
}

-- 格式化
set.wrap = false               -- 禁止折行
set.whichwrap = "b,s,<,>,[,]"  -- 行结尾可以跳到下一行
set.formatoptions = "ljcroqnt" -- 格式化选项
set.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }

-- 文本编辑
set.ignorecase = true         -- 搜索时忽略大小写
set.smartcase = true          -- 智能搜索大小写判断，默认忽略大小写，除非搜索内容包含大写字母
set.gdefault = true           -- 替换时，缺省启用g标志，即同一行里的所有匹配都会被替换
set.wrapscan = false          -- 禁止在搜索到文件两端时重新搜索
set.inccommand = "nosplit"
set.clipboard = "unnamedplus" -- 剪贴板
set.confirm = true            -- 在处理未保存或只读文件的时候，弹出确认
set.autowrite = true          -- 自动保存文件
set.autochdir = true          -- 自动切换当前目录为当前文件所在的目录
set.backup = false            -- 禁止创建备份文件
set.writebackup = false
set.swapfile = false          -- 禁止生成swap文件
set.undofile = true           -- 撤销操作
set.undolevels = 10000

-- 补全
set.wildmode = "longest:full,full"
set.completeopt = { "menu", "menuone", "noselect", "noinsert" }
set.shortmess:append("WIcC")

-- 关闭vim内置插件
vim.g.loaded_matchparen = 1
vim.g.loaded_matchit = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_remote_plugins = 1

-- Disable node provider
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- 文件微调
local mygroup = vim.api.nvim_create_augroup("MyGroup", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = mygroup,
    pattern = "qf",
    callback = function()
        vim.opt_local.number = false
    end,
})

-- 其他
vim.g.python3_host_prog = "/usr/bin/python"
-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
set.grepprg = "rg --vimgrep --no-heading --smart-case"
set.grepformat = "%f:%l:%c:%m,%f:%l:%m"
