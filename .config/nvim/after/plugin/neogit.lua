local nmap = require("jaco.keymap").nmap
local neogit = require('neogit')

neogit.setup({integrations = {diffview = true}})

nmap {'<leader>gs', function() neogit.open() end}
