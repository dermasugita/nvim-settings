require('utils')
function setTerminal()
  vim.cmd('1ToggleTerm')
  vim.cmd('horizontal resize 15')
  vim.cmd('startinsert')
end

function showTerminal()
  vim.cmd('10winc h')
  local bufname = vim.api.nvim_buf_get_name(0)
  if string.startswith(bufname, 'fern') then
    vim.cmd('q')
    setTerminal()
    vim.cmd('winc k')
    vim.cmd('Fern . -drawer')
    vim.cmd('winc l')
    vim.cmd('winc j')
  end
end


function termRows(rowCount)
  if (vim.bo.buftype == 'terminal') then
    vim.cmd('horizontal resize ' .. rowCount.args)
  else
    print("Use in Terminal-Normal mode")
  end
end

vim.api.nvim_create_user_command(
  'Term',
  showTerminal,
  {}
)
vim.api.nvim_create_user_command(
'TR',
  termRows,
  {
    nargs = 1,
  }
)
