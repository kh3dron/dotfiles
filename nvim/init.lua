-- Core options and keymaps
require('plugins.options')

-- Plugin specs
local plugins = {
    require('plugins.avante'),
    require('plugins.mason'),
    require('plugins.telescope'),
    require('plugins.treesitter'),
    require('plugins.colors'),
    require('plugins.neotree'),
    require('plugins.neogit'),
    require('plugins.devicons'),
    require('plugins.foldsign'),
    require('plugins.copilot'),
    require('plugins.comment'),
}

require('plugins.keymaps')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({{"Failed to clone lazy.nvim:\n", "ErrorMsg"}, {out, "WarningMsg"},
                           {"\nPress any key to exit..."}}, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require 'nvim-web-devicons'

require("lazy").setup(plugins, {
    checker = {
        enabled = true,
        notify = false
    }
})
vim.cmd.colorscheme('tokyonight')
