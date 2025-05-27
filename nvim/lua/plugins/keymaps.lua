local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

vim.api.nvim_set_keymap('n', '<leader><Esc>', 'wqa', {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', {
    noremap = true,
    silent = true
})
