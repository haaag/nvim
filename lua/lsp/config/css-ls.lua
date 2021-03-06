-- css lsp
local defaults = require("lsp.config.lsp-defaults")
local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

local custom_attach = defaults.custom_attach
local capabilities = defaults.capabilities()

-- css
vim.cmd([[ autocmd FileType css setlocal shiftwidth=2 tabstop=2 ]])

lsp.cssls.setup({
	capabilities = capabilities,
	on_attach = custom_attach,
})
