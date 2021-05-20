-- Plugins Mappings
-------------------
local map = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}

-- Telescope Builtin: {{{
--------------------
map('n', '<C-f>', ':lua require"telescope.builtin".find_files()<cr>', options)
-- map('n', '<leader>W', ':lua require("telescope.builtin").grep_string({ search = vim.fn.input("  Grep For > ")})<CR>', options)
-- map('n', '<leader>pw', ':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>', options)
map('n', '<leader>pb', ':lua require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({hidden = true, winblend = 10, previewer = false}))<CR>', options)
-- map('n', '<leader>o', ':lua require"telescope.builtin".oldfiles()<cr>', options)
map('n', '<leader>mp', ':lua require("telescope.builtin").keymaps()<cr>', options)
-- }}}

-- Colorizer: {{{
------------
-- map('n', '<leader>c', ':ColorizerToggle<CR>', options)
-- }}}

-- Startify: {{{
-----------
-- map('n', '<leader>S', ':Startify<CR>', options)
-- }}}

-- BuffDelete: {{{
-------------
-- map('n', '<leader>d', ':BufDel<CR>', options)
-- }}}

-- OnlyBuffer and Maximizer: {{{
---------------------------
--[[ map('n', '<leader>lo', ':only<CR>', options)
map('n', '<leader>lO', ':MaximizerToggle<CR>', options) ]]
-- }}}

-- NvimTree Explorer: {{{
--------------------
-- map('n', '<F3>', ':NvimTreeToggle<CR>', options)
-- map('n', '<leader>?', ':NvimTreeFindFile<CR>', options)
-- }}}

-- Tagbar Toggle: {{{
----------------
map('n', '<F2>', ':TagbarToggle<CR>', options)
-- }}}

-- Lsp Mappings: {{{
-- map('n', 'gD',            ':lua vim.lsp.buf.declaration()<CR>', options)
map('n', 'gd',            ':lua vim.lsp.buf.definition()<CR>', options)
map('n', 'gr',            ':lua vim.lsp.buf.references()<CR>', options)
map('n', '<leader>=',     '<cmd>lua vim.lsp.buf.formatting()<CR>', options)
--[[ map('n', '[e',            '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', options)
map('n', ']e',            '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', options)
map('n', '<leader>lk',    ':lua vim.lsp.buf.hover()<CR>', options)
map('n', '<leader>lr',    '<cmd>lua vim.lsp.buf.rename()<CR>', options) ]]
-- }}}

-- PersonalFuncions: {{{
-- Toggle number, sings, etc.
map('n', '<leader>ln', ':lua require("utils.personal-functions").toggle_stuff()<CR>', options)

-- Telescope
--[[ map('n', '<leader>vot', ':lua require("plugins.tools.telescope-functions").search_dotfiles()<CR>', options)
map('n', '<leader>vrc', ':lua require("plugins.tools.telescope-functions").search_dotfiles_vim()<CR>', options) ]]

-- BufferLine
map('n', '<C-S-k>', ':BufferLineCycleNext<CR>', options)
map('n', '<C-S-j>', ':BufferLineCyclePrev<CR>', options)
-- map('n', 'gb', ':BufferLinePick<CR>', options)

-- Omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

-- Floaterm
map('n', '<F1>',  ':FloatermToggle<CR>', options)
-- }}}

-- vim: set sw=2 ts=2 sts=2 et tw=80 ft=lua fdm=marker fmr={{{,}}}:
