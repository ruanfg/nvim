return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Github Theme
  -- use "projekt0n/github-nvim-theme"
  use 'marko-cerovac/material.nvim'

  -- Collection of configurations for built-in LSP client
  use 'neovim/nvim-lspconfig' 

  -- Autocompletion plugin
  use 'hrsh7th/nvim-cmp' 

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
      config = function() require'nvim-tree'.setup {
          auto_close = true
      } end
  }

  -- Tabline
  use {
      'akinsho/bufferline.nvim', 
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

end)
