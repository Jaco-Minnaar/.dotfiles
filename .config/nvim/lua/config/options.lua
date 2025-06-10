-- Set highlight on search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = "n"

-- Enable break indent
vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.scrolloff = 8

vim.opt.swapfile = false

vim.opt.wrap = false

-- Save undo history
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undo"

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 80

vim.opt.signcolumn = "yes:2"
vim.opt.numberwidth = 6
vim.opt.colorcolumn = "100"
vim.opt.cursorline = true

-- Set colorscheme
vim.opt.termguicolors = true
vim.opt.completeopt = "menuone,noselect"
vim.opt.splitbelow = true

vim.opt.modeline = true
