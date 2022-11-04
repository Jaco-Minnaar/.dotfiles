require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = "gruvbox",
        component_separators = '|',
        section_separators = '',
        globalstatus = true
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {'diagnostics'},
        lualine_z = {'progress'}
    }
}
