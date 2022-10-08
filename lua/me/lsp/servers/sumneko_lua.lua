-- Sumneko
local default_on_attach = require("me.lsp.lspconfig").custom_attach
local lspconfig     = require("lspconfig")
local coq = require("coq")
local capabilities = vim.lsp.protocol.make_client_capabilities()

local custom_attach = function(client, bufnr)
	default_on_attach(client, bufnr)
end

lspconfig.sumneko_lua.setup(coq.lsp_ensure_capabilities({
  capabilities = capabilities,
  on_attach = custom_attach,
  single_file_support = false,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
        maxPreload = 2000,
        preloadFileSize = 1000,
      },
    },
  },
}))
