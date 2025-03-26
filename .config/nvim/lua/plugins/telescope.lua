return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
	opts = {
		defaults = {
			sorting_strategy = "ascending",
			prompt_prefix = "$ ",
			layout_config = { prompt_position = "top" },
			path_display = { "smart" },
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
	keys = {
		{
			"<leader><space>",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>sf",
			function()
				require("telescope.builtin").find_files({})
			end,
			desc = "Find files",
		},
		{
			"<leader>ss",
			function()
				require("telescope.builtin").lsp_document_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>sh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>sp",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Grep",
		},
	},
	enabled = true,
}

-- Telescope keymaps
-- nmap({ "<leader><space>", require("telescope.builtin").buffers })
-- nmap({
-- 	"<leader>sf",
-- 	function()
-- 		require("telescope.builtin").find_files({})
-- 	end,
-- })
-- nmap({
-- 	"<leader>sg",
-- 	function()
-- 		require("telescope.builtin").git_files({ hidden = true })
-- 	end,
-- })
-- nmap({
-- 	"<C-_>",
-- 	function()
-- 		require("telescope.builtin").current_buffer_fuzzy_find({
-- 			sorting_strategy = "ascending",
-- 		})
-- 	end,
-- })
-- nmap({ "<leader>sj", require("telescope.builtin").jumplist })
-- nmap({ "<leader>sh", require("telescope.builtin").help_tags })
-- nmap({ "<leader>st", require("telescope.builtin").tags })
-- nmap({ "<leader>sd", require("telescope.builtin").grep_string })
-- nmap({ "<leader>sp", require("telescope.builtin").live_grep })
-- nmap({
-- 	"<leader>so",
-- 	function()
-- 		require("telescope.builtin").tags({ only_current_buffer = true })
-- 	end,
-- })
-- nmap({ "<leader>?", require("telescope.builtin").oldfiles })
