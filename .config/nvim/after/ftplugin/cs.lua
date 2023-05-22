vim.opt.colorcolumn = '120'

vim.keymap.set({"n", "v"},  "<leader>f", "<cmd>FormatWrite<cr>" )

vim.cmd([[ 
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
    augroup END 
]])


