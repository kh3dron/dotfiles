vim.g.loaded_netrwPlugin = 1
vim.opt.nu = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Enable system clipboard integration
vim.opt.clipboard = "unnamedplus"

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
