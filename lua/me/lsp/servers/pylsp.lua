local default_on_attach = require("me.lsp.lspconfig").custom_attach
local capabilities = require("me.lsp.lspconfig").capabilities()
local lspconfig = require("lspconfig")

local custom_attach = function(client, bufnr)
  default_on_attach(client, bufnr)
  --[[ client.server_capabilities.renameProvider = false
  client.server_capabilities.completionProvider = false
  client.server_capabilities.document_formatting = false -- 0.7 and earlier ]]
  -- client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
end

lspconfig.pylsp.setup({
  on_attach = custom_attach,
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        pylint = { enabled = true, executable = "pylint" },
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
        jedi_completion = {
          enabled = true,
          fuzzy = true,
          include_params = true,
        },
        jedi_hover = { enabled = true },
        jedi_references = { enabled = true },
        jedi_signature_help = { enabled = true },
        jedi_symbols = {
          enabled = true,
          all_scopes = true
        },
        flake8 = { enabled = false },
      },
    },
  },
})
