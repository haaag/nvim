--- tsserver lsp
local api = vim.api
local defaults = require("lsp.config.lsp-defaults")
local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

local custom_attach = defaults.custom_attach
local capabilities = defaults.capabilities()

-- autocommands
api.nvim_create_autocmd("FileType", {
	pattern = "javascript",
	callback = function()
		vim.cmd([[ setlocal shiftwidth=2 tabstop=2 ]])
	end,
})

api.nvim_create_autocmd("BufWritePre", {
	pattern = { "tsx", "ts", "jsx", "js" },
	callback = function()
		vim.cmd([[ EslintFixAll ]])
	end,
})

-- tsserver
lsp.tsserver.setup({
	capabilities = capabilities,
	on_attach = custom_attach,
})
