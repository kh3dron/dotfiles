local M = {}

-- Move between splits using Ctrl + h/l
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

M.packer = require('khedron.packer')
M.remap = require('khedron.remap')
M.set = require('khedron.set')

return M