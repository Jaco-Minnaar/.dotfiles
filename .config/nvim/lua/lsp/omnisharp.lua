local M = {}

local common = require("lsp.common")

local cs_hover = function(err, result, ctx, config)
	if not result or not result.contents then
		return
	end

	config = vim.tbl_extend("force", { border = "rounded" }, config or {})

	local md_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)

	if vim.tbl_isempty(md_lines) then
		return
	end

	return vim.lsp.util.open_floating_preview(md_lines, "markdown", config)
end

M.config = {
	on_attach = common.on_attach,
	capabilities = common.capabilities,
	cmd = { "/home/jaco/code/omnisharp-new/OmniSharp", "--languageserver" },
	handlers = {
		["textDocument/definition"] = require("omnisharp_extended").handler,
		["textDocument/hover"] = cs_hover,
	},
	settings = {
		FormattingOptions = {
			-- Enables support for reading code style, naming convention and analyzer
			-- settings from .editorconfig.
			EnableEditorConfigSupport = false,
			-- Specifies whether 'using' directives should be grouped and sorted during
			-- document formatting.
			OrganizeImports = nil,
		},
		MsBuild = {
			-- If true, MSBuild project system will only load projects for files that
			-- were opened in the editor. This setting is useful for big C# codebases
			-- and allows for faster initialization of code navigation features only
			-- for projects that are relevant to code that is being edited. With this
			-- setting enabled OmniSharp may load fewer projects and may thus display
			-- incomplete reference lists for symbols.
			LoadProjectsOnDemand = nil,
		},
		RoslynExtensionsOptions = {
			-- Enables support for roslyn analyzers, code fixes and rulesets.
			EnableAnalyzersSupport = nil,
			-- Enables support for showing unimported types and unimported extension
			-- methods in completion lists. When committed, the appropriate using
			-- directive will be added at the top of the current file. This option can
			-- have a negative impact on initial completion responsiveness,
			-- particularly for the first few completion sessions after opening a
			-- solution.
			EnableImportCompletion = true,
			-- Only run analyzers against open files when 'enableRoslynAnalyzers' is
			-- true
			AnalyzeOpenDocumentsOnly = nil,
		},
		Sdk = {
			-- Specifies whether to include preview versions of the .NET SDK when
			-- determining which version to use for project loading.
			IncludePrereleases = true,
		},
	},
}
return M
