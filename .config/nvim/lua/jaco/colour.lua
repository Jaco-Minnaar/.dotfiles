vim.o.background = 'dark'
require('gruvbox').setup({
    overrides = {
        DiffAdd = {fg = "#3f4531", bg = "#ebdbb2"},
        DiffDelete = {fg = "#532020", bg = "#ebdbb2"}
    },
    transparent_mode = false
})

vim.cmd.colorscheme "gruvbox"
--
--
--
-- vim.cmd.colorscheme "tokyonight-night"

-- require('catppuccin').setup({
--     integrations = {
--         treesitter_context = true
--     }
-- })
-- vim.cmd.colorscheme "catppuccin-mocha"
