local util = require('formatter.util')

require('formatter').setup({
    filetype = {
        javascript = {
            require('formatter.filetypes.javascript').prettierd
        },
        javascriptreact = {
            require('formatter.filetypes.javascriptreact').prettierd
        },
        typescript = {
            require('formatter.filetypes.typescript').prettierd
        },
        typescriptreact = {
            require('formatter.filetypes.typescriptreact').prettierd
        },
        json = {
            require('formatter.filetypes.json').prettierd
        },
        dart = {
            function(t)
                t = t or {}

                local args = { "--output show", "--line-length 120" }

                return {
                    exe = "dart format",
                    args = args,
                    stdin = true,
                }
            end
        }
    }
})
