local treesitter_configs = require("nvim-treesitter.configs")
local colors = require("me.ui.styles").colors()

treesitter_configs.setup({
	ensure_installed = {
		"bash",
		"cpp",
		"css",
		"html",
		"http",
		"javascript",
		"json",
		"latex",
		"lua",
		"markdown",
		"php",
		"python",
		"toml",
		"typescript",
		"tsx",
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "c", "rust", "ocamllex" },
		additional_vim_regex_highlighting = false, -- list of language that will be disabled
	},
	indent = { enable = true, disable = { "python", "css" } },
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		colors = {
			colors.red,
			colors.yellow,
			colors.blue,
			colors.purple,
			colors.cyan,
			colors.green,
			colors.purple,
		},
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
	autotag = { enable = true },
	textobjects = {
		select = {
			enable = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["ad"] = "@conditional.outer",
				["id"] = "@conditional.inner",
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
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
	matchup = {
		enable = true, -- mandatory, false will disable the whole extension
		disable = { "c", "ruby" }, -- optional, list of language that will be disabled
	},
	-- context_commentstring = { enable = true },
	--[[ refactor = {
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
		}, ]]
})
