return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	config = function()
		local colorizer = require("colorizer")
		colorizer.setup({
			filetypes = {
				"css",
				"javascript",
				html = { mode = "foreground" },
			},
        options = {
            parsers = {
                css = true,  -- preset: enables names, hex, rgb, hsl, oklch, css_var
                tailwind = { enable = true },
            },
            display = {
                mode = "virtualtext",
                virtualtext = { position = "after" },
            },
        },
		})
	end,
}
