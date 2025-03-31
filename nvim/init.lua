-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        {
            "tiagovla/tokyodark.nvim",
            opts = {
                -- custom options here
            },
            config = function(_, opts)
                require("tokyodark").setup(opts) -- calling setup is optional
                vim.cmd [[colorscheme tokyodark]]
            end,
        },
        {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        },
        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.8',
            dependencies = { 'nvim-lua/plenary.nvim' }
        },
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate"
        },
        {
            "nvim-tree/nvim-tree.lua",
            dependencies = { "nvim-tree/nvim-web-devicons" },
        },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "tokyodark" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})

-- Configure LSP
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "pyright", -- Python LSP
        "clangd",
        "awk_ls",
        "bashls",
        "dockerls",
        "eslint",
        "gopls",
        "jsonls",
        "marksman",
        "pylsp",
        "tflint",
        "yamlls",
    }
})

-- Configure LSP servers
local lspconfig = require("lspconfig")

-- Configure NvimTree
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
})

-- NvimTree keybindings
local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    -- Default mappings
    api.config.mappings.default_on_attach(bufnr)
end

require("nvim-tree").setup({
    on_attach = on_attach,
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
})

-- Open NvimTree automatically on startup
local function open_nvim_tree()
    require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- Python LSP configuration
lspconfig.pyright.setup({
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                inlayHints = true,
            },
            formatting = {
                provider = "black",
                indentSize = 4,
            },
        },
    },
})
