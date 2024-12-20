return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	opts = {
		auto_close = true,
		focus = true,
		use_diagnostic_signs = true,
		action_keys = {
			close = "q",
			refresh = "r",
			jump = { "<cr>" },
			hover = "K",
			toggle_fold = { "zA", "za" },
			toggle_mode = "m",
			previous = "k",
			next = "j",
		},
	},
}
