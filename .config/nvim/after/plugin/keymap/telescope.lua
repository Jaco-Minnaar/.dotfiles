local nmap = require("jaco.keymap").nmap

nmap {'<leader><space>', require('telescope.builtin').buffers}
nmap {'<leader>sf', function() require('telescope.builtin').find_files {} end}
nmap {
    '<leader>sg',
    function() require('telescope.builtin').git_files {hidden = true} end
}
nmap {
    '<C-_>', function()
        require('telescope.builtin').current_buffer_fuzzy_find {
            sorting_strategy = 'ascending'
        }
    end
}
nmap {'<leader>sj', require('telescope.builtin').jumplist}
nmap {'<leader>sh', require('telescope.builtin').help_tags}
nmap {'<leader>st', require('telescope.builtin').tags}
nmap {'<leader>sd', require('telescope.builtin').grep_string}
nmap {'<leader>sp', require('telescope.builtin').live_grep}
nmap {
    '<leader>so',
    function() require('telescope.builtin').tags {only_current_buffer = true} end
}
nmap {'<leader>?', require('telescope.builtin').oldfiles}
