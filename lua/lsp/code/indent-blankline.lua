-- indent-blankline
local g = vim.g

-- local cmd = vim.cmd
-- chars: { "|", '│', '┆', '┊', "|", "¦"}

g.indentLine_enabled = 1
g.indent_blankline_char = "▏"
g.indent_blankline_use_treesitter = true
g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_current_context = true

-- g.indent_blankline_show_current_context = true
-- vim.cmd "hi IndentBlanklineChar guifg=#45403d"
-- vim.cmd "hi IndentBlanklineChar guifg=#2a2e36"
-- vim.cmd "hi IndentBlanklineChar guifg=#545c7e"

g.indent_blankline_filetype_exclude = {
    'help', 'terminal', 'LuaTree', 'packer', 'Packer', 'startify', 'tagbar',
    'vimwiki'
}
g.indent_blankline_buftype_exclude = {
    'help', 'terminal', 'LuaTree', 'packer', 'Packer', 'vimwiki'
}

g.indent_blankline_context_patterns = {
    "class", "return", "function", "method", "^if", "^while", "jsx_element",
    "^for", "^object", "^table", "block", "arguments", "if_statement",
    "else_clause", "jsx_element", "jsx_self_closing_element", "try_statement",
    "catch_clause", "import_statement", "operation_type"
}
--[[ g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false ]]
