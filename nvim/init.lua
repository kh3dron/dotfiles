-- Core options and keymaps
require('plugins.options')

-- Plugin specs
local plugins = {
    require('plugins.avante'),
    require('plugins.mason'),
    require('plugins.telescope'),
    require('plugins.treesitter'),
    require('plugins.github-theme'),
    require('plugins.neotree'),
    require('plugins.neogit'),
    require('plugins.devicons'),
    {"github/copilot.vim"}
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

require("lazy").setup(plugins, {
    checker = {
        enabled = true,
        notify = false
    }
})

