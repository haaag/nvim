local default_on_attach = require("me.lsp.lspconfig").custom_attach
local capabilities = require("me.lsp.lspconfig").capabilities()
local lspconfig = require("lspconfig")

local custom_attach = function(client, bufnr)
  default_on_attach(client, bufnr)
end

local settings = {
  pylsp = {
    configurationSources = { "mypy" },
    plugins = {
      pylint = { enabled = true, executable = "pylint" },
      pyflakes = { enabled = false },
      pycodestyle = { enabled = true },
      pylsp_mypy = { enabled = true, live_mode = true },
      black = { enabled = true, line_length = 79 },
      rope_autoimport = { enabled = true },
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
        all_scopes = true,
      },
      flake8 = { enabled = false },
    },
  },
}

lspconfig.pylsp.setup {
  capabilities = capabilities,
  on_attach = custom_attach,
  settings = settings,
}
