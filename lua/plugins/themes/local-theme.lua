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
  -- }

Theme.colorscheme = function()
    local colors = colorscheme.tokyonight()
    return colors
end
return Theme
