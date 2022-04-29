--- tsserver lsp
local defaults = require("lsp.config.lsp-defaults")
local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

local custom_attach = defaults.custom_attach_no_formatting
local capabilities = defaults.capabilities()

-- autocommands
vim.api.nvim_create_autocmd("FileType", {
    pattern = "javascript",
    callback = function ()
        vim.cmd([[ setlocal shiftwidth=2 tabstop=2 ]])
    end
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = {"tsx", "ts", "jsx", "js"},
    callback = function ()
        vim.cmd([[ EslintFixAll ]])
    end
})

-- eslint
lsp.eslint.setup{
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach=custom_attach
}

-- tsserver
lsp.tsserver.setup({
	-- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	capabilities = capabilities,
	on_attach = custom_attach,
})
