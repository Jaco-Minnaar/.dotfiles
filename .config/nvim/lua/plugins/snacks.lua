return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	dependencies = { "echasnovski/mini.icons", "nvim-tree/nvim-web-devicons" },
	opts = {
		picker = {},
		explorer = {},
	},
	keys = {
		{
			"<leader><space>",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>sf",
			function()
				Snacks.picker.files()
			end,
			desc = "Find files",
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>sD",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>sh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
	},
	enabled = false,
}
