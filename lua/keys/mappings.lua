-- General mappings
-------------------
local map = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}
local silent = {silent = true}

-- Leader Key:
--------------
map('n', '<Space>', '<NOP>', options)
vim.g.mapleader = ' '

-- Alternate way to save
------------------------
map('n', '<C-s>', ':w<CR>', options)

-- Window Movement:
-------------------
map('n', '<C-h>', '<C-w>h', silent)
map('n', '<C-j>', '<C-w>j', silent)
map('n', '<C-k>', '<C-w>k', silent)
map('n', '<C-l>', '<C-w>l', silent)

-- Indent with Tab and Shift-Tab
--------------------------------
map('v', '<Tab>', '>', {})
map('v', '<S-Tab>', '<', {})

-- Move selected line / block of text in visual mode
----------------------------------------------------
map('x', 'K', ':move \'<-2<CR>gv-gv\'', options)
map('x', 'J', ':move \'>+1<CR>gv-gv\'', options)

-- Tab switch buffer
--------------------
--[[ map('n', '<TAB>', ':bnext<CR>', options)
map('n', '<S-TAB>', ':bprevious<CR>', options) ]]

-- Use alt + hjkl to resize windows:
------------------------------------
map('n', '<M-j>', ':resize -2<CR>', options)
map('n', '<M-k>', ':resize +2<CR>', options)
map('n', '<M-h>', ':vertical resize -2<CR>', options)
map('n', '<M-l>', ':vertical resize +2<CR>', options)

-- Make J, K, L, and H move the cursor MORE.
--------------------------------------------
map('n', 'J', '}', options)
map('v', 'J', '}', options)
map('n', 'K', '{', options)
map('v', 'K', '{', options)

-- Shortcut to use blackhole register by default
------------------------------------------------
map('v', 'd', '"_d', options)
map('v', 'D', '"_D', options)
map('v', 'c', '"_c', options)
map('v', 'C', '"_C', options)
map('v', 'x', '"_x', options)
map('v', 'X', '"_X', options)
map('n', 'd', '"_d', options)
map('n', 'D', '"_D', options)
map('n', 'c', '"_c', options)
map('n', 'C', '"_C', options)
map('n', 'x', '"_x', options)
map('n', 'X', '"_X', options)

-- Moving aroung in command mode
--------------------------------
map('c', '<C-h>', '<left>', options)
map('c', '<C-j>', '<down>', options)
map('c', '<C-k>', '<up>', options)
map('c', '<C-l>', '<right>', options)

-- Source current luafile
-------------------------
map('n', '<F5>', ':luafile %<CR>', options)

-- Set spell
------------
map('n', '<F8>', ':set spell!<CR>', options)

-- QuickFix List
map('n', 'C-k', ':cnext', options)
map('n', 'C-j', ':cprev', options)

-- Edit Files
-------------
map('n', '<leader>Si', ':e ~/.config/nvim/init.lua<CR>', options)
map('n', '<leader>Sp', ':e ~/.config/nvim/lua/plugins/plugins.lua<CR>', options)
map('n', '<leader>Sm', ':e ~/.config/nvim/lua/keys/plugins-mappings.lua<CR>', options)
map('n', '<leader>Sz', ':e ~/.config/zsh/.zshrc<CR>', options)
map('n', '<leader>Sb', ':e ~/apps/vimwiki/cookbook/cookbook.md<CR>', options)
