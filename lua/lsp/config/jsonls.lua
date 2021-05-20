--- Json lsp simple config
---------------------
local custom_attach = function(client)
    print("Json LSP started.");
end
local lsp = require 'lspconfig'

lsp.jsonls.setup{on_attach=custom_attach}
