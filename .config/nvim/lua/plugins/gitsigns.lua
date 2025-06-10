return {
	"lewis6991/gitsigns.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		numhl = false,
		current_line_blame = true,
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map_key(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			map_key({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
			map_key({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
			map_key("n", "<leader>hp", gs.preview_hunk)
			map_key("n", "<leader>hd", gs.diffthis)
		end,
	},
}
