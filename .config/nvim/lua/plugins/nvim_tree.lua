return {
	"nvim-tree/nvim-tree.lua",
	lazy = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	tag = "nightly",
	keys = {
		{
			"<leader>tt",
			function()
				require("nvim-tree.api").tree.toggle()
			end,
		},
	},
	opts = {
		respect_buf_cwd = true,
		reload_on_bufenter = true,
		hijack_cursor = true,
		update_focused_file = {
			enable = true,
		},
		view = {
			float = {
				enable = true,
				quit_on_focus_loss = true,
				open_win_config = function()
					local win_width = vim.api.nvim_win_get_width(0)
					local win_height = vim.api.nvim_win_get_height(0)
					local x_padding = math.floor(win_width * 0.25)
					local y_padding = math.floor(win_height * 0.15)

					local width = win_width - (x_padding * 2)
					local height = win_height - (y_padding * 2)

					return {
						width = width,
						height = height,
						relative = "editor",
						border = "rounded",
						row = y_padding,
						col = x_padding,
					}
				end,
			},
			-- width = 30,
		},
		renderer = {
			highlight_git = true,
			highlight_opened_files = "name",
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			icons = {
				error = " ",
				warning = " ",
				hint = " ",
				info = " ",
			},
			severity = {
				min = vim.diagnostic.severity.ERROR,
				max = vim.diagnostic.severity.ERROR,
			},
		},
		git = { enable = true },
	},
	enabled = true,
}
