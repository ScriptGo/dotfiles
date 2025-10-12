return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify.config").setup({
			background_colour = "#1a1a1a",
		})
		vim.notify = require("notify")
		vim.cmd([[
      highlight NotifyBackground guibg=#1a1a1a
    ]])
	end,
}
