return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			javascript = { "prettierd" },
			json = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			html = { "prettierd" },
			htmlangular = { "prettierd" },
			lua = { "stylua" },
			python = { "ruff_format" },
			rust = { "rustfmt" },
		},
		format_on_save = {
			timeout_ms = 500,
		},
	},
}
