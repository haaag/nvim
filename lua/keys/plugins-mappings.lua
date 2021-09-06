-- Plugins Mappings
-------------------
local map = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}

-- Telescope Builtin:
--------------------
-- map('n', '<C-f>', ':lua require"telescope.builtin".find_files()<cr>', options)
map('n', '<C-f>', ':Telescope find_files<cr>', options)
map('n', '<leader>pb', ':lua require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({hidden = true, winblend = 10, previewer = false}))<CR>', options)
map('n', '<leader>mp', ':lua require("telescope.builtin").keymaps()<cr>', options)

-- Tagbar Toggle:
----------------
map('n', '<F2>', ':TagbarToggle<CR>', options)

-- Lsp Mappings:
----------------
map('n', 'gd',            ':lua vim.lsp.buf.definition()<CR>', options)
map('n', 'gr',            ':lua vim.lsp.buf.references()<CR>', options)
map('n', '[e',            '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', options)
map('n', ']e',            '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', options)
map('n', '[c',            ':Lspsaga show_line_diagnostics<CR>', options)
-- map('n', 'gD',            ':lua vim.lsp.buf.declaration()<CR>', options)
-- map('n', '<leader>lk',    ':lua vim.lsp.buf.hover()<CR>', options)
-- map('n', '<leader>lr',    '<cmd>lua vim.lsp.buf.rename()<CR>', options)

-- BufferLine
-------------
map('n', '<C-S-k>', ':BufferLineCycleNext<CR>', options)
map('n', '<C-S-j>', ':BufferLineCyclePrev<CR>', options)

-- Omnicomplete
---------------
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

-- Move lines
-------------
vim.api.nvim_set_keymap("v", "K", ":move \'<-2<CR>gv-gv", {})
vim.api.nvim_set_keymap("v", "J", ":move \'>+1<CR>gv-gv", {})
