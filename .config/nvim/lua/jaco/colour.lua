vim.o.background = 'dark'
require('gruvbox').setup({
    overrides = {
        DiffAdd = {fg = "#3f4531", bg = "#ebdbb2"},
        DiffDelete = {fg = "#532020", bg = "#ebdbb2"}
    },
    transparent_mode = true
})

vim.cmd.colorscheme "gruvbox"
