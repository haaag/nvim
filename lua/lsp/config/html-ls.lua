--- LSP simple config
---------------------
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local custom_attach = function(client)
    print("Html LSP started.");
end

local lsp = require 'lspconfig'
lsp.html.setup {on_attach = custom_attach, capabilities = capabilities}
