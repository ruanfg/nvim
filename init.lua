require('init-packer')
require('init-lsp')

-- material theme config
vim.g.material_style = "darker"
require('material').setup({
    disable = {
        background = true
    },
    lualine_style = 'stealth'
})
vim.cmd 'colorscheme material'

-- setup lualine theme config
require('lualine').setup {
    options = { theme = 'material' }
}

-- snippet to enable the language server
require('lspconfig').pyright.setup{}

vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.termguicolors = true
vim.o.cursorline = true
vim.g.mapleader = ' '
