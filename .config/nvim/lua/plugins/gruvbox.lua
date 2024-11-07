return {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		overrides = {
			DiffAdd = { bg = "#3f4531", fg = "#ebdbb2" },
			DiffDelete = { bg = "#532020", fg = "#ebdbb2" },
			DiffText = { bg = "#d79921", fg = "#ebdbb2" },
			DiffChange = { bg = "#d65d0e", fg = "#ebdbb2" },
		},
		transparent_mode = true,
	},
	config = function()
		vim.o.background = "dark"
		vim.cmd.colorscheme("gruvbox")
	end,
	enabled = false,
}
