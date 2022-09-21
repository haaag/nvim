-- terminal

local toggleterm = require("toggleterm")

local map = vim.keymap.set
local Terminal = require("toggleterm.terminal").Terminal

toggleterm.setup({
  size = 18,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_terminals = false,
  direction = "float", -- | 'horizontal' | 'window' | 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  float_opts = {
    border = "curved",
    winblend = 0,
  },
})

local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "curved",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
})

local ipython = Terminal:new({
  cmd = "ipython",
  dir = "git_dir",
  direction = "horizontal",
  float_opts = {
    border = "curved",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
})

local npm_start = Terminal:new({
  cmd = "npm start",
  dir = "git_dir",
  direction = "horizontal",
  float_opts = {
    border = "curved",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
})

local empty = Terminal:new({
  cmd = "zsh",
  dir = "git_dir",
  direction = "horizontal",
  float_opts = {
    border = "curved",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
})

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

-- mappings visual mode
map("v", "<leader>ts", ":ToggleTermSendVisualLines<CR>", { desc = "Send visual sel." })
map("v", "<leader>ts", ":ToggleTermSendVisualSelection<CR>", { desc = "Send visual block" })

-- mappings normal mode
map("n", "<leader>tp", function()
  ipython:toggle()
end, { desc = "iPython REPL" })

map("n", "<leader>tg", function()
  lazygit:toggle()
end, { desc = "Lazygit" })

map("n", "<leader>tn", function()
  npm_start:toggle()
end, { desc = "Npm start" })

map("n", "<leader>tt", function()
  empty:toggle()
end, { desc = "Term" })

map("n", "<terminal>ts", ":ToggleTermSendCurrentLine<CR>", { desc = "Send current line" })

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
