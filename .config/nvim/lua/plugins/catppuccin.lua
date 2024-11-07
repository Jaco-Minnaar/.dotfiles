return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "mocha",
		integrations = {
			treesitter_context = true,
			indent_blankline = {
				enabled = true,
				scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
				colored_indent_levels = false,
			},
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
				inlay_hints = {
					background = true,
				},
			},
			lsp_trouble = true,
		},
	},
	config = function()
		vim.cmd.colorscheme("catppuccin")
	end,
	enabled = false,
}
