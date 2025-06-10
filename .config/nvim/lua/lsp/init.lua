local common = require("lsp.common")

local function bordered_hover(err, result, ctx, config)
	print("here!")
	if not result or not result.contents then
		return
	end
	config = vim.tbl_deep_extend("force", { border = "rounded" }, config or {})

	local md_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)

	if vim.tbl_isempty(md_lines) then
		return
	end

	return vim.lsp.util.open_floating_preview(md_lines, "markdown", config)
end

-- Enable the following language servers
local servers = {
	"asm_lsp",
	"astro",
	{
		"clangd",
		{
			on_attach = common.on_attach,
			capabilities = common.capabilities,
			filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
		},
	},
	{
		"csharpierls",
		{
			cmd = { "csharpier-ls", "-m", "stdio" },
			filetypes = { "cs" },
			root_markers = { ".sln", ".git/" },
		},
	},
	"cssls",
	"dockerls",
	"eslint",
	"glsl_analyzer",
	{
		"gopls",
		{
			on_attach = common.on_attach,
			capabilities = common.capabilities,
			cmd = { "gopls", "serve" },
			filetypes = { "go", "gomod" },
			root_markers = { "go.work", "go.mod", ".git/" },
			settings = { gopls = { analyses = { unusedparams = true }, staticcheck = true } },
		},
	},
	{
		"graphql",
		{
			on_attach = common.on_attach,
			capabilities = common.capabilities,
			filetypes = { "graphql", "typescriptreact", "javascriptreact", "typescript", "javascript" },
		},
	},
	"html",
	"intelephense",
	"jdtls",
	"lua_ls",
	{ "omnisharp", require("lsp.omnisharp").config },
	"pyright",
	"ruff",
	"sqlls",
	{
		"tailwindcss",
		{
			root_markers = { "tailwind.config.js", "tailwind.config.ts" },
			on_attach = common.on_attach,
			capabilities = common.capabilities,
		},
	},
	"ts_ls",
	"zls",
}

vim.diagnostic.config({ virtual_lines = { current_line = true } })

for _, lsp in ipairs(servers) do
	local name = ""
	if type(lsp) == "table" then
		vim.lsp.config(lsp[1], lsp[2])
		name = lsp[1]
	else
		vim.lsp.config(lsp, {
			on_attach = common.on_attach,
			capabilities = common.capabilities,
		})
		name = lsp
	end

	vim.lsp.enable(name)
end
