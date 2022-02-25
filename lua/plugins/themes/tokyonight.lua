-- tokyonight
local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
    return
end

local g = vim.g
g.tokyonight_style = "storm"
-- g.tokyonight_style = "day"
g.tokyonight_italic_functions = true
g.tokyonight_italic_comments = false
g.tokyonight_italic_keywords = true
-- g.tokyonight_hide_inactive_statusline = true
g.tokyonight_dark_sidebar = true
g.tokyonight_dark_float = true
g.tokyonight_lualine_bold = true
g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer", "tagbar" }
vim.cmd [[ colorscheme tokyonight ]]
