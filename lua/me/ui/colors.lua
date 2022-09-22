local C = {}

C.kanagawa = function()
  local colors = {
    background = "#1F1F28",
    foreground = "#DCD7BA",
    black = "#090618",
    black2 = "#090618",
    red = "#C34043",
    green = "#76946A",
    yellow = "#E6C384",
    blue = "#7E9CD8",
    purple = "#957FB8",
    magenta = "#938AA9",
    orange = "#f99157",
    cyan = "#7FB4CA",
    white = "#C8C093",
    lightgrey = "#727169",
    darkgrey = "#727169",
  }
  return colors
end

C.tokyonight = function()
  local colors = {
    background = "#24283b",
    other_background = "#1F2335",
    foreground = "#a9b1d6",
    black = "#1a1b26",
    black2 = "#1a1b26",
    red = "#f7768e",
    green = "#9ece6a",
    yellow = "#e0af68",
    blue = "#7aa2f7",
    purple = "#9d7cd8",
    cyan = "#4abaaf",
    white = "#c0caf5",
    lightgrey = "#545c7e",
    darkgrey = "#545c7e",
    lualine = "tokyonight",
    global = "tokyonight"
  }
  return colors
end

return C
