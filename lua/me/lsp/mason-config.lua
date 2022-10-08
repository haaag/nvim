-- mason config
require("mason").setup()

local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
require("me.lsp.servers.diagnostic").load_diagnostic_config()

local custom_attach = require("me.lsp.lspconfig").custom_attach
local capabilities = require("me.lsp.lspconfig").capabilities()

mason_lspconfig.setup({
  ensure_installed = {
    "lua-language-server",
    "bash-language-server",
    -- "dockerls",
    "python-lsp-server",
    -- "sqls",
    "tsserver",
  },
})

local simple_servers = {
  "bashls",
  -- "dockerls",
  "sqls",
  -- "cssls",
}

local opts = {
  on_attach = custom_attach,
  capabilities = capabilities,
  single_file_support = false,
}

for _, server in ipairs(simple_servers) do
  lspconfig[server].setup(opts)
end
