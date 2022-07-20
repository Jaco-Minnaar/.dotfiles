-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end


local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd(
    'BufWritePost',
    {
        command = 'source <afile> | PackerCompile',
        group = packer_group,
        pattern = 'init.lua'
    }
)

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Package manager

    -- Utilities
    use 'tpope/vim-fugitive' -- git plugin
    use 'tpope/vim-surround' -- plugin for dealing with apostrophes and stuff
    use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
    use 'windwp/nvim-autopairs'
    use {'folke/trouble.nvim', requires = "kyazdani42/nvim-web-devicons"}
    use {'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim'}
    use 'wakatime/vim-wakatime'
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

    -- VimWiki
    use 'vimwiki/vimwiki'

    -- Telescope
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- UI Stuff
    use 'nvim-lualine/lualine.nvim' -- Fancier statusline
    use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
    use 'kyazdani42/nvim-web-devicons'
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- Add git related info in the signs columns and popups
    use 'mjlbach/onedark.nvim' -- Theme inspired by Atom
    use 'luisiacc/gruvbox-baby' -- Gruvbox theme
    use 'sainnhe/gruvbox-material'
    use 'onsails/lspkind-nvim'


    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- Completions
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'

    -- Snippets
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'saadparwaiz1/cmp_luasnip'

    -- Tabnine
    use { 'tzachar/cmp-tabnine',  run = './install.sh' }

    -- Prettier
    use {'prettier/vim-prettier', run = 'npm install'}


    -- Language Specific Stuff

    -- Rust
    use 'simrat39/rust-tools.nvim'
    use 'rust-lang/rust.vim'

    -- PHP
    use 'phpactor/phpactor'

    -- Kitty Config
    use 'fladson/vim-kitty'

    -- SQL
    use "tpope/vim-dadbod"
    use { "kristijanhusak/vim-dadbod-completion" }
    use { "kristijanhusak/vim-dadbod-ui" }

    -- HTML
    use 'mattn/emmet-vim'

    -- Zig
    use "ziglang/zig.vim"
end)

--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

--Enable mouse mode
vim.o.mouse = 'n'

--Enable break indent
vim.o.breakindent = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.swapfile = false
-- vim.o.guicursor = false
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

vim.o.wrap = false
vim.wo.wrap = false
-- vim.opt.nowrap = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'
vim.wo.colorcolumn = '80'

--Set colorscheme
vim.o.termguicolors = true
vim.g.gruvbox_baby_function_style = 'bold'
vim.g.gruvbox_baby_keyword_style = 'italic'
-- vim.g.gruvbox_baby_telescope_theme = 1
vim.g.gruvbox_baby_background_color = 'dark'

vim.cmd [[ colorscheme gruvbox-baby ]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.cmd [[ let g:rustfmt_autosave = 1 ]]

vim.keymap.set('i', 'kj', '<ESC>')
vim.keymap.set({'n', 'v', 'i'}, '<Up>', '<Nop>')
vim.keymap.set({'n', 'v', 'i'}, '<Down>', '<Nop>')
vim.keymap.set({'n', 'v', 'i'}, '<Left>', '<Nop>')
vim.keymap.set({'n', 'v', 'i'}, '<Right>', '<Nop>')

--Set statusbar
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = "gruvbox-baby",
        component_separators = '|',
        section_separators = '',
        globalstatus = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {'filename'},
        lualine_x = {'filetype'},
        lualine_y = {'diagnostics'},
        lualine_z = {'progress'}
    }
}

--Enable Comment.nvim
require('Comment').setup()

--Remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Indent blankline
require('indent_blankline').setup {
    char = '┊',
    show_trailing_blankline_indent = false
}

-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- Telescope
require('telescope').setup {
  defaults = {
    prompt_prefix = '$ ',
    layout_config = {
        -- prompt_position = 'top'
    },
    -- winblend = 10,
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native
require('telescope').load_extension 'fzf'

--Add leader shortcuts
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>sf', function()
  require('telescope.builtin').find_files {  }
end)
vim.keymap.set('n', '<leader>sg', function()
  require('telescope.builtin').git_files { hidden=true }
end)
vim.keymap.set('n', '<C-_>', function()
    require('telescope.builtin').current_buffer_fuzzy_find { sorting_strategy='ascending'}
end)
vim.keymap.set('n', '<leader>sj', require('telescope.builtin').jumplist)
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>st', require('telescope.builtin').tags)
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').grep_string)
vim.keymap.set('n', '<leader>sp', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>so', function()
  require('telescope.builtin').tags { only_current_buffer = true }
end)
vim.keymap.set('n' , '<leader>b', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles)


-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'bash', 'c','cpp', 'c_sharp',  'css', 'dockerfile', 'glsl', 'go', 'html', 'json', 'lua', 'php', 'python', 'rust', 'scss', 'tsx', 'typescript', 'vim', 'yaml', 'zig' },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "html" }
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      scope_incremental = 'grc',
      node_decremental = '<BS>',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)


-- LSP settings
local lspconfig = require 'lspconfig'
local util = require("lspconfig/util")
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wl', function()
    vim.inspect(vim.lsp.buf.list_workspace_folders())
  end, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)
  vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable the following language servers
local servers = { 'tsserver', 'csharp_ls', 'clangd', 'dockerls', 'eslint', 'angularls', 'html', 'tailwindcss', 'cssls', 'sqlls', 'pyright', 'zls'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- rust-tools setup
require("rust-tools").setup({
  server = {
    on_attach = on_attach,
    capabilities = capabilities
  }
})

lspconfig.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    rootdir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
	gopls = {
	    analyses = {
		unusedparams = true
	    },
	    staticcheck = true
	}
    }

})

lspconfig.phpactor.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    ["language_server_phpstan.enabled"] = false,
    ["language_server_psalm.enabled"] = false,
  }
}


-- luasnip setup
local luasnip = require 'luasnip'

vim.cmd [[ autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} }) ]]
-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<C-j>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-k>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = "nvim_lsp"},
    { name = "luasnip" },
    { name = "path" },
    { name = "buffer" , keyword_length = 5},
  },
}

local npairs = require('nvim-autopairs')
npairs.setup{
    enable_check_bracket_line = false,
    check_ts = true,
    ts_config = {
        typescript = {'template_string', 'string'},
        rust = {'string'},
        php = {'string'}
    },
    ignored_next_char = "[%w%.]"
}

require('todo-comments').setup {}
require('trouble').setup {}
require('neogit').setup {}


-- local dap = require('dap')
-- vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
-- vim.keymap.set('n', '<leader>dc', dap.continue)
-- vim.keymap.set('n', '<leader>di', dap.step_into)
-- vim.keymap.set('n', '<leader>do', dap.step_over)
-- vim.keymap.set('n', '<leader>dro', dap.repl.open)

