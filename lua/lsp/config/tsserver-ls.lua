--- LSP simple config
---------------------
local custom_attach = function(client)
    print("TsServer LSP started.");
    require "lsp_signature".on_attach()
end

local lsp = require 'lspconfig'
lsp.tsserver.setup{on_attach=custom_attach}
