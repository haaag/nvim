local M = {}

M.default = function()
    local color = {
        background = "Black",
        foreground = "White",
        black = "Black",
        red = "Red",
        green = "Green",
        yellow = "Yellow",
        blue = "Blue",
        purple = "Magenta",
        cyan = "Cyan",
        white = "White",
        lightgrey = "LightGrey",
        darkgrey = "Grey"
    }
    return color
end

M.sonokai = function()
    local color = {
        background = "#2b2d3a",
        foreground = "#e1e3e4",
        black = "#181a1c",
        red = "#fb617e",
        green = "#9ed06c",
        yellow = "#f0c362",
        blue = "#6dcae8",
        purple = "#bb97ee",
        cyan = "#6dcae8",
        white = "#e1e3e4",
        lightgrey = "#57595e",
        darkgrey = "#404247"
    }
    return color
end

M.onedark = function()
    local color = {
        background = "#282c34",
        foreground = "#abb2bf",
        black = "#282c34",
        red = "#BE5046",
        green = "#98c379",
        yellow = "#e5c07b",
        blue = "#61afef",
        purple = "#be5046",
        cyan = "#56b6c2",
        white = "#979eab",
        lightgrey = "#5c6370",
        darkgrey = "#5c6370"
    }
    return color
end

M.gruvbox = function()
    local color = {
        background = "#282828",
        foreground = "#ebdbb2",
        black = "#282828",
        red = "#fb4934",
        green = "#b8bb26",
        yellow = "#fabd2f",
        blue = "#83a598",
        purple = "#d3869b",
        cyan = "#8ec07c",
        white = "#ebdbb2",
        lightgrey = "#928374",
        darkgrey = "#a89984"
    }
    return color
end

M.gruvbox_material = function()
    local color = {
        background = "#1d2021",
        foreground = "#d4be98",
        black = "#282828",
        red = "#ea6962",
        green = "#a9b665",
        yellow = "#e78a4e",
        blue = "#7daea3",
        purple = "#d3869b",
        cyan = "#89b482",
        white = "#ebdbb2",
        lightgrey = "#928374",
        darkgrey = "#32302f"
    }
    return color
end

M.edge = function()
    local color = {
        background = "#2c2e34",
        foreground = "#c5cdd9",
        black = "#363944",
        red = "#ec7279",
        green = "#a0c980",
        yellow = "#deb974",
        blue = "#6cb6eb",
        purple = "#d38aea",
        cyan = "#5dbbc1",
        white = "#c5cdd9",
        lightgrey = "#5c6370",
        darkgrey = "#5c6370"
    }
    return color
end

M.tokyonight = function()
    local color = {
        background = "#24283b",
        foreground = "#a9b1d6",
        black = "#1a1b26",
        red = "#f7768e",
        green = "#9ece6a",
        yellow = "#e0af68",
        blue = "#7aa2f7",
        purple = "#9d7cd8",
        cyan = "#7dcfff",
        white = "#c0caf5",
        lightgrey = "#545c7e",
        darkgrey = "#545c7e"
    }
    return color
end

M.solarized = function()
    local color = {
        background = "#fdf6e3",
        foreground = "#657b83",
        black = "#002b36",
        red = "#dc322f",
        green = "#7d8d09",
        yellow = "#e0af68",
        blue = "#b58900",
        purple = "#9d7cd8",
        cyan = "#7d8d09",
        white = "#eee8d5",
        lightgrey = "#002b36",
        darkgrey = "#002b36"
    }
    return color
end
return M
