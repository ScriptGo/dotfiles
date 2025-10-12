-- 绑定格式: vim.keymap.set(模式, 新按键, 原始按键, 选项)
local map = vim.keymap.set
local opts = {
	noremap = true,
	silent = true,
}

-- 禁用方向键
map({ "n", "i", "v" }, "<Left>", "<Nop>", opts)
map({ "n", "i", "v" }, "<Right>", "<Nop>", opts)
map({ "n", "i", "v" }, "<Up>", "<Nop>", opts)
map({ "n", "i", "v" }, "<Down>", "<Nop>", opts)

--[[功能键]]

-- 废弃F1
map({ "n", "i", "v" }, "<F1>", "<ESC>", opts)

--[[插入模式]]

-- 替代 Esc
map("i", "jj", "<ESC>", opts)

-- 快速保存/关闭
map("i", "<C-s>", "<C-o>:w!<CR>", opts)
map("i", "<C-q>", "<ESC>:wq!<CR>", opts)

-- 在当前行的上方/下方插入新行
map("i", "<S-enter>", "<C-o>O", opts)
map("i", "<C-enter>", "<C-o>o", opts)

-- 移动到行首/到行尾
map("i", "<C-a>", "<Home>", opts)
map("i", "<C-e>", "<End>", opts)

-- 向左/右移动
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-l>", "<Right>", opts)

-- 直上/直下移动
map("i", "<C-j>", "<C-\\><C-o>gj", opts)
map("i", "<C-k>", "<C-\\><C-o>gk", opts)

-- 移动行
map("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move down" })
map("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move up" })

-- 快速输入符号
map("i", "uu", "_")
map("i", "hh", "-")
map("i", "ii", "=")
map("i", "kk", "->")
map("i", "jk", "=>")
map("i", "vv", ":=")

-- [[普通模式]]

-- 数字递增/递减
map("n", "<leader>+", "<C-a>", { desc = "Increment number" })
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- 移动行
map("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move up" })

-- 直上直下
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- 匹配跳转
map("n", "<TAB>", "%")

-- 复制与粘贴
map("n", "Y", "y$") -- Yanking to the end of line
map("n", "p", "p`[") -- Paste yank after, keep cursor position
map("n", "P", "P`[") -- Paste yank before, keep cursor position
vim.cmd('nnoremap <leader>p "*p') -- Paste content from OS's clipboard
vim.cmd('vnoremap <leader>y "*y') -- Yank content in OS's clipboard

-- [[可视模式]]
-- 移动行
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move up" })

-- 更好的缩进
map("v", "<", "<gv")
map("v", ">", ">gv")

-- [[窗口]]

-- 窗口管理
map("n", "vp", "<C-w>v", opts) -- 垂直分割窗口
map("n", "hp", "<C-w>s", opts) -- 水平分割窗口
map("n", "we", "<C-w>=", opts) -- 确保分割窗口与原有窗口大小相同
map("n", "wc", "<C-w>c", opts) -- 关闭当前分割窗口

-- 窗口导航
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- 调整窗口
map("n", "<A-Up>", "<cmd>resize +2<CR>", opts)
map("n", "<A-Down>", "<cmd>resize -2<CR>", opts)
map("n", "<A-Left>", "<cmd>vertical resize -2<CR>", opts)
map("n", "<A-Right>", "<cmd>vertical resize +2<CR>", opts)

-- [[终端]]
map("t", "jj", "<C-\\><C-n>", opts)
map("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
map("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
map("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
map("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)

-- [[tabs]]
map("n", "<leader><tab>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Toggle diff buffers
map("n", "<leader>dft", "&diff ? ':windo diffoff<cr>' : ':windo diffthis<cr>'", { expr = true })

-- 交换buffer
map("n", "<leader><leader>", "<C-^>")

-- [[bufferline]]
-- map({ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" })
-- map({ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" })

-- [[nvim-tree]]
map("n", "<F2>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
map("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
map("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

-- [[nvim-surround]]
-- ds : 删除配对符号
-- cs : 修改配对符号
-- ys : 添加配对符号
-- yss : 为整行添加配对符号

-- [[markdown-preview]]

-- [[telescope]]
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
map("n", "<leader>fh", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
map("n", "<leader>fz", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>fg", "<cmd>Telescope git_files<cr>")

-- [[trouble]]
map("n", "<leader>xw", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Open trouble workspace diagnostics" })
map("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Open trouble document diagnostics" })
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Open trouble quickfix list" })
map("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Open trouble location list" })
map("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map("n", "<leader>xr", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP (Trouble)" })
