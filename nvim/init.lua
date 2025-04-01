vim.g.loaded_netrw = 1
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
    local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({{"Failed to clone lazy.nvim:\n", "ErrorMsg"}, {out, "WarningMsg"},
                           {"\nPress any key to exit..."}}, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
    spec = {{
        "tiagovla/tokyodark.nvim",
        opts = {},
        config = function(_, opts)
            require("tokyodark").setup(opts)
            vim.cmd [[colorscheme tokyodark]]
        end
    }, {"williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig"}, {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {'nvim-lua/plenary.nvim'}
    }, {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    }, {
        "nvim-tree/nvim-tree.lua",
        dependencies = {"nvim-tree/nvim-web-devicons"}
    }},
    install = {
        colorscheme = {"tokyodark"}
    },
    checker = {
        enabled = true
    }
})

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {"pyright", "clangd", "awk_ls", "bashls", "dockerls", "eslint", "gopls", "jsonls", "marksman",
                        "pylsp", "tflint", "yamlls"}
})

-- Configure LSP servers
local lspconfig = require("lspconfig")

require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive"
    },
    view = {
        width = 30
    },
    renderer = {
        group_empty = true
    },
    filters = {
        dotfiles = true
    }
}, {
    update_focused_file = {
        enable = true
    }
})

require'nvim-web-devicons'.setup {
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
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({
        search = vim.fn.input("Grep > ")
    });
end)
