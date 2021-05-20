--- Bash lsp simple config
---------------------
local custom_attach = function(client)
    print("Bash LSP started.");
end

local lsp = require 'lspconfig'
lsp.bashls.setup{on_attach=custom_attach}
