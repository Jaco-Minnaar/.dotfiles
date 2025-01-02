return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
	opts = {
		defaults = {
			prompt_prefix = "$ ",
			layout_config = { prompt_position = "top" },
			-- winblend = 10,
			mappings = {
				i = {
					["<C-u>"] = false,
					["<C-d>"] = false,
					["<C-t>"] = function(bufnr, opts)
						require("trouble.sources.telescope").open(bufnr, opts)
					end,
				},
				n = {
					["<C-t>"] = function(bufnr, opts)
						require("trouble.sources.telescope").open(bufnr, opts)
					end,
				},
			},
		},
	},
}
