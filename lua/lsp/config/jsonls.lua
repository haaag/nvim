--- Json lsp simple config
---------------------
local custom_attach = function(client)
    print("Json LSP started.");
end

require'lspconfig'.jsonls.setup{on_attach=custom_attach}
