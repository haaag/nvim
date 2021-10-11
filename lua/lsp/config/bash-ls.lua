--- Bash lsp simple config
--------------------------

local lsp = require 'lspconfig'

local custom_attach = function(client)
    print("Bash LSP started");
end

lsp.bashls.setup{
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach=custom_attach
}
