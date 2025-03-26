local nmap = require("utils").nmap

-- vim.keymap.set('i', 'kj', '<ESC>')
vim.keymap.set({ "n", "v", "i" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "v", "i" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "v", "i" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "v", "i" }, "<Right>", "<Nop>")
nmap({ "tc", ":tabc<CR>" })
nmap({ "tn", ":tabnew<CR>" })

nmap({ "<leader>e", vim.diagnostic.open_float })
nmap({
	"[d",
	function()
		vim.diagnostic.jump({ count = -1, float = true })
	end,
})
nmap({
	"]d",
	function()
		vim.diagnostic.jump({ count = 1, float = true })
	end,
})
nmap({ "<leader>q", vim.diagnostic.setloclist })

vim.keymap.set({ "v" }, "<leader>p", "y'>p")
vim.keymap.set({ "v" }, "<leader>P", "yP")

-- Remap for dealing with word wrap
nmap({ "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true } })
nmap({ "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true } })

-- Nvim Tree
-- nmap({
-- 	"<leader>tt",
-- 	function()
-- 		require("nvim-tree.api").tree.toggle()
-- 	end,
-- })

-- Persistence
nmap({
	"<leader>ps",
	function()
		require("persistence").load()
	end,
})
nmap({
	"<leader>pl",
	function()
		require("persistence").load({ last = true })
	end,
})

-- Trouble
-- local trouble = require("trouble")
-- nmap({
-- 	"<leader>xx",
-- 	function()
-- 		trouble.toggle({
-- 			mode = "diagnostics",
-- 		})
-- 	end,
-- })
--
-- nmap({
-- 	"<leader>dx",
-- 	function()
-- 		trouble.toggle({
-- 			mode = "diagnostics",
-- 			filter = { severity = vim.diagnostic.severity.ERROR },
-- 		})
-- 	end,
-- })
