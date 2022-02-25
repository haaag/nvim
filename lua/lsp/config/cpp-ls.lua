-- cpp lsp
local defaults = require("lsp.config.lsp-defaults")
local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
    return
end

local custom_attach = defaults.custom_attach
local capabilities = defaults.capabilities()


lsp.clangd.setup{
    -- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    capabilities = capabilities,
    on_attach=custom_attach
}
