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


    vim.keymap.set("n", "<leader>cb", dap.toggle_breakpoint)
    vim.keymap.set("n", "<leader><F1>", dap.step_back)
    vim.keymap.set("n", "<leader>i", dap.step_into)
    vim.keymap.set("n", "<leader>v", dap.step_over)
    vim.keymap.set("n", "<leader>u", dap.step_out)
    vim.keymap.set("n", "<leader>c", dap.continue)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- flutter tools setup
require("flutter-tools").setup({
    decorations = {
        statusline = {
            device = true
        }
    },
    debugger = {
        enabled = true,
        run_via_dap = true
    },
    flutter_path = "/home/jaco/fvm/default/bin/flutter",
    widget_guides = {
        enabled = true
    },
    lsp = {
        on_attach = on_attach,
        capabilities = capabilities
    }
})
