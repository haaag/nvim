local colorscheme = require('plugins.themes.colors')
local Theme = {}

Theme.colors = function()
    local colors = colorscheme.tokyonight()
    -- local colors = colorscheme.onedark()
    -- local colors = colorscheme.rose()
    -- local colors = colorscheme.oceanic()
    -- local colors = colorscheme.gruvbox()
    -- local colors = colorscheme.catppuccin()
    -- local colors = colorscheme.gruvbox_flat()
    -- local colors = colorscheme.solarized()
    -- local colors = colorscheme.dracula()
    return colors
end
return Theme
