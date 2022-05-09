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
  use 'wbthomason/packer.nvim'

  -- Enhance Editor
  use 'windwp/nvim-autopairs'

  -- Github Theme
  use 'marko-cerovac/material.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig' -- enable LSP

  -- cmp plugins
  use 'hrsh7th/nvim-cmp' -- The completion plugin 

  -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp' 

  -- Snippets source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' 

  -- Snippets plugin
  use 'L3MON4D3/LuaSnip' 

  -- A File Explorer For Neovim Written In Lua
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
      config = function() require'nvim-tree'.setup {} end
  }

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
      requires = {
          'nvim-lua/plenary.nvim'
      },
      config = function() require('gitsigns').setup() end
  }

  -- markdown preview
  -- use 'iamcco/markdown-preview.nvim'
  use {
      'iamcco/markdown-preview.nvim',
      run = function() vim.fn['mkdp#util#install']() end,
      ft = {'markdown'}
  }
  
  use {"akinsho/toggleterm.nvim"}

  -- Treesitter
  use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
  }
  
  -- Telescope
  use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
