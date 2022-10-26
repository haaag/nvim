-- indent-blankline
local indent_blankline = require("indent_blankline")

indent_blankline.setup({
	buftype_exclude = {
		"help",
		"nofile",
		"terminal",
		"lsp-installer",
		"lspinfo",
		"vimwiki",
		"packer",
		"Packer",
	},
	filetype_exclude = {
		"help",
		"terminal",
		"LuaTree",
		"packer",
		"Packer",
		"startify",
		"tagbar",
		"vimwiki",
		"alpha",
		"Outline",
		"lsp-installer",
		"neo-tree",
	},
	context_patterns = {
		"class",
		"return",
		"function",
		"method",
		"^if",
		"^while",
		"jsx_element",
		"^for",
		"^object",
		"^table",
		"block",
		"arguments",
		"if_statement",
		"else_clause",
		"jsx_element",
		"jsx_self_closing_element",
		"try_statement",
		"catch_clause",
		"import_statement",
		"operation_type",
	},
	use_treesitter = true,
	show_trailing_blankline_indent = false,
	char = "▏",
	context_char = "▏",
	show_current_context = true,
	show_current_context_start = false,
	show_end_of_line = false,
	space_char_blankline = " ",
})
