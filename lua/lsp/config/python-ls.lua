--- python lsp simple config
----------------------------
local HOME = vim.loop.os_homedir()
local defaults = require("lsp.config.lsp-defaults")

local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

local custom_attach = defaults.custom_attach
local capabilities = defaults.capabilities()

lsp.pylsp.setup({
	on_attach = custom_attach,
	settings = {
		pylsp = {
			plugins = {
				pylint = { enabled = false, executable = "pylint" },
				pyflakes = { enabled = false },
				pycodestyle = { enabled = false },
				jedi_completion = { fuzzy = true },
				pyls_isort = { enabled = true },
				pylsp_mypy = { enabled = true },
			},
		},
	},
	flags = {
		debounce_text_changes = 200,
	},
	capabilities = capabilities,
})

lsp.pyright.setup({
	on_attach = custom_attach,
	capabilities = capabilities,
})

vim.g.python3_host_prog = HOME .. "/.local/debugpy/bin/python"
-- no python2
vim.g.loaded_python_provider = 0
