vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)