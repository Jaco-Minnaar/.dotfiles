return {
	"max397574/better-escape.nvim",
	lazy = false,
	config = function()
		require("better_escape").setup({
			default_mappings = false,
			mappings = {
				i = {
					k = {
						j = "<Esc>",
					},
				},
			},
		})
	end,
}
