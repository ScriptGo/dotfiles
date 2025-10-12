return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				bash = { "shellcheck", "shfmt" },
				json = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
			shfmt = {
				inherit = false,
				command = "shfmt",
				args = { "-i", "2", "-filename", "$FILENAME" },
			},
		})
	end,
}
