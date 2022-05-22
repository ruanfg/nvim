local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path
  })
end

-- Autocommand that reloads neovim whenever you save the pluagins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

return require('packer').startup(function()
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- My plugins here
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "akinsho/toggleterm.nvim"
  use "kyazdani42/nvim-tree.lua" -- File Explorer
  use "goolord/alpha-nvim"
  use "kyazdani42/nvim-web-devicons"
  use "folke/which-key.nvim" -- which  key

  -- Enhance Editor
  use 'windwp/nvim-autopairs'

  -- Github Theme
  use 'marko-cerovac/material.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig' -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- cmp plugins
  use 'hrsh7th/nvim-cmp' -- The completion plugin

  -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp'

  -- Snippets source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip'

  -- Snippets plugin
  use 'L3MON4D3/LuaSnip'

  -- Tabline
  use {
      'akinsho/bufferline.nvim',
      tag = "*",
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require("bufferline").setup{} end
  }

  -- Statusline
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- git signs
  use {
      'lewis6991/gitsigns.nvim',
      config = function() require('gitsigns').setup() end
  }

  -- markdown preview
  -- use 'iamcco/markdown-preview.nvim'
  use {
      'iamcco/markdown-preview.nvim',
      run = function() vim.fn['mkdp#util#install']() end,
      ft = {'markdown'}
  }

  -- Treesitter
  use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
  }

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use "ahmedkhalf/project.nvim"
  use "nvim-telescope/telescope-live-grep-raw.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
