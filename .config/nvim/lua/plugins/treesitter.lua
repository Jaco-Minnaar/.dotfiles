return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"asm",
				"angular",
				"astro",
				"bash",
				"c",
				"cpp",
                "cmake",
				"c_sharp",
				"css",
				"dart",
				"dockerfile",
				"glsl",
				"go",
				"graphql",
				"html",
				"hyprlang",
                "java",
				"javascript",
				"json",
				"kdl",
				"lua",
				"markdown",
				"nix",
                "nu",
				"php",
				"prisma",
				"proto",
				"python",
				"regex",
				"ron",
				"rust",
				"scss",
				"sql",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"xml",
				"yaml",
				"zig",
			},
			highlight = {
				enable = true, -- false will disable the whole extension
				disable = { "html" },
			},
			rainbow = { enable = true, extended_mode = true, max_file_lines = nil },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "<CR>",
					scope_incremental = "grc",
					node_decremental = "<BS>",
				},
			},
			indent = {
				enable = true,
				disable = { "dart" },
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
					},
				},
			},
		})
	end,
}
