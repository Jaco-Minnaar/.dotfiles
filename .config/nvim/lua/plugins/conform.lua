return {
	"stevearc/conform.nvim",
	opts = {
		formatters = {
			ruff_format = {
				args = {
					"format",
					"--preview",
					"--force-exclude",
					"--stdin-filename",
					"$FILENAME",
					"-",
				},
			},
		},
		formatters_by_ft = {
			javascript = { "prettierd" },
			json = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			html = { "prettierd" },
			htmlangular = { "prettierd" },
			scss = { "prettierd" },
			lua = { "stylua" },
			python = { "ruff_format", "ruff_organize_imports" },
			rust = { "rustfmt" },
			c = { "clang-format" },
			go = { "gofmt" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
	enabled = true,
}
