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
        lualine_c = {'diagnostics', 'filename'},
        lualine_x = {},
        lualine_y = {'filetype'},
        lualine_z = {'progress'}
    },
    winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    }
}

