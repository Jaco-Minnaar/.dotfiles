local telescope = require('telescope')
local trouble = require('trouble.providers.telescope')

-- Telescope
telescope.setup {
    defaults = {
        prompt_prefix = '$ ',
        layout_config = {prompt_position = 'top'},
        -- winblend = 10,
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
                ['<C-t>'] = trouble.open_with_trouble
            },
            n = {['<C-t>'] = trouble.open_with_trouble}
        }
    }
}

telescope.load_extension 'fzf'
