-- Sumneko
local custom_attach = require("me.lsp.lspconfig").custom_attach
local capabilities  = require("me.lsp.lspconfig").capabilities()
local lspconfig     = require("lspconfig")

lspconfig.sumneko_lua.setup({
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
})
