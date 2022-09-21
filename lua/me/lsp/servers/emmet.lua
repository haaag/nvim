local custom_attach = require("me.lsp.lspconfig").custom_attach
local capabilities  = require("me.lsp.lspconfig").capabilities()
local lspconfig     = require("lspconfig")

lspconfig.emmet_ls.setup({
  on_attach = custom_attach,
  capabilities = capabilities,
  filetypes = {
    "html",
    "css",
    "htmldjango",
    "javascript",
    "javascriptreact",
  },
})
