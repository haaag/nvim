local g = vim.g

-- Enables bold text.
g.gruvbox_bold = true

-- Enables italic text.
g.gruvbox_italic = true

-- Enables transparent background.
g.gruvbox_transparent_bg = false

-- Enables underlined text.
g.gruvbox_underline = true

-- Enables undercurled text.
g.gruvbox_undercurl = true

-- Changes dark mode contrast. Overrides g:gruvbox_contrast option.
-- Possible values are soft, medium and hard.
g.gruvbox_contrast_dark = "dark"

-- Changes number column background color. Possible values are any of gruvbox palette.
-- g.gruvbox_number_column = '#3C3836'

-- Changes sign column background color. Possible values are any of gruvbox palette.
-- g.gruvbox_sign_column = '3C3836'

-- Enables italic for comments.
g.gruvbox_italicize_comments = true

-- Enables italic for strings.
g.gruvbox_italicize_strings = true

-- gruvbox_invert_selection
-- g.gruvbox_invert_selection = true

-- Load colorscehem
vim.o.background = "dark"
-- vim.o.background = "light"

vim.cmd([[ colorscheme gruvbox ]])
vim.cmd("highlight ColorColumn ctermbg=0 guibg=grey")
vim.cmd("hi SignColumn guibg=none")
-- vim.cmd("highlight! link SignColumn LineNr")
vim.cmd("highlight Normal guibg=none")
vim.cmd("hi CursorLineNR guibg=None")
vim.cmd("hi TelescopeBorder guifg=#5eacd")
