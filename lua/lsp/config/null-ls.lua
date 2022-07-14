local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		-- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		-- formatting.black.with({ extra_args = { "--fast", "--line-length=100" } }),
		-- formatting.black.with({ extra_args = { "--fast" } }),
		-- formatting.isort,
		-- diagnostics.flake8.with({ extra_args = { "--ignore=E501" } }),
		formatting.prettier,
		formatting.stylua,
		formatting.shfmt,
		formatting.shellharden,
		formatting.eslint_d,
		-- diagnostics.mypy.with({ extra_args = { "--ignore-missing-imports" } }),
		diagnostics.shellcheck,
		diagnostics.eslint_d,
	},
})
