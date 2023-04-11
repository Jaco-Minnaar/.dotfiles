require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'astro', 'bash', 'c', 'cpp', 'c_sharp', 'css', 'dockerfile', 'glsl',
        'go', 'html', 'javascript', 'json', 'lua', 'php', 'proto', 'python',
        'rust', 'scss', 'toml', 'tsx', 'typescript', 'vim', 'yaml', 'zig'
    },
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = {"html"}
    },
    rainbow = {enable = true, extended_mode = true, max_file_lines = nil},
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            scope_incremental = 'grc',
            node_decremental = '<BS>'
        }
    },
    indent = {enable = true},
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner'
            }
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer'
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer'
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer'
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer'
            }
        }
    }
}

require("treesitter-context").setup()
