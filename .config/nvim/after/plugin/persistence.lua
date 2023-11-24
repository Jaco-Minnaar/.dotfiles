local nmap = require("jaco.keymap").nmap

nmap { '<leader>ps', function() require('persistence').load() end }
nmap { '<leader>pl', function() require('persistence').load({ last = true }) end }
