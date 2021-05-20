-- local wk = require('whichkey_setup')
vim.g.which_key_timeout = 50
vim.g.which_key_use_floating_win = 0
vim.g.which_key_sep = ' '
vim.g.which_key_max_size = 0
--[[
local keymap = {

    -- w = {':w!<CR>', 'save file'}, -- set a single command and text
    W = {'<Cmd>lua require("telescope.builtin").grep_string({ search = vim.fn.input("  Grep For > ")})<CR>', 'grep'}, -- set a single command and text
    j = 'split args', -- only set a text for an already configured keymap

    -- ['<CR>'] = {'@q', 'macro q'}, -- setting a special key
    f = { -- set a nested structure
        name = '+find',
        b = {'<Cmd>Telescope buffers<CR>', 'buffers'},
        h = {'<Cmd>Telescope help_tags<CR>', 'help tags'},
        c = {
            name = '+commands',
            c = {'<Cmd>Telescope commands<CR>', 'commands'},
            h = {'<Cmd>Telescope command_history<CR>', 'history'}
        },
        q = {'<Cmd>Telescope quickfix<CR>', 'quickfix'},
        g = {
            name = '+git',
            g = {'<Cmd>Telescope git_commits<CR>', 'commits'},
            c = {'<Cmd>Telescope git_bcommits<CR>', 'bcommits'},
            b = {'<Cmd>Telescope git_branches<CR>', 'branches'},
            s = {'<Cmd>Telescope git_status<CR>', 'status'},
        },
        v = {
            name = '+vimfiles',
            a = {'<Cmd>lua require("plugins.tools.telescope-functions").search_dotfiles_vim()<CR>', 'neovim'},
            o = {'<Cmd>lua require("plugins.tools.telescope-functions").search_dotfiles()<CR>', 'dotfiles'},
            i = {'<Cmd>lua require("plugins.tools.telescope-functions").search_dotfiles_vim_bk()<CR>', 'old neovim'}
        },
    }
}

local visual_keymap = {
    K = {':move \'<-2<CR>gv-gv', 'move line up'},
    J = {':move \'>+1<CR>gv-gv', 'move line down'},
}

wk.register_keymap('leader', keymap)
wk.register_keymap('visual', visual_keymap) ]]

-- Disable automapping in Maximizer
vim.g.maximizer_set_default_mapping = 0

local wk = require("whichkey_setup")

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- normal {{{1
local which_key_map = {}
-- general
-- which_key_map['w'] = {':w!<CR>', 'save file'}
-- which_key_map['W'] = {':wa!<CR>', 'save all'}
-- which_key_map['<CR>'] = {':noh<CR><Plug>SearchantStop<CR>', 'no search hl'}
-- which_key_map['/'] = {':<Plug>kommentary_line_default', 'kommentary'}
which_key_map['<F3>'] = {':NvimTreeToggle<CR>', 'NvimTreeToggle'}
which_key_map['?'] = {':NvimTreeFindFile<CR>', 'NvimTreeFindFile'}

-- map('n', '[e', ':Lspsaga diagnostic_jump_next<CR>', options)
-- buffers
which_key_map.b = {
    name = '+buffer',
    d = {':BufDel<CR>', 'close'},
    g = {':BufferLinePick<CR>', 'choose buffer'},
    o = {':only<CR>', 'only buffer'},
    O = {':MaximizerToggle<CR>', 'MaximizerToggle'},
    c = {':ColorizerToggle<CR>', 'ColorizerToggle'}
}

-- quickfix
which_key_map.q = {
    name = '+quickfix',
    q = {':lua require("funcs.quicklist").create_from_buffer()<CR>', 'from buffer'},
    G = {':clast<CR>', 'last'},
    g = {':cfirst<CR>', 'first'},
    c = {':cclose<CR>', 'close'},
    o = {':copen<CR>', 'open'},
}

-- find
which_key_map.f = {
    name = '+find',
    g = {':lua require("telescope.builtin").grep_string({ search = vim.fn.input("  Grep For > ")})<CR>', 'grep'},
    w = {':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>', 'grep current word'},
    o = {':lua require"telescope.builtin".oldfiles()<cr>', 'recent opened files'},
    c = {
        name = '+commands',
        c = {'<Cmd>Telescope commands<CR>', 'commands'},
        h = {'<Cmd>Telescope command_history<CR>', 'history'}
    },
    v = {
      name = '+vimfiles',
      a = {'<Cmd>lua require("plugins.tools.telescope-functions").search_dotfiles_vim()<CR>', 'neovim'},
      o = {'<Cmd>lua require("plugins.tools.telescope-functions").search_dotfiles()<CR>', 'dotfiles'},
      i = {'<Cmd>lua require("plugins.tools.telescope-functions").search_dotfiles_vim_bk()<CR>', 'old neovim'}
    },
}

which_key_map.g = {
    name = '+git',
    g = {'<Cmd>Telescope git_commits<CR>', 'commits'},
    c = {'<Cmd>Telescope git_bcommits<CR>', 'bcommits'},
    b = {'<Cmd>Telescope git_branches<CR>', 'branches'},
    s = {'<Cmd>Telescope git_status<CR>', 'status'},
}

-- cwd
which_key_map.c = {
    name = '+cwd',
    d = {':cd %:p:h<CR>:pwd<CR>', 'cd to current'},
    l = {':lcd %:p:h<CR>:pwd<CR>', 'lcd to current'},
}

-- lsp and syntax
which_key_map.l = {
    name = '+lsp',
    a = {'', ''},
    c = {':Lspsaga show_line_diagnostics<CR>', 'Show Line Diagnostic'},
    h = {':Lspsaga lsp_finder<CR>', 'Lsp Finder'},
    k = {':Lspsaga hover_doc<CR>', 'Hover'},
    n = {':Lspsaga diagnostic_jump_next<CR>', 'Next Diagnostic'},
    P = {':lua require"lspsaga.provider".preview_definition()<CR>', 'Preview Definition'},
    p = {':Lspsaga diagnostic_jump_prev<CR>', 'Prev Diagnostic'},
    t = {':TodoTelescope<CR>', 'TodoTelescope'},
    r = {':Lspsaga rename<CR>', 'Rename'},
    s = {':Lspsaga signature_help<CR>', 'Signature Help'},
    u = {':lua require"lspsaga.action".smart_scroll_with_saga(1)<CR>', 'Smart scroll with Saga Next'},
    U = {':lua require"lspsaga.action".smart_scroll_with_saga(-1)<CR>', 'Smart scroll with Saga Prev'}
}


which_key_map.S = {
  name = '+startify',
  p = {':e ~/.config/nvim/lua/plugins/plugins.lua<CR>', 'plugins'},
  h = {':Startify<CR>', 'Startify Home'},
  z = {':e ~/.config/zsh/.zshrc<CR>', 'zshrc'},
  b = {':e ~/apps/vimwiki/cookbook/cookbook.md<CR>', 'cookbook'},
  v = {'<Cmd>VimwikiIndex<CR>', 'VimWiki'},
}


local local_keymap = {
  e = {':Lspsaga diagnostic_jump_next<CR>', 'Next Diagnostic'},
  w = {':Lspsaga diagnostic_jump_prev<CR>', 'Prev Diagnostic'},
  c = {':Lspsaga show_line_diagnostics<CR>', 'Show Line Diagnostic'},
}

wk.register_keymap('leader', which_key_map)
wk.register_keymap('localleader', local_keymap)

-- Plug-ins Mapping: {{{
-------------------
--[[ local map = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true} ]]

-- Diagnostic with LspSaga:
--------------------------
--[[ map('n', '[e', ':Lspsaga diagnostic_jump_next<CR>', options)
map('n', ']e', ':Lspsaga diagnostic_jump_prev<CR>', options) ]]

-- }}}

-- make
--[[ which_key_map.m = {
    name = '+make',
    m = {':lua require("funcs.terminal").dedicated("make", "make", "tabnew")<CR>', 'make'},
    c = {':lua require("funcs.terminal").dedicated("make", "make clean", "tabnew")<CR>', 'clean'},
    a = {':lua require("funcs.terminal").dedicated("make", "make all", "tabnew")<CR>', 'all'},
    o = {':lua require("funcs.terminal").dedicated("make", "make open", "tabnew")<CR>', 'open'},
} ]]

-- navigation
--[[ which_key_map.n = {
    name = '+navigation',
    s = {'<Cmd>VifmSelectFile<CR>', 'vifm select'},
} ]]

-- tabs
--[[ which_key_map.t = {
    name = '+tabs',
    n = {':tabnew<CR>', 'new'},
    o = {':tabonly<CR>', 'close others'},
    c = {':tabclose<CR>', 'close'},
    m = {':tabmove ', 'move'},
    e = {':tabedit <C-r>=expand("%:p:h")<CR>/', 'edit cwd'},
} ]]

--[[ -- unicode
which_key_map.u = {
    name = '+unicode',
    t = {'<Cmd>lua require("funcs.unicode").replace_hex_to_char()<CR>', 'hx2ch'},
    f = {'<Cmd>lua require("funcs.unicode").replace_char_to_hex()<CR>', 'ch2hx'},
} ]]
