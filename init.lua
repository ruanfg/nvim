require('user.plugins')
require('user.keymaps')

require('user.conf')
require('user.lsp')
require('user.lsp.init-lsp')

-- material theme config
vim.g.material_style = "darker"
require('material').setup({
--    disable = {
--        background = true
--    },
    lualine_style = 'stealth'
})
vim.cmd 'colorscheme material'

-- setup lualine theme config
require('lualine').setup {
    options = { theme = 'material' }
}

-- snippet to enable the language server
require('lspconfig').pyright.setup{}

-- markdown config
-- vim.g.mkdp_auto_start = true
-- vim.g.mkdp_echo_preview_url = true
vim.g.mkdp_browser = '/usr/bin/chromium'
vim.g.mkdp_page_title = '「${name}」'
vim.g.mkdp_markdown_css = '/home/ryan/Software/markdown-theme/DrakeTyporaTheme-master/drake-juejin.css'

