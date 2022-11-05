local wk = require("which-key")
-- setup: {{{

vim.g.maplocalleader = ","

wk.setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 10, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
  },
  -- operators = {gc = "Comments"},
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 15, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CMD>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = { i = { "j", "k" }, v = { "j", "k" } },
}
-- }}}

wk.register {
  ["?"] = { "<CMD>Neotree current %:p:h:h %:p<CR>", "Explore current" },
  ["<F2>"] = { "<CMD>Vista!!<CR>", "Tagbar" },
  ["<F3>"] = { "<CMD>NeoTreeRevealToggle<CR>", "NeoTree Reveal" },
  ["<M-}>"] = { "<CMD>bnext<CR>", "Next buffer" },
  ["<M-{>"] = { "<CMD>bprevious<CR>", "Prev buffer" },
  ["<C-f>"] = { "<CMD>Telescope find_files<CR>", "Find files" },
  ["]a"] = { "<CMD>lua vim.diagnostic.open_float()<CR>", "Diag. Float" },
  ["]d"] = { "<CMD>lua vim.diagnostic.goto_next()<CR>", "Diag. Next" },
  ["[d"] = { "<CMD>lua vim.diagnostic.goto_prev()<CR>", "Diag. Next" },
  -- ["[c"] = { "<CMD>Gitsigns prev_hunk<CR>", "Prev hunk" },
  -- ["]c"] = { "<CMD>Gitsigns next_hunk<CR>", "Next hunk" },
  -- ["]a"] = { "<CMD>Gitsigns preview_hunk<CR>", "Preview hunk" },
}

-- mappings {{{
local mappings = {

  ["="] = { "<CMD>lua vim.lsp.buf.format{ async = true }<CR>", "Formatting" },
  ["o"] = { "<CMD>only<CR>", "Only buffer" },
  ["O"] = { "<CMD>MaximizerToggle<CR>", "MaximizerToggle" },

  -- quickfix {{{
  q = {
    name = "+quickfix",
    q = {
      '<CMD>lua require("funcs.quicklist").create_from_buffer()<CR>',
      "from buffer",
    },
    G = { "<CMD>clast<CR>", "Last" },
    g = { "<CMD>cfirst<CR>", "First" },
    c = { "<CMD>cclose<CR>", "Close" },
    o = { "<CMD>copen<CR>", "Open" },
  },
  -- }}}

  -- buffers {{{
  b = {
    name = "+buffer",
    c = { "<CMD>ColorizerToggle<CR>", "ColorizerToggle" },
    d = { "<CMD>BufDel<CR>", "Close" },
    l = {
      '<CMD>lua require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({hidden = true, previewer = false}))<CR>',
      "Buffer list",
    },
    L = { "<CMD>JABSOpen<CR>", "JABS" },
    o = { "<CMD>only<CR>", "Only buffer" },
    O = { "<CMD>MaximizerToggle<CR>", "MaximizerToggle" },
    y = { "<CMD>%y<CR>", "Make yank all the buffer" },
  },
  -- }}}

  -- lsp
  l = {
    name = "+lsp",
    t = {
      name = "+typescript",
    },
  },

  -- git
  g = {
    name = "+git",
    i = { "<CMD>Gitsigns select_hunk<CR>", "Select hunk" },
    T = { "<CMD>Gitsigns toggle_signs<CR>", "Toggle signs" },
    n = { "<CMD>Neogit<CR>", "Neogit open" },
    o = { "<CMD>DiffviewOpen<CR>", "Diffview open" },
    O = { "<CMD>DiffviewClose<CR>", "Diffview close" },
    z = {
      function()
        require("neogit").open { kind = "split" }
      end,
      "Neogit open split",
    },
  },

  -- terminal
  t = {
    name = "+terminal",
  },

  -- files {{{
  f = {
    name = "+telescope",
    c = { "<CMD>Telescope zoxide list<CR>", "Zoxide" },
    g = {
      '<CMD>lua require("telescope.builtin").grep_string({ search = vim.fn.input("  RG ❯ ")})<CR>',
      "Search in files",
    },
    h = { "<CMD>Telescope help_tags<CR>", "Help tags" },
    l = { "<CMD>Telescope current_buffer_fuzzy_find<CR>", "Search in buffer" },

    w = {
      '<CMD>lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>',
      "Grep current word",
    },
    o = { "<CMD>Telescope oldfiles theme=get_ivy<CR>", "Recent opened" },
  },
  -- }}}

  -- vimwiki {{{
  S = {
    name = "+wiki",
    z = { "<CMD>e ~/.config/zsh/.zshrc<CR>", "Zshrc" },
    b = { "<CMD>e ~/apps/vimwiki/cookbook/cookbook.md<CR>", "Cookbook" },
    v = { "<CMD>e ~/apps/vimwiki/index.md<CR>", "VimWiki" },
  },
  -- }}}
}

local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

wk.register(mappings, opts)

-- }}}
