-- Map <leader> to ,
vim.g.mapleader = "\\"
-- Map jj to <ESC>
vim.keymap.set('i', 'jj', '<ESC>')

-- Map <c-h> to 1<c-w>w
vim.keymap.set('n', '<C-h>', '1<C-w>w')


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

-- Code action of Lspsaga
vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>")

-- Jump to definition of Lspsaga
vim.keymap.set("n", "gs", "<cmd>Lspsaga goto_definition<CR>")

vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "-", "<cmd>Oil<CR>")
vim.keymap.set("n", "<leader>t", "<cmd>Neotree toggle<CR>")
-- DiffView
vim.keymap.set("n", "<leader>hd", "<cmd>DiffviewOpen origin/main...HEAD<CR>")
