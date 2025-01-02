return {
	"loctvl842/monokai-pro.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	opts = {
		filter = "spectrum",
		devicons = true,
	},
	init = function()
		vim.cmd.colorscheme("monokai-pro")
	end,
	enabled = false,
}
