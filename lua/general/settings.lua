-- General Settings:
--------------------
-- API Alias: {{{
-----------------
local o = vim.o
local b = vim.bo
local wo = vim.wo
local cmd = vim.cmd
local HOME = tostring(os.getenv("HOME"))
--- }}}

-- Editor Options: {{{
-----------------
cmd [[ set title titlestring=%(%{expand(\"%:~:.:h\")}%)/%t ]]
o.clipboard = "unnamed,unnamedplus" -- Yank and paste with the system clipboard
o.hidden = true -- Hides buffers instead of closing them hidden
o.swapfile = false -- No swapfile
o.pumheight = 25 -- Makes popup menu smaller
o.encoding = "utf-8" -- The encoding displayed
o.ruler = true -- Show the cursor position all the time
o.cmdheight = 1 -- More space for displaying messages
o.mouse = "a" -- Enable your mouse
o.splitbelow = true -- Horizontal splits will automatically be below
o.termguicolors = true -- xx
o.splitright = true -- Vertical splits will automatically be to the right
o.conceallevel = 2 -- So that I can see `` in markdown files
o.tabstop = 2 -- Insert 2 spaces for a tab
o.shiftwidth = 2 -- Change the number of space characters inserted for indentation
o.smarttab = true -- Makes tabbing smarter will realize you have 2 vs 4
o.expandtab = true -- Converts tabs to spaces
o.smartindent = true -- Makes indenting smart
o.laststatus = 2 -- Always display the status line
o.showtabline = 2 -- Always show tabs
o.showmode = false -- We don't need to see things like -- INSERT -- anymore
-- o.autoindent = true                             -- Good auto indent
-- o.backup = false                                -- This is recommended by coc
-- o.writebackup = false                           -- This is recommended by coc
-- o.foldmethod = "expr"
o.undofile = true -- Allow undo mode after closing file
o.undodir = HOME .. "/.config/nvim/undodir" -- Set UndoDir
o.updatetime = 100 -- Faster completion
o.fileformat = "unix" -- Set fileformat
o.scrolloff = 5 -- Set ScrollOff
o.sidescroll = 1 -- Smoother sideways scrolling
o.dictionary = "/usr/share/dict/words" -- EN Dictionary - <CTRL-X><CTRL-K>
o.incsearch = true -- xx
o.inccommand = "split" -- substitute live update
o.hlsearch = false -- Disable Highlight search
o.path = [[ ** ]]
b.sts = 2 -- softtabstop
b.sw = 2 -- shiftwidth
b.ts = 2 -- tabstop
o.lazyredraw = true -- faster scrolling
b.synmaxcol = 240 -- max column for syntax highlight
vim.bo.swapfile = false
cmd [[ set spelllang=en_us,es ]] -- Spellcheck
cmd 'filetype plugin on'
cmd [[set undofile]]
cmd('set colorcolumn=99999') -- fix indentline for now
-- }}}

-- Window-Scoped Options: {{{
wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
wo.number = true -- Relative number
wo.relativenumber = true -- Relative number
wo.wrap = true -- Wrap Lines
wo.cursorline = true -- Enable highlighting of the current line
-- wo.signcolumn = "no"                            -- Always show the signcolumn, otherwise it would shift the text each time
-- }}}

-- Disable Built-in plugins: {{{
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_spec = 1
-- }}}

-- Others: {{{
-- Disables automatic commenting on newline:
cmd [[ autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o ]]
-- Disable IndentLine for markdown files
cmd([[ autocmd FileType markdown let g:indentLine_enabled=0 ]])
-- }}}
-- vim:foldmethod=marker
