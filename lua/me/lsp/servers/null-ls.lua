local null_ls = require("null-ls")

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = true,
	sources = {
		formatting.prettier,
		formatting.stylua,
		formatting.shfmt,
		formatting.shellharden,
		formatting.isort,
		formatting.black,
		formatting.eslint_d,
		diagnostics.shellcheck,
		diagnostics.eslint_d,
		diagnostics.mypy,
		-- code_actions.gitsigns,
	},
})
