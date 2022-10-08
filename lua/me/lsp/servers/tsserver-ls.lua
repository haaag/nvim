--- tsserver lsp
local default_on_attach = require("me.lsp.lspconfig").custom_attach
local typescript = require("typescript")
local coq = require("coq")

local custom_attach = function(client, bufnr)
	default_on_attach(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.colorProvider = { dynamicRegistration = false }

typescript.setup({
	disable_commands = false, -- prevent the plugin from creating Vim commands
	debug = false, -- enable debug logging for commands
	-- LSP Config options
	server = {
		coq.lsp_ensure_capabilities({
			capabilities = capabilities,
		}),
		on_attach = custom_attach,
	},
})
