local M = {}

M.custom_attach = function(client, bufnr)
  require("me.lsp.utils").setup(client, bufnr)
  require("lsp-inlayhints").on_attach(client, bufnr)
end

M.capabilities = function()
  local present_coq, coq = pcall(require, "coq")
  if present_coq then
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.colorProvider = { dynamicRegistration = false }
    capabilities = coq.lsp_ensure_capabilities { capabilities = capabilities }
    return capabilities
  else
    print("COQ not present")
    return
  end
end

return M
