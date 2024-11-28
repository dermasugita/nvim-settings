vim.opt.encoding='utf-8'
vim.opt.syntax = 'enable'

-- autoindent
vim.opt.shiftwidth = 2

-- set row number and relative number
vim.opt.number = true
vim.opt.relativenumber = true

-- Copy register value to the clipboard
vim.opt.clipboard:append({"unnamedplus"})

-- Ignore to copy register on hitting 'x'
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true })

-- For Japanese Characters
vim.opt.ambiwidth = "single"
