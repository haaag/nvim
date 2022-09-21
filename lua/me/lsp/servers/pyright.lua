local default_on_attach = require("me.lsp.lspconfig").custom_attach
local capabilities      = require("me.lsp.lspconfig").capabilities()
local lspconfig         = require("lspconfig")

local on_attach = function(client, bufnr)
  default_on_attach(client, bufnr)
  client.server_capabilities.hoverProvider = false
  client.server_capabilities.definitionProvider = false
  client.server_capabilities.signatureHelpProvider = false
end

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  single_file_support = false,
})
