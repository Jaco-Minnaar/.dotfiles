local function start_lsp()
    local bufnr = vim.api.nvim_get_current_buf()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local client_id = vim.lsp.start_client({
        name = "protols",
        cmd = function(dispatchers)
            return vim.lsp.rpc.connect('127.0.0.1', 50051)(dispatchers)
        end,
        capabilities = capabilities,
        trace = 'verbose',
        on_attach = function(_, bufnrr)
            local opts = {buffer = bufnrr}
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder,
                           opts)
            vim.keymap.set('n', '<leader>wr',
                           vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set('n', '<leader>wl', function()
                vim.inspect(vim.lsp.buf.list_workspace_folders())
            end, opts)
            vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', '<leader>so',
                           require('telescope.builtin').lsp_document_symbols,
                           opts)
            vim.api.nvim_create_user_command("Format", vim.lsp.buf.format, {})
        end
    })

    vim.lsp.buf_attach_client(bufnr, client_id)

    return client_id;
end

local lsp_id = start_lsp();

vim.keymap.set('n', '<leader>rs', function()
    vim.lsp.stop_client(lsp_id, true)
    lsp_id = start_lsp()
end)
