vim.o.termguicolors = true
local theme = require('plugins.themes.local-theme').colorscheme()
local bufferline = require "bufferline"

bufferline.setup {
    options = {
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 19,
        enforce_regular_tabs = true,
        view = "multiwindow",
        show_buffer_close_icons = true,
        separator_style = "thin"
    },
    highlights = {
        background = {guifg = comment_fg, guibg = theme.background},
        fill = {guifg = comment_fg, guibg = theme.background},
        buffer_selected = {guifg = normal_fg, guibg = theme.black, gui = "bold"},
        separator_visible = {guifg = theme.background, guibg = theme.background},
        separator_selected = {
            guifg = theme.background,
            guibg = theme.background
        },
        separator = {guifg = theme.background, guibg = theme.background},
        indicator_selected = {
            guifg = theme.background,
            guibg = theme.background
        },
        modified_selected = {guifg = string_fg, guibg = theme.black}
    }
}
-- colors for active , inactive buffer tabs
--[[ require"bufferline".setup {
    options = {
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 19,
        enforce_regular_tabs = true,
        view = "multiwindow",
        show_buffer_close_icons = true,
        separator_style = "thin"
    },
    highlights = {
        background = {guifg = comment_fg, guibg = theme.background},
        fill = {guifg = comment_fg, guibg = theme.background},
        buffer_selected = {guifg = normal_fg, guibg = theme.black, gui = "bold"},
        separator_visible = {guifg = theme.background, guibg = theme.background},
        separator_selected = {
            guifg = theme.background,
            guibg = theme.background
        },
        separator = {guifg = theme.background, guibg = theme.background},
        indicator_selected = {
            guifg = theme.background,
            guibg = theme.background
        },
        modified_selected = {guifg = string_fg, guibg = theme.black}
    }
} ]]
