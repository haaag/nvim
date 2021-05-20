local g = vim.g

-- Char List
------------
-- local chart_list = {'|', '¦', '┆', '┊', "▏", '│'}

-- g.indent_blankline_enabled = true

-- SpaceChar if enabled.
------------------------
-- g.indentLine_leadingSpaceChar = '·'
-- g.indentLine_leadingSpaceEnabled = 1

-- My Chart
-----------
g.indentLine_char_list = {"▏"}
g.indentLine_color_tty_dark = 1
g.indent_blankline_extra_indent_level = -1

-- Excluded
-----------
g.indentLine_fileTypeExclude = {
    'help', 'terminal', 'LuaTree', 'packer', 'Packer', 'startify', 'tagbar', 'dashboard', 'vimwiki'
}
g.indentLine_bufTypeExclude = {
    'help', 'terminal', 'LuaTree', 'packer', 'Packer'
}

-- Others
g.indentLine_setConceal = 1
g.indentLine_faster = 1
-- g.indentLine_indentLevel = 1
-- g.indentLine_conceallevel = 1
