local M = {}


M.custom_attach = function (client)
    print("attached to " .. client.name);
end

M.custom_attach_no_formatting = function (client)
    client.resolved_capabilities.document_formatting = false,
    print("Attached to " .. client.name)
end

M.capabilities = function ()
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    return capabilities
end

return M
