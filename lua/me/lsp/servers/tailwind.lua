local lspconfig = require("lspconfig")
local custom_attach = require("me.lsp.lspconfig").custom_attach
local capabilities = require("me.lsp.lspconfig").capabilities()

lspconfig.tailwindcss.setup({
	on_attach = custom_attach,
	capabilities = capabilities,
	init_options = {
		userLanguages = {
			htmldjango = "html",
		},
	},
})
