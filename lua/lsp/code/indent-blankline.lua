-- indent-blankline
local g = vim.g
local cmd = vim.cmd
local indent = 2

g.indentLine_enabled = 1
g.indent_blankline_char = "▏"

cmd "hi IndentBlanklineChar guifg=#2a2e36"

g.indent_blankline_filetype_exclude = {
    'help', 'terminal', 'LuaTree', 'packer', 'Packer', 'startify', 'tagbar',
    'dashboard', 'vimwiki'
}
g.indent_blankline_buftype_exclude = {
    'help', 'terminal', 'LuaTree', 'packer', 'Packer'
}

g.indent_blankline_show_trailing_blankline_indent = false
g.indent_blankline_show_first_indent_level = false
