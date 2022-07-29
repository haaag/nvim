local defaults = require("lsp.config.lsp-defaults")
local present, lsp = pcall(require, "lspconfig")
if not present then
	return
end

local custom_attach = defaults.custom_attach
local capabilities = defaults.capabilities()

lsp.emmet_ls.setup({
	on_attach = custom_attach,
	capabilities = capabilities,
	filetypes = {
		"html",
		"css",
		"htmldjango",
	},
})
