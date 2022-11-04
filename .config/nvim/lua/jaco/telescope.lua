local telescope = require('telescope')

-- Telescope
telescope.setup {
    defaults = {
        prompt_prefix = '$ ',
        layout_config = {prompt_position = 'top'},
        -- winblend = 10,
        mappings = {i = {['<C-u>'] = false, ['<C-d>'] = false}}
    },
    extensions = {file_browser = {respect_gitignore = false}}
}

telescope.load_extension("file_browser")
telescope.load_extension 'fzf'
