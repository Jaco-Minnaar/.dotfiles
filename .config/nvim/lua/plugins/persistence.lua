return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	lazy = false,
	opts = { dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/") },
}
