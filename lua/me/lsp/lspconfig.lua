local M = {}

M.custom_attach = function(client, bufnr)
  local utils = require("me.lsp.lsp_utils")
  utils.diagnostic_pop(bufnr)
  utils.lsp_highlight_document(client)
  utils.load_lsp_format(client)
  require("me.lsp.lsp_keys").load_lsp_keys(bufnr)
  print("attached to " .. client.name)
end

M.capabilities = function()
  if vim.g.coq_present then
    local present_coq, coq = pcall(require, "coq")
    if present_coq then
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      return coq.lsp_ensure_capabilities({ capabilities })
    end
  else
    local present_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if present_cmp then
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.colorProvider = { dynamicRegistration = false }
      return capabilities
    end
  end
end

return M
