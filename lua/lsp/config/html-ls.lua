--- LSP simple config
local defaults = require("lsp.config.lsp-defaults")
local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

local custom_attach = defaults.custom_attach
local capabilities = defaults.capabilities()

-- html
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"html", "htmldjango"},
    command = "setlocal shiftwidth=2 tabstop=2"
})

lsp.html.setup({
	capabilities = capabilities,
	on_attach = custom_attach,
	filetypes = {
		"html",
		"htmldjango",
	},
})
