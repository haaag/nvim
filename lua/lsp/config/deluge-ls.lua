-- deluge zoho
local defaults = require("lsp.config.lsp-defaults")
local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

local custom_attach = defaults.custom_attach
local capabilities = defaults.capabilities()
local configs = require("lspconfig.configs")

-- Syntax highlight for Deluge files
vim.cmd([[ autocmd BufNewFile,BufRead /*.dg setf deluge ]])
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "dg",
-- 	callback = function()
-- 		vim.cmd([[ set filetype=deluge ]])
-- 	end,
-- })

-- Check if it's already defined for when reloading this file.
if not configs.deluge then
	configs.deluge = {
		default_config = {
			-- cmd = { "/home/hh/apps/github/deluge/Deluge-Language-Parser/deluge-server" },
			cmd = { "/home/hh/apps/dev/deluge-language-parser/deluge-server" },
			filetypes = { "deluge" },
			root_dir = lsp.util.root_pattern(".git", "deluge", "projects"),
			--[[ root_dir = function(fname)
                return lsp.util.find_git_ancestor(fname) or
                vim.loop.os_homedir()
            end, ]]
			settings = {},
		},
	}
end

lsp.deluge.setup({
	capabilities = capabilities,
	on_attach = custom_attach,
})
