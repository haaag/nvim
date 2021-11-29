--- LSP simple config
---------------------
local custom_attach = function(client)
    print("TsServer LSP started.");
end

local lsp = require 'lspconfig'
require'lspconfig'.eslint.setup{}
lsp.tsserver.setup{
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach=custom_attach
}
