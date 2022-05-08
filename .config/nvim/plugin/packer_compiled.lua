-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/jaco/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/jaco/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/jaco/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/jaco/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/jaco/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-tabnine"] = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/cmp-tabnine",
    url = "https://github.com/tzachar/cmp-tabnine"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox-baby"] = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/gruvbox-baby",
    url = "https://github.com/luisiacc/gruvbox-baby"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/mjlbach/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  phpactor = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/phpactor",
    url = "https://github.com/phpactor/phpactor"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/rust.vim",
    url = "https://github.com/rust-lang/rust.vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-gutentags"] = {
    config = { "\27LJ\2\n¾\b\0\0\4\0\19\0-6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0006\0\0\0009\0\1\0006\1\0\0009\1\b\0019\1\t\1'\3\n\0B\1\2\2=\1\a\0006\0\0\0009\0\1\0+\1\2\0=\1\v\0006\0\0\0009\0\1\0+\1\2\0=\1\f\0006\0\0\0009\0\1\0+\1\2\0=\1\r\0006\0\0\0009\0\1\0+\1\2\0=\1\14\0006\0\0\0009\0\15\0'\2\16\0B\0\2\0016\0\0\0009\0\1\0005\1\18\0=\1\17\0K\0\1\0\1\3\0\0\23--tag-relative=yes\21--fields=+ailmnS\31gutentags_ctags_extra_args\\command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')\bcmd'gutentags_generate_on_empty_buffer gutentags_generate_on_write\"gutentags_generate_on_missing\30gutentags_generate_on_new\25~/.cache/nvim/ctags/\vexpand\afn\24gutentags_cache_dir\1\3\0\0\17package.json\t.git\27gutentags_project_root(gutentags_add_default_project_roots\1>\0\0\n*.git\n*.svg\t*.hg\14*/tests/*\nbuild\tdist\21*sites/*/files/*\bbin\17node_modules\21bower_components\ncache\rcompiled\tdocs\fexample\vbundle\vvendor\t*.md\16*-lock.json\v*.lock\16*bundle*.js\15*build*.js\n.*rc*\v*.json\f*.min.*\n*.map\n*.bak\n*.zip\n*.pyc\f*.class\n*.sln\r*.Master\r*.csproj\n*.tmp\18*.csproj.user\f*.cache\n*.pdb\ntags*\rcscope.*\n*.exe\n*.dll\n*.mp3\n*.ogg\v*.flac\n*.swp\n*.swo\n*.bmp\n*.gif\n*.ico\n*.jpg\n*.png\n*.rar\n*.zip\n*.tar\r*.tar.gz\r*.tar.xz\14*.tar.bz2\n*.pdf\n*.doc\v*.docx\n*.ppt\v*.pptx\28gutentags_ctags_exclude\6g\bvim\0" },
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/vim-gutentags",
    url = "https://github.com/ludovicchabant/vim-gutentags"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/jaco/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: vim-gutentags
time([[Config for vim-gutentags]], true)
try_loadstring("\27LJ\2\n¾\b\0\0\4\0\19\0-6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0006\0\0\0009\0\1\0006\1\0\0009\1\b\0019\1\t\1'\3\n\0B\1\2\2=\1\a\0006\0\0\0009\0\1\0+\1\2\0=\1\v\0006\0\0\0009\0\1\0+\1\2\0=\1\f\0006\0\0\0009\0\1\0+\1\2\0=\1\r\0006\0\0\0009\0\1\0+\1\2\0=\1\14\0006\0\0\0009\0\15\0'\2\16\0B\0\2\0016\0\0\0009\0\1\0005\1\18\0=\1\17\0K\0\1\0\1\3\0\0\23--tag-relative=yes\21--fields=+ailmnS\31gutentags_ctags_extra_args\\command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')\bcmd'gutentags_generate_on_empty_buffer gutentags_generate_on_write\"gutentags_generate_on_missing\30gutentags_generate_on_new\25~/.cache/nvim/ctags/\vexpand\afn\24gutentags_cache_dir\1\3\0\0\17package.json\t.git\27gutentags_project_root(gutentags_add_default_project_roots\1>\0\0\n*.git\n*.svg\t*.hg\14*/tests/*\nbuild\tdist\21*sites/*/files/*\bbin\17node_modules\21bower_components\ncache\rcompiled\tdocs\fexample\vbundle\vvendor\t*.md\16*-lock.json\v*.lock\16*bundle*.js\15*build*.js\n.*rc*\v*.json\f*.min.*\n*.map\n*.bak\n*.zip\n*.pyc\f*.class\n*.sln\r*.Master\r*.csproj\n*.tmp\18*.csproj.user\f*.cache\n*.pdb\ntags*\rcscope.*\n*.exe\n*.dll\n*.mp3\n*.ogg\v*.flac\n*.swp\n*.swo\n*.bmp\n*.gif\n*.ico\n*.jpg\n*.png\n*.rar\n*.zip\n*.tar\r*.tar.gz\r*.tar.xz\14*.tar.bz2\n*.pdf\n*.doc\v*.docx\n*.ppt\v*.pptx\28gutentags_ctags_exclude\6g\bvim\0", "config", "vim-gutentags")
time([[Config for vim-gutentags]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
