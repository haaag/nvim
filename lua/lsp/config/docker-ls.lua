local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

local defaults = require("lsp.config.lsp-defaults")
local custom_attach = defaults.custom_attach
local capabilities = defaults.capabilities()

lsp.dockerls.setup({
    on_attach = custom_attach,
    capabilities = capabilities
})
