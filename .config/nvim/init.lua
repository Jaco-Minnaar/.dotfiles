-- Install packer
vim.g.mapleader = " "
vim.g.maplocalleader = " "
--
require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.autocmds")
require("lsp")
require("jaco.dap")
require("jaco.neovide")

require("impatient")

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
