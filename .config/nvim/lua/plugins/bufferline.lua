return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					mappings = true,
					close_command = "bdelete! %d",
					right_mouse_command = "bdelete! %d",
					left_mouse_command = "buffer %d",
					middle_mouse_command = nil,
					indicator_icon = "", -- 分割线
					buffer_close_icon = "󰅖",
					modified_icon = "●",
					close_icon = "",
					left_trunc_marker = "",
					right_trunc_marker = "",
					max_name_length = 18,
					max_prefix_length = 15,
					tab_size = 18,
					offsets = {
						{
							filetype = "NvimTree",
							text = "  File Explorer",
							text_align = "left",
						},
					},
					show_buffer_icons = true,
					show_buffer_close_icons = true,
					show_close_icon = false,
					show_tab_indicators = true,
					persist_buffer_sort = true,
					separator_style = "blank",
					enforce_regular_tabs = false,
					always_show_bufferline = true,
					sort_by = "extension",
				},
			})
		end,
	},
}
