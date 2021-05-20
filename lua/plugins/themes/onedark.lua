-- Onedark
----------
local g = vim.g

vim.cmd('hi Comment cterm=italic')
g.onedark_hide_endofbuffer=0
g.onedark_terminal_italics=1
g.onedark_termcolors=256
vim.cmd('colorscheme onedark')
