local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

local path = vim.fn.stdpath("config") .. "/spell/es.utf-8.add"
local words = {}
local defaults = require("lsp.config.lsp-defaults")

for word in io.open(path, "r"):lines() do
	table.insert(words, word)
end

local custom_attach = defaults.custom_attach
local capabilities = defaults.capabilities()
-- local configs = require("lspconfig.configs")

lsp.ltex.setup({
	capabilities = capabilities,
	autostart = false,
	on_attach = custom_attach,
	settings = {
		ltex = {
			dictionary = {
				["en-US"] = words,
				["es-AR"] = words,
			},
			language = "es-AR",
		},
		filetypes = {
			"markdown",
			"vimwiki",
			"tex",
		},
	},
})

-- require("grammar-guard").init()

--[[ if not config.grammar_guard then
	configs.grammar_guard = {
		cmd = { "/usr/bin/ltex-ls" },
		settings = {
			ltex = {
				enabled = { "latex", "tex", "bib", "markdown", "vimwiki" },
				language = "es",
				diagnosticSeverity = "information",
				setenceCacheSize = 2000,
				additionalRules = {
					enablePickyRules = true,
					motherTongue = "en",
				},
				trace = { server = "verbose" },
				dictionary = {
					["en-US"] = words,
					["es-AR"] = words,
				},
				disabledRules = {},
				hiddenFalsePositives = {},
			},
		},
	}
end ]]

--[[ lsp.grammar_guard.setup({
	capabilities = capabilities,
	cmd = { "/usr/bin/ltex-ls" },
	on_attach = custom_attach,
	settings = {
		ltex = {
			enabled = { "latex", "tex", "bib", "markdown" },
			language = "es",
			diagnosticSeverity = "information",
			setenceCacheSize = 2000,
			additionalRules = {
				enablePickyRules = true,
				motherTongue = "en",
			},
			trace = { server = "verbose" },
			dictionary = {
				-- ["en-US"] = words,
				["es-AR"] = words,
			},
			disabledRules = {},
			hiddenFalsePositives = {},
		},
	},
}) ]]
