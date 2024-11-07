return {
	"lewis6991/hover.nvim",
	opts = {
		init = function()
			require("hover.providers.lsp")
			require("hover.providers.man")
		end,
		preview_opts = { border = "single" },
		preview_window = true,
		title = true,
	},
	keys = {
		{
			"K",
			function()
				local hover_win = vim.b.hover_preview
				if hover_win and vim.api.nvim_win_is_valid(hover_win) then
					vim.api.nvim_set_current_win(hover_win)
				else
					require("hover").hover()
				end
			end,
			desc = "hover.nvim",
		},
	},
	enabled = false,
}
