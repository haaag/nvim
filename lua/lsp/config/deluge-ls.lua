-- deluge zoho
local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

local cmd = vim.cmd
local home = os.getenv("HOME")

local defaults = require("lsp.config.lsp-defaults")
local custom_attach = defaults.custom_attach

local capabilities = defaults.capabilities()
local configs = require("lspconfig.configs")

-- Syntax highlight for Deluge files
vim.api.nvim_create_autocmd("FileType,BufRead", {
	pattern = "dg",
	callback = function()
		cmd([[ set filetype=deluge ]])
		cmd([[ syntax on ]])
	end,
})

-- Check if it's already defined for when reloading this file.
if not configs.deluge then
	configs.deluge = {
		default_config = {
			cmd = { home .. "/apps/dev/deluge-language-parser/deluge-server" },
			filetypes = { "deluge" },
			root_dir = lsp.util.root_pattern(".git", "deluge", "projects"),
			settings = {},
		},
	}
end

lsp.deluge.setup({
	capabilities = capabilities,
	on_attach = custom_attach,
})
