require('nvim-tree').setup({
    view = {
        float = {
            enable = true,
            quit_on_focus_loss = true,
            open_win_config = function()
                local win_width = vim.api.nvim_win_get_width(0)
                local win_height = vim.api.nvim_win_get_height(0)
                local x_padding = math.floor(win_width * 0.25)
                local y_padding = math.floor(win_height * 0.15)

                local width = win_width - (x_padding * 2)
                local height = win_height - (y_padding * 2)

                return {
                    width = width,
                    height = height,
                    relative = 'editor',
                    border = 'rounded',
                    row = y_padding,
                    col = x_padding
                }
            end
        }
    }
})

local nt_api = require('nvim-tree.api')

vim.keymap.set('n', '<leader>tt', function() nt_api.tree.toggle() end)
