--- LSP simple config
---------------------
local custom_attach = function(client)
    print("Vim-ls LSP started.");
end

local lsp = require 'lspconfig'
lsp.vimls.setup{
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach=custom_attach
}
