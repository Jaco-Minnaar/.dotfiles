require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = "tokyonight",
        component_separators = '|',
        section_separators = '',
        globalstatus = true
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {'diagnostics', 'filename'},
        lualine_x = {},
        lualine_y = {'filetype'},
        lualine_z = {'progress'}
    }
}
