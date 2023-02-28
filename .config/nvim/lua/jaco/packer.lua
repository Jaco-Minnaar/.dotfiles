local packer_group = vim.api.nvim_create_augroup('Packer', {clear = true})
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | PackerCompile',
    group = packer_group,
    pattern = 'init.lua'
})

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Package manager

    use 'lewis6991/impatient.nvim'

    -- Utilities
    use 'tpope/vim-surround' -- plugin for dealing with apostrophes and stuff
    use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
    use 'windwp/nvim-autopairs'
    use {'folke/trouble.nvim', requires = "kyazdani42/nvim-web-devicons"}
    use {'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim'}
    use {
        'TimUntersberger/neogit',
        requires = {'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim'}
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {'nvim-tree/nvim-web-devicons'},
        tag = "nightly"
    }

    -- Debugging
    use 'mfussenegger/nvim-dap'
    use {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}

    -- VimWiki
    use 'vimwiki/vimwiki'

    -- Telescope
    use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    use {'nvim-telescope/telescope-file-browser.nvim'}

    -- UI Stuff
    use 'nvim-lualine/lualine.nvim' -- Fancier statusline
    use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
    use 'kyazdani42/nvim-web-devicons'
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}} -- Add git related info in the signs columns and popups
    use 'mjlbach/onedark.nvim' -- Theme inspired by Atom
    use 'luisiacc/gruvbox-baby' -- Gruvbox theme
    use 'sainnhe/gruvbox-material'
    use 'ellisonleao/gruvbox.nvim'
    use 'onsails/lspkind-nvim'

    use {"catppuccin/nvim", as = "catppuccin"}
    use 'folke/tokyonight.nvim'

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/nvim-treesitter-context'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use {'jose-elias-alvarez/null-ls.nvim', require = {'nvim-lua/plenary.nvim'}}

    -- Completions
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'

    -- Snippets
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'saadparwaiz1/cmp_luasnip'

    -- Language Specific Stuff

    -- Rust
    use 'simrat39/rust-tools.nvim'
    use 'rust-lang/rust.vim'

    -- Kitty Config
    use 'fladson/vim-kitty'

    -- SQL
    use "tpope/vim-dadbod"
    use {"kristijanhusak/vim-dadbod-completion"}
    use {"kristijanhusak/vim-dadbod-ui"}

    -- HTML
    use 'mattn/emmet-vim'

    -- Zig
    use "ziglang/zig.vim"
end)
