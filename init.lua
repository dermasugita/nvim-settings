require('config.lazy')
require('options')
require('keymaps')

vim.api.nvim_create_autocmd({"VimEnter"}, {
  pattern = {"*"},
  callback = function()
    setTerminal()
    vim.cmd('winc k')
    vim.cmd('Fern . -drawer')
    vim.api.nvim_feedkeys('jj', 'm', false)
  end,
  nested = true,
})

vim.cmd("language en_US")

vim.api.nvim_create_autocmd({"TermEnter"}, {
  pattern = {"*"},
  once=true,
  command = [[
    horizontal resize 15
  ]]
})
