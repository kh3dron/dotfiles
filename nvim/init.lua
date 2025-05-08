
vim.g.loaded_netrwPlugin = 1
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {
    noremap = true,
    silent = true
})

vim.opt.nu = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({ { "Failed to clone lazy.nvim:\n", "ErrorMsg" }, { out, "WarningMsg" },
            { "\nPress any key to exit..." } }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({

    spec = { { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" }, {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    }, {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    }, {
        "github/copilot.vim"
    },
        {
            'projekt0n/github-nvim-theme',
            name = 'github-theme',
            lazy = false,    -- make sure we load this during startup if it is your main colorscheme
            priority = 1000, -- make sure to load this before all the other start plugins
            config = function()
                require('github-theme').setup({
                    -- ...
                })

                vim.cmd('colorscheme github_dark')
            end
        }, {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
        {
            "NeogitOrg/neogit",
            dependencies = {
                "nvim-lua/plenary.nvim",  -- required
                "sindrets/diffview.nvim", -- optional - Diff integration
                "nvim-telescope/telescope.nvim"
            },
        }

    },
    checker = {
        enabled = true, notify = false
    }
})

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "clangd", "awk_ls", "bashls", "dockerls", "eslint", "gopls", "jsonls", "marksman",
        "pylsp", "tflint", "yamlls", "tflint", "lua_ls", "taplo" }
})

-- Configure LSP servers
local lspconfig = require("lspconfig")

require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive"
    },
    view = {
        width = 50
    },
    renderer = {
        group_empty = true
    },
}, {
    update_focused_file = {
        enable = true
    }
})

require 'nvim-web-devicons'.setup {
    override = {
	zsh = {
	    icon = "",
	    color = "#428850",
	    cterm_color = "65",
	    name = "Zsh"
	}
    },
    color_icons = true,
    default = true,
    strict = true,
    override_by_filename = {
	[".gitignore"] = {
	    icon = "",
	    color = "#f1502f",
	    name = "Gitignore"
	}
    },
    override_by_extension = {
	["log"] = {
	    icon = "",
	    color = "#81e043",
	    name = "Log"
	}
    },
    override_by_operating_system = {
	["apple"] = {
	    icon = "",
	    color = "#A2AAAD",
	    cterm_color = "248",
	    name = "Apple"
	}
    }
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

local neogit = require('neogit')
vim.keymap.set('n', '<leader>g', neogit.open, {})

vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', {
    noremap = true,
    silent = true
})
vim.cmd [[colorscheme github_dark_default]]
