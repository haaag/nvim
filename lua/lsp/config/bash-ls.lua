--- bashls
local defaults = require("lsp.config.lsp-defaults")
local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

local custom_attach = defaults.custom_attach
local capabilities = defaults.capabilities()

lsp.bashls.setup({
	capabilities = capabilities,
	on_attach = custom_attach,
})
