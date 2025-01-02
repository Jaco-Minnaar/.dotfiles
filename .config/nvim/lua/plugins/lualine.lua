return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	priority = 0,
	opts = {
		options = {
			icons_enabled = true,
			component_separators = "|",
			section_separators = "",
			globalstatus = true,
			theme = "gruvbox",
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff" },
			lualine_c = { "diagnostics", "filename" },
			lualine_x = { { "diagnostics", sources = { "nvim_workspace_diagnostic" } } },
			lualine_y = { "filetype" },
			lualine_z = { "progress" },
		},
		winbar = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		inactive_winbar = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
	},
}
