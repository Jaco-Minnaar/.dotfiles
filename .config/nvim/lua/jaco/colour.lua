vim.o.background = 'dark'
require('gruvbox').setup({
    overrides = {
        DiffAdd = {fg = "#3f4531", bg = "#ebdbb2"},
        DiffDelete = {fg = "#532020", bg = "#ebdbb2"}
    }
})

vim.cmd.colorscheme "gruvbox"
