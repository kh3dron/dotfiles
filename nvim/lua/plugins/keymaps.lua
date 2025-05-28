local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

vim.api.nvim_set_keymap('n', '<leader><Esc>', 'wqa', {
    noremap = true,
    silent = true
})

-- Option + Backspace in insert mode to delete from cursor to start of previous word
vim.keymap.set('i', '<M-BS>', '<C-w>', {})
