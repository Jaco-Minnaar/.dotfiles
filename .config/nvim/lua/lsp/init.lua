local common = require("lsp.common")
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

-- Enable the following language servers
local servers = {
	"asm_lsp",
	"astro",
	"csharpierls",
	"cssls",
	"dockerls",
	"eslint",
	"html",
	"intelephense",
	"ruff",
	"sqlls",
	"ts_ls",
	"zls",
}
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({ on_attach = common.on_attach, capabilities = common.capabilities })
end

lspconfig.lua_ls.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
})

lspconfig.gopls.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = { gopls = { analyses = { unusedparams = true }, staticcheck = true } },
})

lspconfig.tailwindcss.setup({
	root_dir = util.root_pattern("tailwind.config.js", "tailwind.config.ts"),
	on_attach = common.on_attach,
	capabilities = common.capabilities,
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

-- require("roslyn").setup({
--     dotnet_cmd = "dotnet", -- this is the default
--     roslyn_version = "4.8.0-3.23475.7", -- this is the default
--     on_attach = on_attach, -- required
--     capabilities = capabilities, -- required
-- })

-- lspconfig.azure_pipelines_ls.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--     settings = {
--         yaml = {
--             schemas = {
--                 ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
--                   "/azure-pipeline*.y*l",
--                   "/*.azure*",
--                   "Azure-Pipelines/**/*.y*l",
--                   "Pipelines/*.y*l",
--               },
--             }
--         }
--     }
-- })

lspconfig.pyright.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
})

lspconfig.graphql.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	filetypes = { "graphql", "typescriptreact", "javascriptreact", "typescript", "javascript" },
})

lspconfig.clangd.setup({
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})

require("lsp.omnisharp").setup()
