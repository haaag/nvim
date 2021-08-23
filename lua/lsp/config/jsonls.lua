--- Json lsp simple config
---------------------
local custom_attach = function(client)
    print("Json LSP started.");
    require "lsp_signature".on_attach()
end
local lsp = require 'lspconfig'

lsp.jsonls.setup{on_attach=custom_attach}
