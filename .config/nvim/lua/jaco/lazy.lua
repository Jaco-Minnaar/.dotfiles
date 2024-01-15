local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    'jmederosalvarado/roslyn.nvim',
    'lewis6991/impatient.nvim', -- Utilities
    {'numToStr/Comment.nvim', lazy = true}, -- "gc" to comment visual regions/lines
    {
        'folke/trouble.nvim',
        lazy = true,
        dependencies = {"nvim-tree/nvim-web-devicons"}
    }, {
        'folke/todo-comments.nvim',
        lazy = true,
        dependencies = {'nvim-lua/plenary.nvim'}
    }, {
        'TimUntersberger/neogit',
        lazy = true,
        dependencies = {'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim'}
    }, {
        'nvim-tree/nvim-tree.lua',
        lazy = true,
        dependencies = {'nvim-tree/nvim-web-devicons'},
        tag = "nightly"
    }, -- Debugging
    {'mfussenegger/nvim-dap', lazy = true},
    {
        "rcarriga/nvim-dap-ui",
        lazy = true,
        dependencies = {"mfussenegger/nvim-dap"}
    }, -- VimWiki
    'vimwiki/vimwiki', -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        lazy = true,
        dependencies = {'nvim-lua/plenary.nvim'}
    }, {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    {'nvim-lualine/lualine.nvim', lazy = true}, -- Fancier statusline
    {'lukas-reineke/indent-blankline.nvim', main = "ibl", lazy = true}, -- Add indentation guides even on blank lines
    {'folke/persistence.nvim', event = "BufReadPre", lazy = false, opts = {dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/")}},
    {'nvim-tree/nvim-web-devicons', lazy = true}, {
        'lewis6991/gitsigns.nvim',
        lazy = true,
        dependencies = {'nvim-lua/plenary.nvim'}
    }, -- Add git related info in the signs columns and popups
    {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup({mapping = {"kj"}})
        end
    },
    {
        'ellisonleao/gruvbox.nvim',
        lazy = false,
        priority = 1000,
    }, 'folke/tokyonight.nvim', -- Treesitter
    {"catppuccin/nvim", name = "catppuccin", priority = 1000},
    {'nvim-treesitter/nvim-treesitter', lazy = true, build = ':TSUpdate'},
    {'nvim-treesitter/nvim-treesitter-textobjects', lazy = true},
    {'nvim-treesitter/nvim-treesitter-context', lazy = true}, -- LSP
    {'Jaco-Minnaar/nvim-lspconfig', lazy = true},
    {
        'hrsh7th/nvim-cmp',
        dependencies = { -- Autocompletion plugin
            'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-nvim-lsp', 'onsails/lspkind.nvim'
        }
    }, -- Snippets
    {
        'L3MON4D3/LuaSnip',
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	    -- install jsregexp (optional!).
	    build = "make install_jsregexp"
    }, -- Snippets plugin
    'saadparwaiz1/cmp_luasnip', -- Language Specific Stuff
    -- Rust
    {'simrat39/rust-tools.nvim', lazy = true}, 'rust-lang/rust.vim',
    {'Decodetalkers/csharpls-extended-lsp.nvim', lazy = true}, -- Flutter
    {'Hoffs/omnisharp-extended-lsp.nvim', lazy = true},
    {
        'akinsho/flutter-tools.nvim',
        lazy = true,
        dependencies = {'nvim-lua/plenary.nvim'}
    }, -- Kitty Config
    'fladson/vim-kitty', -- SQL
    "tpope/vim-dadbod", "kristijanhusak/vim-dadbod-completion",
    "kristijanhusak/vim-dadbod-ui", -- HTML
    'mattn/emmet-vim', -- Zig
    "ziglang/zig.vim", "github/copilot.vim",
    {'mhartington/formatter.nvim', lazy = true},
    'wakatime/vim-wakatime',
    "lewis6991/hover.nvim",
})
