vim.opt_local.shiftwidth = 4

vim.cmd([[ 
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
    augroup END 
]])
