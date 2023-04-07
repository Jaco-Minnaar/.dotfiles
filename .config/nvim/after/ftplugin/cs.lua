vim.opt.colorcolumn = '120'

local nmap = require("jaco.keymap").nmap

nmap { "<leader>f", "<cmd>FormatWrite<cr>" }
