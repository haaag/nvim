--- vimls
local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
    return
end

local custom_attach = function(client)
    print("Attached to " .. client.name);
end

lsp.vimls.setup{
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach=custom_attach
}
