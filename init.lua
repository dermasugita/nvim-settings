require('config.lazy')
require('options')
require('keymaps')

vim.api.nvim_create_autocmd({"VimEnter"}, {
  pattern = {"*"},
  command = [[
    Fern . -drawer
    winc l
    bel term
  ]],
  nested = true,
})

vim.api.nvim_create_autocmd({"TermOpen"}, {
  pattern = {"*"},
  command= "startinsert",
})

vim.api.nvim_create_autocmd({"TermEnter"}, {
  pattern = {"*"},
  once=true,
  command = [[
    horizontal resize 15
  ]]
})
