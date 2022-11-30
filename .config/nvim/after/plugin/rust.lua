local rt = require("rust-tools")
local util = require("lspconfig/util")
local on_attach = function(_, bufnr)
    local opts = {buffer = bufnr}
    local dap = require("dap")
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
        vim.inspect(vim.lsp.buf.list_workspace_folders())
    end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>so',
                   require('telescope.builtin').lsp_document_symbols, opts)
    vim.api.nvim_create_user_command("Format", vim.lsp.buf.format, {})

    vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, opts)

    vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group,
                   opts)

    vim.keymap.set("n", "<leader>cb", dap.toggle_breakpoint)
    vim.keymap.set("n", "<leader><F1>", dap.step_back)
    vim.keymap.set("n", "<leader><F2>", dap.step_into)
    vim.keymap.set("n", "<leader><F3>", dap.step_over)
    vim.keymap.set("n", "<leader><F4>", dap.step_out)
    vim.keymap.set("n", "<leader><F5>", dap.continue)
    vim.keymap.set("n", "<leader><F8>", dap.continue)
end

local extension_path = vim.env.HOME ..
                           '/.vscode/extensions/vadimcn.vscode-lldb-1.8.1'
local codelldb_path = extension_path .. 'adaptor/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

-- nvim-cmp supports additional completion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- rust-tools setup
rt.setup({
    server = {on_attach = on_attach, capabilities = capabilities},
    dap = {
        adaptor = require('rust-tools.dap').get_codelldb_adapter(codelldb_path,
                                                                 liblldb_path)
    }
})
