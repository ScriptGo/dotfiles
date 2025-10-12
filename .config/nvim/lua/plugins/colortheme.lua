return {
	"navarasu/onedark.nvim",
	"luisiacc/gruvbox-baby",
	{
		"sainnhe/gruvbox-material",
		config = function()
			vim.cmd([[colorscheme onedark]])
			require("lualine").setup({
				options = {
					theme = "onedark",
					style = "darker",
				},
			})
		end,
	},
}
