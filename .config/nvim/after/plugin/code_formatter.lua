local util = require('formatter.util')

require('formatter').setup({
    filetype = {
        cs = {
            function()
                return {
                    exe = "dotnet",
                    args = {"csharpier"},
                    stdin = true
                }
            end
        },
    }
})
