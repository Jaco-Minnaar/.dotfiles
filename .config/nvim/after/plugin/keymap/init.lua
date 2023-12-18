local nmap = require("jaco.keymap").nmap

-- vim.keymap.set('i', 'kj', '<ESC>')
vim.keymap.set({'n', 'v', 'i'}, '<Up>', '<Nop>')
vim.keymap.set({'n', 'v', 'i'}, '<Down>', '<Nop>')
vim.keymap.set({'n', 'v', 'i'}, '<Left>', '<Nop>')
vim.keymap.set({'n', 'v', 'i'}, '<Right>', '<Nop>')
nmap {'tc', ':tabc<CR>'}
nmap {'tn', ':tabnew<CR>'}

nmap {'<leader>e', vim.diagnostic.open_float}
nmap {'[d', vim.diagnostic.goto_prev}
nmap {']d', vim.diagnostic.goto_next}
nmap {'<leader>q', vim.diagnostic.setloclist}

vim.keymap.set({'v'}, '<leader>p', "y'>p")
vim.keymap.set({'v'}, '<leader>P', "yP")

-- Remap for dealing with word wrap
nmap {'k', "v:count == 0 ? 'gk' : 'k'", {expr = true, silent = true}}
nmap {'j', "v:count == 0 ? 'gj' : 'j'", {expr = true, silent = true}}
