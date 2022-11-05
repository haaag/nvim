-- keymaps
local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }
local silent = { silent = true }

-- Leader Key:
map("n", "<Space>", "<NOP>", options)
vim.g.mapleader = " "

-- Alternate way to save
-- map("n", "<C-s>", ":w<CR>", options)

-- Shortcut to use blackhole register by default
map("v", "d", '"_d', options)
map("v", "D", '"_D', options)
map("v", "c", '"_c', options)
map("v", "C", '"_C', options)
map("v", "x", '"_x', options)
map("v", "X", '"_X', options)
map("n", "d", '"_d', options)
map("n", "D", '"_D', options)
map("n", "c", '"_c', options)
map("n", "C", '"_C', options)
map("n", "x", '"_x', options)
map("n", "X", '"_X', options)

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv'", options)
map("x", "J", ":move '>+1<CR>gv-gv'", options)

-- More molecular undo of text
map("i", ",", ",<c-g>u", silent)
map("i", ".", ".<c-g>u", silent)
map("i", "!", "!<c-g>u", silent)
map("i", "?", "?<c-g>u", silent)
map("i", ";", ";<c-g>u", silent)
map("i", ":", ":<c-g>u", silent)

-- Use alt + hjkl to resize windows:
map("n", "<C-j>", ":resize -2<CR>", options)
map("n", "<C-k>", ":resize +2<CR>", options)
map("n", "<C-l>", ":vertical resize -2<CR>", options)
map("n", "<C-h>", ":vertical resize +2<CR>", options)

-- Keep search results centred
map("n", "n", "nzzzv", silent)
map("n", "N", "Nzzzv", silent)

-- Make Y yank to end of the line
map("n", "Y", "y$", silent)

-- Move lines
map("v", "K", ":move '<-2<CR>gv-gv", {})
map("v", "J", ":move '>+1<CR>gv-gv", {})

-- toggle numbers
vim.keymap.set("n", "<leader>bt", function()
	require("me.general.utils").toggle_numbers_mode()
end, { desc = "Toggle numbers" })
