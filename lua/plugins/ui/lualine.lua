local theme = require('plugins.themes.local-theme').colorscheme()

require('lualine').setup {
    options = {
        -- theme = 'onedark',
        theme = 'tokyonight',
        -- theme = 'solarized',
        section_separators = '',
        component_separators = '',
        icons_enabled = true
    },
    sections = {
        lualine_a = {{'mode', upper = true}},
        lualine_b = {{'branch', icon = ''}},
        lualine_c = {
            {'filename', file_status = true, full_path = true, shorten = true},
            {
                'diff',
                color_added = theme.green,
                color_modified = theme.blue,
                color_removed = theme.red,
            }
        },
        lualine_x = {
            {
                'diagnostics',
                sources = {'nvim_lsp'},
                color_error = theme.red,
                color_warn = theme.yellow,
                color_info = theme.lightgrey
            }, 'filetype'
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    }
}

--[[ section_separators = {'', ''},
-- component_separators = {'', ''}, ]]

--   
