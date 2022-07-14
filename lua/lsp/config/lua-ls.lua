-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
USER = vim.fn.expand("$USER")

local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

local defaults = require("lsp.config.lsp-defaults")
local sumneko_root_path = "/home/" .. USER .. "/.config/nvim/ls/lua-language-server"
local sumneko_binary = "/home/" .. USER .. "/.config/nvim/ls/lua-language-server/bin/Linux/lua-language-server"

local custom_attach = defaults.custom_attach
local capabilities = defaults.capabilities()

lsp.sumneko_lua.setup({
	-- capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	capabilities = capabilities,
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	on_attach = custom_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
				maxPreload = 2000,
				preloadFileSize = 1000,
			},
		},
	},
})
