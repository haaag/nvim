-- tsserver lsp
local default_on_attach = require("me.lsp.lspconfig").custom_attach
local typescript = require("typescript")
local coq = require("coq")

--[[ local load_typescript_keys = function(bufnr)
  local buff_map = vim.api.nvim_buf_set_keymap
  buff_map(
    bufnr,
    "n",
    "<leader>lti",
    "<CMD>TypescriptAddMissingImports<CR>",
    { noremap = true, silent = true, desc = "Add missing imports." }
  )
  buff_map(
    bufnr,
    "n",
    "<leader>lto",
    "<CMD>TypescriptOrganizeImports<CR>",
    { noremap = true, silent = true, desc = "Organize imports" }
  )
  buff_map(
    bufnr,
    "n",
    "<leader>ltf",
    "<CMD>TypescriptFixAll<CR>",
    { noremap = true, silent = true, desc = "Typescript fix all" }
  )
  buff_map(
    bufnr,
    "n",
    "<leader>ltr",
    "<CMD>TypescriptRenameFile<CR>",
    { noremap = true, silent = true, desc = "Rename file" }
  )
  buff_map(
    bufnr,
    "n",
    "<leader>ltR",
    "<CMD>TypescriptRemoveUnused<CR>",
    { noremap = true, silent = true, desc = "Remove unused" }
  )
end ]]

--[[ local custom_attach = function(client, bufnr)
  default_on_attach(client, bufnr)
  load_typescript_keys(bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.colorProvider = { dynamicRegistration = false }

typescript.setup {
  disable_commands = false,
  debug = false,
  server = {
    coq.lsp_ensure_capabilities {
      capabilities = capabilities,
    },
    on_attach = custom_attach,
  },
} ]]
