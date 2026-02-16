require('nvim-treesitter.configs').setup {
  ensure_installed = {"lua", "markdown", "javascript", "typescript", "json", "prisma"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
