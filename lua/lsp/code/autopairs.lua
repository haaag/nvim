require('nvim-autopairs').setup()

local pairs_map = {
    ["'"] = "'",
    ['"'] = '"',
    ['('] = ')',
    ['['] = ']',
    ['{'] = '}',
    ['`'] = '`',
}
local disable_filetype = { "TelescopePrompt" }
local break_line_filetype = nil -- mean all file type
local html_break_line_filetype = {'html' , 'vue' , 'typescriptreact' , 'svelte' , 'javascriptreact'}
local ignored_next_char = "%w"

local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')
