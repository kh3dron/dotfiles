return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require('telescope')
        telescope.setup {
            pickers = {
                find_files = {
                    hidden = true
                },
                live_grep = {
                    additional_args = function(opts)
                        return {"--hidden"}
                    end
                },
            }
        }
    end
}
