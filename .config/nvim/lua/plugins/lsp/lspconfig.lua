return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim" },
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- 为所有服务器定义通用的 capabilities
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		-- 为 lua_ls 配置特殊设置
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					-- 让语言服务器识别 "vim" 全局变量
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})

		-- 为其他通过 mason 安装的服务器配置通用设置
		-- mason-lspconfig v2.0+ 不再需要 setup_handlers，
		-- 它会配合 lspconfig 自动启用已安装的服务器。
		-- 如果你想为其他特定服务器添加更多配置，请使用类似上面的 vim.lsp.config() 格式
		-- 例如：
		-- vim.lsp.config("pyright", { capabilities = capabilities })

		-- 启用 LSP 服务的自动安装和启动
		require("mason-lspconfig").setup()

		-- 为所有 LSP 服务附加事件创建自动命令
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
			callback = function(ev)
				local keymap = vim.keymap -- 简化

				-- 为当前缓冲区设置按键映射
				local opts = { buffer = ev.buf, silent = true }

				-- 定义按键映射
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		-- 更改诊断符号
		local signs = { Error = " ", Warn = " ", Hint = "   ", Info = " " }
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = signs.Error,
					[vim.diagnostic.severity.WARN] = signs.Warn,
					[vim.diagnostic.severity.HINT] = signs.Hint,
					[vim.diagnostic.severity.INFO] = signs.Info,
				},
			},
		})
	end,
}
