-- Example config in lua
vim.g.solarized_italic_comments = true
vim.g.solarized_italic_keywords = true
vim.g.solarized_italic_functions = true
vim.g.solarized_italic_variables = false
vim.g.solarized_contrast = true
vim.g.solarized_borders = false
vim.g.solarized_disable_background = false

-- Load the colorscheme
require('solarized').set()
