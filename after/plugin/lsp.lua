local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {
	  'tsserver', 
	  'clangd',
	  'rust_analyzer',
	  'awk_ls',
	  'bashls',
	  'dockerls',
	  'eslint',
	  'gopls',
	  'jsonls',
	  'marksman',
	  'pylsp',
	  'tflint',
	  'yamlls'}, --noqa: E501
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})


