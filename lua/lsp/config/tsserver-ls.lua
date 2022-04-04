--- tsserver lsp
local defaults = require("lsp.config.lsp-defaults")
local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

--[[ local custom_attach = function(client)
	client.resolved_capabilities.document_formatting = false,
    print("Attached to " .. client.name)
end ]]

local custom_attach = defaults.custom_attach_no_formatting
local capabilities = defaults.capabilities()

-- javascript
vim.cmd([[ autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 ]])
vim.cmd([[ autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll ]])

lsp.eslint.setup{
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach=custom_attach
}

lsp.tsserver.setup({
	-- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	capabilities = capabilities,
	on_attach = custom_attach,
})
