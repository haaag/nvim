--- Bash lsp simple config
--------------------------

local lsp = require 'lspconfig'

local custom_attach = function(client)
    print("Bash LSP started");
end

lsp.bashls.setup{on_attach=custom_attach}
