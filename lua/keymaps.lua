-- Map <leader> to ,
vim.g.mapleader = "\\"
-- Map jj to <ESC>
vim.keymap.set('i', 'jj', '<ESC>')


-- Terminal Window Change

-- <Option-n>
vim.keymap.set('t', '<leader>j', '<C-\\><C-n>')

-- <Leader>g
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  direction = "float",
  hidden=true,
})
function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

