require("jaco.packer")
require("jaco.options")
require("jaco.colour")
require("jaco.telescope")

require("impatient")

local signs = {Error = " ", Warn = " ", Hint = " ", Info = " "}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end

local highlight_group = vim.api.nvim_create_augroup('YankHighlight',
                                                    {clear = true})
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
    group = highlight_group,
    pattern = '*'
})

vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', {silent = true})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.cmd [[ let g:rustfmt_autosave = 1 ]]
