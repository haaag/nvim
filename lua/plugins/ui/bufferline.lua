vim.o.termguicolors = true
local theme = require('plugins.themes.local-theme').colorscheme()
local bufferline = require "bufferline"


bufferline.setup {
    options = {
        offsets = {{filetype = "NvimTree", text = "", padding = 1}},
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_buffer_close_icons = true,
        separator_style = "thin",
        -- mappings = true,
        always_show_bufferline = true
    },
    highlights = {
        fill = {
            guifg = theme.darkgrey,
            guibg = theme.black2
        },
        background = {
            guifg = theme.darkgrey,
            guibg = theme.black2
        },
        -- buffers
        buffer_visible = {
            guifg = theme.lightgrey,
            guibg = theme.black2
        },
        buffer_selected = {
            --[[ guifg = theme.black2,
            guibg = theme.blue, ]]
            guifg = theme.white,
            guibg = theme.black,
            gui = "bold"
        },
        -- tabs
        tab = {
            guifg = theme.lightgrey,
            guibg = theme.background
        },
        tab_selected = {
            guifg = theme.black2,
            guibg = theme.blue
        },
        tab_close = {
            guifg = theme.red,
            guibg = theme.black
        },
        indicator_selected = {
            guifg = theme.black,
            guibg = theme.black
        },
        -- separators
        separator = {
            guifg = theme.black2,
            guibg = theme.black2
        },
        separator_visible = {
            guifg = theme.black2,
            guibg = theme.black2
        },
        separator_selected = {
            guifg = theme.black2,
            guibg = theme.black2
        },
        -- modified
        modified = {
            guifg = theme.red,
            guibg = theme.black2
        },
        modified_visible = {
            guifg = theme.red,
            guibg = theme.black2
        },
        modified_selected = {
            guifg = theme.green,
            guibg = theme.black
        },
        -- close buttons

        close_button = {
            guifg = theme.lightgrey,
            guibg = theme.black2
        },
        close_button_visible = {
            guifg = theme.lightgrey,
            guibg = theme.black2
        },
        close_button_selected = {
            guifg = theme.red,
            guibg = theme.black
        }
    }
}

-- My Config: {{{
--[[ bufferline.setup {
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
-- }}}
-- Other Config: {{{
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
-- }}}
-- BackUp: {{{
--[[ bufferline.setup {
    options = {
        offsets = {{filetype = "NvimTree", text = "", padding = 1}},
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_buffer_close_icons = true,
        separator_style = "thin",
        mappings = true,
        always_show_bufferline = true
    },
    highlights = {
        fill = {
            guifg = theme.grey_fg,
            guibg = theme.black2
        },
        background = {
            guifg = theme.grey_fg,
            guibg = theme.black2
        },
        -- buffers
        buffer_visible = {
            guifg = theme.light_grey,
            guibg = theme.black2
        },
        buffer_selected = {
            guifg = theme.white,
            guibg = theme.black,
            gui = "bold"
        },
        -- tabs
        tab = {
            guifg = theme.light_grey,
            guibg = theme.one_bg3
        },
        tab_selected = {
            guifg = theme.black2,
            guibg = theme.nord_blue
        },
        tab_close = {
            guifg = theme.red,
            guibg = theme.black
        },
        indicator_selected = {
            guifg = theme.black,
            guibg = theme.black
        },
        -- separators
        separator = {
            guifg = theme.black2,
            guibg = theme.black2
        },
        separator_visible = {
            guifg = theme.black2,
            guibg = theme.black2
        },
        separator_selected = {
            guifg = theme.black2,
            guibg = theme.black2
        },
        -- modified
        modified = {
            guifg = theme.red,
            guibg = theme.black2
        },
        modified_visible = {
            guifg = theme.red,
            guibg = theme.black2
        },
        modified_selected = {
            guifg = theme.green,
            guibg = theme.black
        },
        -- close buttons

        close_button = {
            guifg = theme.light_grey,
            guibg = theme.black2
        },
        close_button_visible = {
            guifg = theme.light_grey,
            guibg = theme.black2
        },
        close_button_selected = {
            guifg = theme.red,
            guibg = theme.black
        }
    }
} ]]
-- }}}

-- vim: set ft=lua fdm=marker fmr={{{,}}}:
