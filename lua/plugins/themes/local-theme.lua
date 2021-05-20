local colorscheme = require('plugins.themes.colorscheme')
local Theme = {}

-- Set theme for bubbly, bufferline
-----------------------------------
-- Choose from: {
  -- default,
  -- sonokai,
  -- onedark,
  -- gruvbox,
  -- gruvbox_material,
  -- edge
  -- }

Theme.colorscheme = function()
    local colors = colorscheme.tokyonight()
    return colors
end
return Theme
