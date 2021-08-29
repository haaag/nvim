-- Enable (broadcasting) snippet capability for completion
-- local attach = require('lsp.config.utils')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local custom_attach = function(client)
    print("CSS LSP started.");
    -- print(string.format("%s LSP started.", client));
    require"lsp_signature".on_attach()
end

require'lspconfig'.cssls.setup {
    capabilities = capabilities,
    on_attach = custom_attach
}

-- local lsp = require'lspconfig'
-- lsp.cssls.setup{on_attach=attach.custom("CSS")}
