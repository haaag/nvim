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
        darkgrey = "#5c6370",
        lualine = "onedark"
    }
    return color
end

M.gruvbox = function()
    local color = {
        background = "#282828",
        foreground = "#ebdbb2",
        black = "#282828",
        black2 = "#282828",
        red = "#fb4934",
        green = "#b8bb26",
        yellow = "#fabd2f",
        blue = "#83a598",
        purple = "#8f3f71",
		magenta = "#d3869b",
        orange = "#fe8019",
        cyan = "#8ec07c",
        white = "#ebdbb2",
        lightgrey = "#928374",
        darkgrey = "#a89984",
		lualine = "gruvbox8"
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
        other_background = "#1F2335",
        foreground = "#a9b1d6",
        black = "#1a1b26",
        black2 = "#1a1b26",
        red = "#f7768e",
        green = "#9ece6a",
        yellow = "#e0af68",
        blue = "#7aa2f7",
        purple = "#9d7cd8",
        -- cyan = "#7dcfff",
        cyan = "#4abaaf",
        white = "#c0caf5",
        lightgrey = "#545c7e",
        darkgrey = "#545c7e",
        lualine = "tokyonight",
        global = "tokyonight"
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
        lightgrey = "#073642",
        darkgrey = "#073643",
        lualine = "solarized"
    }
    return color
end

M.dracula = function()
    local color = {
        background = "#282A36",
        foreground = "#F8F8F2",
        black = "#000000",
        red = "#FF5555",
        green = "#50FA7B",
        yellow = "#F1FA8C",
        blue = "#8BE9FD",
        purple = "#BD93F9",
        cyan = "#8BE9FD",
        white = "#E6E6E6",
        lightgrey = "#BFBFBF",
        darkgrey = "#4D4D4D",
        lualine = "dracula-nvim"
    }
    return color
end

M.gruvbox_soft = function()
    local color = {
        background = "#32302f",
        foreground = "#fbf1c7",
        black = "#32302f",
        black2 = "#3c3836",
        red = "#cc241d",
        green = "#98971a",
        yellow = "#d79921",
        blue = "#458588",
        purple = "#b16286",
        cyan = "#689d6a",
        white = "#ebdbb2",
        lightgrey = "#a89984",
        darkgrey = "#928374",
        lualine = "gruvbox"
    }
    return color
end

M.gruvbox_flat = function()
    local color = {
        background = "#1d2021",
        foreground = "#d4be98",
        black = "#1D2021",
        black2 = "#17191a",
        red = "#ea6962",
        green = "#a9b665",
        yellow = "#d8a657",
        blue = "#7daea3",
        purple = "#d3869b",
        magenta = "#d3869b",
        orange = "#e78a4e",
        cyan = "#89b482",
        white = "#d4be98",
        lightgrey = "#a89984",
        darkgrey = "#928374",
        lualine = "gruvbox-flat"
    }
    return color
end

M.catppuccin = function()
    local color = {
        background = "#1E1E28",
        foreground = "#D7DAE0",
        black = "#6E6C7C",
        black2 = "#6E6C7C",
        red = "#E28C8C",
        green = "#B3E1A3",
        yellow = "#EADDA0",
        blue = "#A4B9EF",
        purple = "#F0AFE1",
        magenta = "#C6AAE8",
        orange = "#C6AAE8",
        cyan = "#A4B9EF",
        white = "#D7DAE0",
        lightgrey = "#a89984",
        darkgrey = "#928374",
        lualine = "catppuccin"
    }
    return color
end

M.oceanic = function ()
    local color = {
        background = "#1B2B34",
        foreground = "#C0C5CE",
        black = "#343D46",
        black2 = "#343D46",
        red = "#ec5f67",
        green = "#99c794",
        yellow = "#fac863",
        blue = "#6699cc",
        purple = "#c594c5",
        magenta = "#c594c5",
        orange = "#f99157",
        cyan = "#62b3b2",
        white = "#ffffff",
        lightgrey = "#65737E",
        darkgrey = "#343D46",
        lualine = "OceanicNext"
    }
    return color
end

M.rose = function ()
    local color = {
        background = "#232136",
        foreground = "#C0C5CE",
        black = "#343D46",
        black2 = "#343D46",
        red = "#ec5f67",
        green = "#99c794",
        yellow = "#fac863",
        blue = "#6699cc",
        purple = "#c594c5",
        magenta = "#c594c5",
        orange = "#f99157",
        cyan = "#62b3b2",
        white = "#ffffff",
        lightgrey = "#65737E",
        darkgrey = "#343D46",
        lualine = "rose-pine"
    }
    return color
end

M.kanagawa = function ()
    local color = {
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
    return color
end

return M
