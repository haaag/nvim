-- css lsp
local lsp = require'lspconfig'
local custom_attach = function(client)
    print("CSS LSP started.");
end

lsp.cssls.setup {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = custom_attach
}
