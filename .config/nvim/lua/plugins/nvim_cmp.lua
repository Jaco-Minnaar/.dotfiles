return {
	"hrsh7th/nvim-cmp",
	dependencies = { -- Autocompletion plugin
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"onsails/lspkind.nvim",
		"tailwind-tools",
	},
	opts = {},
	config = function()
		require("cmp").setup({
			view = {
				entries = "custom",
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = require("cmp").mapping.preset.insert({
				["<C-d>"] = require("cmp").mapping.scroll_docs(-4),
				["<C-f>"] = require("cmp").mapping.scroll_docs(4),
				["<C-Space>"] = require("cmp").mapping.complete({}),
				["<CR>"] = require("cmp").mapping(function(fallback)
					local cmp = require("cmp")
					if cmp.visible() then
						cmp.confirm({
							behavior = cmp.ConfirmBehavior.Replace,
							select = true,
						})
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-j>"] = require("cmp").mapping(function(fallback)
					local cmp = require("cmp")
					local luasnip = require("luasnip")
					if cmp.visible() then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-k>"] = require("cmp").mapping(function(fallback)
					local cmp = require("cmp")
					local luasnip = require("luasnip")
					if cmp.visible() then
						cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = {
				{ name = "nvim_lsp", priority = 1000 }, -- Give LSP highest priority
				{ name = "luasnip", priority = 750 },
				{ name = "path", priority = 500 },
				{ name = "lazydev", priority = 250 },
				{ name = "buffer", keyword_length = 5, priority = 100 },
			},
			formatting = {
				format = require("lspkind").cmp_format({
					mode = "text_symbol", -- Changed to symbol_text for better visibility
					maxwidth = 50,
					ellipsis_char = "...",
					show_labelDetails = true,
					before = require("tailwind-tools.cmp").lspkind_format,
				}),
				fields = { "kind", "abbr", "menu" },
				expandable_indicator = true,
			},
			window = {
				completion = require("cmp").config.window.bordered(),
				documentation = require("cmp").config.window.bordered(),
			},
			experimental = {
				ghost_text = true, -- This can help show parameter hints
			},
		})
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities.textDocument.completion.completionItem.preselectSupport = true
		capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
		capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
		capabilities.textDocument.completion.completionItem.deprecatedSupport = true
		capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
		capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
		capabilities.textDocument.completion.completionItem.resolveSupport = {
			properties = {
				"documentation",
				"detail",
				"additionalTextEdits",
			},
		}
	end,
}
