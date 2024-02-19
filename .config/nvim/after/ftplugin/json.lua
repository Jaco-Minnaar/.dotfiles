vim.opt_local.shiftwidth = 2
vim.cmd([[ 
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
    augroup END 
]])
