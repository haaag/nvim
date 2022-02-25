-- beautiful nvim-treesitter simple config.
local theme = require("plugins.themes.theme-colors").colors()

local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter_configs.setup({
	--ensure_installed = "maintained",
	ensure_installed = {
		"python",
		"javascript",
		"html",
		"bash",
		"lua",
		"json",
		"css",
		"cpp",
		"php",
		"toml",
		"latex",
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		indent = { enable = false },
		-- disable = {} -- list of language that will be disabled
		disable = { "c", "rust", "ocamllex" },
		-- additional_vim_regex_highlighting = true-- list of language that will be disabled
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		colors = { theme.red, theme.yellow, theme.blue, theme.purple, theme.cyan },
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- termcolors = {} -- table of colour name strings
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	textobjects = {
		select = {
			enable = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",

				-- Or you can define your own textobjects like this
				["iF"] = {
					python = "(function_definition) @function",
					cpp = "(function_definition) @function",
					c = "(function_definition) @function",
					java = "(method_declaration) @function",
				},
			},
		},
		lsp_interop = {
			enable = true,
			peek_definition_code = {
				["df"] = "@function.outer",
				["dF"] = "@class.outer",
			},
		},
	},
	autotag = { enable = true },
	context_commentstring = { enable = false },
	matchup = {
		enable = true, -- mandatory, false will disable the whole extension
		disable = { "c", "ruby" }, -- optional, list of language that will be disabled
		-- [options]
	},
	refactor = {
		highlight_definitions = { enable = true },
		highlight_current_scope = { enable = false },
		smart_rename = { enable = true, keymaps = { smart_rename = "grr" } },
		navigation = {
			enable = true,
			keymaps = {
				goto_definition = "gnd",
				list_definitions = "gnD",
				list_definitions_toc = "gO",
				goto_next_usage = "<a-*>",
				goto_previous_usage = "<a-#>",
			},
		},
	},
})
