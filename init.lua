require('config.lazy')
require('options')
require('keymaps')
require('userCommands')
require('utils')
require('masonConfig')
require('lualine').setup {extensions = {'fern'}}

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

vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = {'*'},
  callback = function()
    local bufname = vim.api.nvim_buf_get_name(0)
    if (string.startswith(bufname, 'fern')) then
      require('lualine').hide()
    end
  end,
  nested = true,
})
vim.api.nvim_create_autocmd({"BufLeave"}, {
  pattern = {'*'},
  callback = function()
    local bufname = vim.api.nvim_buf_get_name(0)
    if (string.startswith(bufname, 'fern')) then
      require('lualine').hide({unhide=true})
    end
  end,
  nested = true,
})
