-- LSP settings
local lspconfig = require 'lspconfig'
local util = require("lspconfig/util")
local on_attach = function(_, bufnr)
    local opts = {buffer = bufnr}
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
end

-- nvim-cmp supports additional completion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.start({
    name = "protols",
    cmd = {"protols_server"},
    filetypes = {"proto"}
})

-- Enable the following language servers
local servers = {
    'tsserver', 'dockerls', 'eslint', 'angularls', 'html', 'cssls', 'sqlls',
    'pyright', 'zls', 'intelephense', 'astro', 'bufls'
}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {on_attach = on_attach, capabilities = capabilities}
end

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true)
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {enable = false}
        }
    }
}

lspconfig.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {gopls = {analyses = {unusedparams = true}, staticcheck = true}}

})

lspconfig.tailwindcss.setup({
    root_dir = util.root_pattern('tailwind.config.js', 'tailwind.config.ts'),
    on_attach = on_attach,
    capabilities = capabilities
})

-- lspconfig.csharp_ls.setup({
--     handlers = {
--         ["textDocument/definition"] = require('csharpls_extended').handler
--     },
--     cmd = {'csharp-ls'},
--     on_attach = on_attach,
--     capabilities = capabilities
-- })
--
local pid = vim.fn.getpid()

lspconfig.omnisharp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "/home/jaco/code/omnisharp/OmniSharp", "--languageserver", '--hostPID', tostring(pid) },

    handlers = {
        ["textDocument/definition"] = require('omnisharp_extended').handler,
    },

    -- Enables support for reading code style, naming convention and analyzer
    -- settings from .editorconfig.
    enable_editorconfig_support = false,

    -- If true, MSBuild project system will only load projects for files that
    -- were opened in the editor. This setting is useful for big C# codebases
    -- and allows for faster initialization of code navigation features only
    -- for projects that are relevant to code that is being edited. With this
    -- setting enabled OmniSharp may load fewer projects and may thus display
    -- incomplete reference lists for symbols.
    enable_ms_build_load_projects_on_demand = false,

    -- Enables support for roslyn analyzers, code fixes and rulesets.
    enable_roslyn_analyzers = false,

    -- Specifies whether 'using' directives should be grouped and sorted during
    -- document formatting.
    organize_imports_on_format = false,

    -- Enables support for showing unimported types and unimported extension
    -- methods in completion lists. When committed, the appropriate using
    -- directive will be added at the top of the current file. This option can
    -- have a negative impact on initial completion responsiveness,
    -- particularly for the first few completion sessions after opening a
    -- solution.
    enable_import_completion = false,

    -- Specifies whether to include preview versions of the .NET SDK when
    -- determining which version to use for project loading.
    sdk_include_prereleases = true,

    -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
    -- true
    analyze_open_documents_only = false,
})

lspconfig.azure_pipelines_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        yaml = {
            schemas = {
                ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
                  "/azure-pipeline*.y*l",
                  "/*.azure*",
                  "Azure-Pipelines/**/*.y*l",
                  "Pipelines/*.y*l",
              },
            }
        }
    }
})

-- luasnip setup
local luasnip = require 'luasnip'

vim.api.nvim_create_augroup("DadbodCompletion", {clear = true});
vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = {"sql", "mysql", "plsql"},
    callback = function()
        require('cmp').setup.buffer({
            sources = {{name = "vim-dadbod-completion"}}
        })
    end
})

-- vim.cmd [[ autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} }) ]]
-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = {expand = function(args) luasnip.lsp_expand(args.body) end},
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete({}),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        },
        ['<C-j>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<C-k>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'})
    }),
    sources = {
        {name = "nvim_lsp"}, {name = "luasnip"}, {name = "path"},
        {name = "buffer", keyword_length = 5}
    }
}
