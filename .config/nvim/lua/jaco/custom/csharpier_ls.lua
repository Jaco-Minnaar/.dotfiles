local bufs = {};

local function start_lsp(bufnr)
    local capabilities = require('cmp_nvim_lsp').default_capabilities();

    local client_id = vim.lsp.start_client({
        name = "csharpier_ls",
        cmd = function(dispatchers)
            return vim.lsp.rpc.connect('127.0.0.1', 50051)(dispatchers)
        end,
        capabilities = capabilities,
        trace = 'verbose',
    })

    return client_id
end

local lsp_id = nil
vim.keymap.set('n', '<leader>cs', function ()
    if lsp_id ~= nil then
        vim.lsp.stop_client(lsp_id, true)
    end
    lsp_id = start_lsp()
end)

local setup = function ()
    local bufnr = vim.api.nvim_get_current_buf()

    if lsp_id == nil then
        lsp_id = start_lsp(bufnr)
    end

    if lsp_id ~= nil then
        vim.lsp.buf_attach_client(bufnr, lsp_id)
    end
end

return {
    setup = setup
}
