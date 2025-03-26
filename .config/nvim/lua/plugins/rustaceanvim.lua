local function dump(o)
	if type(o) == "table" then
		local s = "{ "
		for k, v in pairs(o) do
			if type(k) ~= "number" then
				k = '"' .. k .. '"'
			end
			s = s .. "[" .. k .. "] = " .. dump(v) .. ","
		end
		return s .. "} "
	else
		return tostring(o)
	end
end

return {
	"mrcjkb/rustaceanvim",
	version = "^5", -- Recommended
	ft = "rust",
	init = function()
		local on_attach = function(client, bufnr)
			local opts = { buffer = bufnr }
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", function()
				vim.cmd.RustLsp({ "hover", "actions" })
			end, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
			vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
			vim.keymap.set("n", "<leader>wl", function()
				vim.inspect(vim.lsp.buf.list_workspace_folders())
			end, opts)
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<leader>ca", function()
				vim.cmd.RustLsp("codeAction")
			end, opts)
			vim.keymap.set("n", "<leader>m", function()
				vim.cmd.RustLsp("expandMacro")
			end, opts)
			vim.keymap.set("n", "<leader>e", function()
				vim.cmd.RustLsp({ "renderDiagnostic", "current" })
			end, opts)
			-- vim.keymap.set("n", "<leader>so", require("telescope.builtin").lsp_document_symbols, opts)

			vim.lsp.inlay_hint.enable()
		end

		-- nvim-cmp supports additional completion capabilities
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		vim.g.rustaceanvim = {
			server = {
				capabilities = capabilities,
				on_attach = on_attach,
				default_settings = {
					-- rust-analyzer language server configuration
					["rust-analyzer"] = {
						imports = {
							granularity = {
								group = "module",
							},
							prefix = "self",
						},
						completion = {
							postfix = {
								enable = true,
							},
							fullFunctionSignatures = {
								enable = true,
							},
						},
						cargo = {
							buildScripts = {
								enable = true,
							},
						},
						procMacro = {
							enable = true,
						},
					},
				},
			},
		}
	end,
}
