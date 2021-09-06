local g = vim.g

g.startify_custom_header = {
'',
'',
'                      ██            ',
'                     ░░             ',
'    ███████  ██    ██ ██ ██████████ ',
'   ░░██░░░██░██   ░██░██░░██░░██░░██',
'    ░██  ░██░░██ ░██ ░██ ░██ ░██ ░██',
'    ░██  ░██ ░░████  ░██ ░██ ░██ ░██',
'    ███  ░██  ░░██   ░██ ███ ░██ ░██',
'   ░░░   ░░    ░░    ░░ ░░░  ░░  ░░ ',
'',
'',
}
g.webdevicons_enable_startify = 1
g.startify_enable_special = 0
g.startify_session_autoload = 1
g.startify_session_delete_buffers = 1
g.startify_change_to_vcs_root = 1
g.startify_fortune_use_unicode = 1
g.startify_session_persistence = 1


-- vim.g.startify_custom_header = 'startify#pad(startify#fortune#cowsay())'

-- Use Nvim-web-devicons for Startify
function _G.webDevIcons(path)
    local filename = vim.fn.fnamemodify(path, ':t')
    local extension = vim.fn.fnamemodify(path, ':e')
    return require'nvim-web-devicons'.get_icon(filename, extension, { default = true })
end

vim.api.nvim_exec([[
function! StartifyEntryFormat() abort
    return 'v:lua.webDevIcons(absolute_path) . "  " . entry_path'
endfunction
]], false)

g.startify_lists = {
  { type = 'dir', header = { "   Current Directory "..vim.fn.getcwd()..":" } },
  { type = 'bookmarks', header = { '   Bookmarks' } }
}
