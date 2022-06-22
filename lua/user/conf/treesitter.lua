local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "java", "python", "json", "yaml", "markdown", "go"},

  sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    enable = true, -- `false` will disable the whole extension

    disable = { "c", "rust" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
}
