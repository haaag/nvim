--- LSP simple config
---------------------
local custom_attach = function(client)
    print("Vim-ls LSP started.");
end

local lsp = require 'lspconfig'
lsp.vimls.setup{on_attach=custom_attach}
