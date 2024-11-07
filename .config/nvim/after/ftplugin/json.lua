vim.opt_local.shiftwidth = 2

-- local conform = require("conform")
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     pattern = "*.json",
--     callback = function(args)
--         print("formatting")
--         conform.format({ bufnr = args.buf }, function(err, did_edit)
--             if err ~= nil then
--                 local info = conform.get_formatter_info("prettierd", args.buf)
--                 print("name: " .. info.name)
--                 print("available: " .. tostring(info.available))
--                 if info.available_msg ~= nil then
--                     print("msg: " .. info.available_msg)
--                 end
--                 print("error: " .. err)
--             end
--         end)
--     end,
-- })
