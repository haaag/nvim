-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local theme = require('plugins.themes.local-theme').colorscheme()

-- stylua: ignore
local colors = {
    blue = theme.blue,
    cyan = theme.cyan,
    black = theme.background,
    white = theme.white,
    red = theme.red,
    violet = theme.purple,
    grey = theme.background,
    green = theme.green,
    yellow = theme.yellow
}

local bubbles_theme = {
    normal = {
        a = {fg = colors.black, bg = colors.blue},
        b = {fg = colors.white, bg = colors.grey},
        c = {fg = colors.black, bg = colors.black}
    },

    insert = {a = {fg = colors.black, bg = colors.blue}},
    visual = {a = {fg = colors.black, bg = colors.cyan}},
    replace = {a = {fg = colors.black, bg = colors.red}},

    inactive = {
        a = {fg = colors.white, bg = colors.black},
        b = {fg = colors.white, bg = colors.black},
        c = {fg = colors.black, bg = colors.black}
    }
}

lualine.setup{
    options = {
        theme = bubbles_theme,
        component_separators = '|',
        section_separators = {left = '', right = ''},
        disabled_filetypes = {'NvimTree', 'toggleterm', 'tagbar', 'vista', 'vista_kind'}
    },
    sections = {
        lualine_a = {{'mode', separator = {left = ''}, right_padding = 2}},
        lualine_b = {
            'filename', {'branch', icon = ''}, {
                'diff',
                symbols = {added = ' ', modified = ' ', removed = ' '},
                diff_color = {
                    added = {fg = colors.green},
                    modified = {fg = colors.blue},
                    removed = {fg = colors.red}
                }
            }
        },
        lualine_c = {'fileformat'},
        lualine_x = {},
        lualine_y = {'filetype', 'progress'},
        lualine_z = {
            {'location', separator = {right = ''}, left_padding = 2}
        }
    },
    inactive_sections = {
        lualine_a = {'filename'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'location'}
    },
    tabline = {},
    extensions = {}
}
