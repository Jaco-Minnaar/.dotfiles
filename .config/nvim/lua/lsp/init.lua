local common = require("lsp.common")
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

-- Enable the following language servers
local servers = {
	"ts_ls",
	"dockerls",
	"eslint",
	"angularls",
	"html",
	"cssls",
	"sqlls",
	"zls",
	"intelephense",
	"astro",
	"csharpierls",
	"ruff",
	"asm_lsp",
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

-- luasnip setup
local luasnip = require("luasnip")

vim.api.nvim_create_augroup("DadbodCompletion", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "sql", "mysql", "plsql" },
	callback = function()
		require("cmp").setup.buffer({
			sources = { { name = "vim-dadbod-completion" } },
		})
	end,
})

-- vim.cmd [[ autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} }) ]]
-- nvim-cmp setup
local lspkind = require("lspkind")
local cmp = require("cmp")
cmp.setup({
	view = {
		entries = "custom",
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete({}),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<C-j>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-k>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "lazydev" },
		{ name = "buffer", keyword_length = 5 },
	},
	formatting = {
		format = lspkind.cmp_format({ mode = "text_symbol" }),
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})
