local M = {}

M.set_hl = function(group, options)
    local bg = options.bg == nil and '' or 'guibg=' .. options.bg
    local fg = options.fg == nil and '' or 'guifg=' .. options.fg
    local gui = options.gui == nil and '' or 'gui=' .. options.gui
    vim.cmd(string.format('hi %s %s %s %s', group, bg, fg, gui))
end

-- you can of course pick whatever colour you want, I picked these colours
-- because I use Gruvbox and I like them
local highlights = {
    {'StatusLine', {fg = '#3C3836', bg = '#EBDBB2'}},
    {'StatusLineNC', {fg = '#3C3836', bg = '#928374'}},
    {'Mode', {bg = '#928374', fg = '#1D2021', gui = "bold"}},
    {'LineCol', {bg = '#928374', fg = '#1D2021', gui = "bold"}},
    {'Git', {bg = '#504945', fg = '#EBDBB2'}},
    {'Filetype', {bg = '#504945', fg = '#EBDBB2'}},
    {'Filename', {bg = '#504945', fg = '#EBDBB2'}},
    {'ModeAlt', {bg = '#504945', fg = '#928374'}},
    {'GitAlt', {bg = '#3C3836', fg = '#504945'}},
    {'LineColAlt', {bg = '#504945', fg = '#928374'}},
    {'FiletypeAlt', {bg = '#3C3836', fg = '#504945'}}
}

M.setup = function()
    for _, highlight in ipairs(highlights) do
        M.set_hl(highlight[1], highlight[2])
    end
end

return M
