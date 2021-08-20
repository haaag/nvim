local colorscheme = require('plugins.themes.colorscheme')
local Theme = {}

-- Set theme bufferline
-----------------------------------
-- Choose from: {
  -- default,
  -- sonokai,
  -- onedark,
  -- gruvbox,
  -- gruvbox_material,
  -- edge
  -- tokyonight
  -- solarized light
  -- }

Theme.colorscheme = function()
    local colors = colorscheme.gruvbox_flat()
    -- local colors = colorscheme.tokyonight()
    -- local colors = colorscheme.solarized()
    -- local colors = colorscheme.dracula()
    return colors
end
return Theme
