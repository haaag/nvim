-- local wk = require('whichkey_setup')
vim.g.which_key_timeout = 50
vim.g.which_key_use_floating_win = 1
vim.g.which_key_sep = ' '
vim.g.which_key_max_size = 0

-- Disable automapping in Maximizer
vim.g.maximizer_set_default_mapping = 0

local wk = require("whichkey_setup")

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- normal {{{1
local which_key_map = {}
which_key_map['<F3>'] = {':NvimTreeToggle<CR>', 'NvimTreeToggle'}
which_key_map['?'] = {':NvimTreeFindFile<CR>', 'NvimTreeFindFile'}

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
    q = {
        ':lua require("funcs.quicklist").create_from_buffer()<CR>',
        'from buffer'
    },
    G = {':clast<CR>', 'last'},
    g = {':cfirst<CR>', 'first'},
    c = {':cclose<CR>', 'close'},
    o = {':copen<CR>', 'open'}
}

-- find
which_key_map.f = {
    name = '+find',
    c = {
        name = '+commands',
        c = {'<Cmd>Telescope commands<CR>', 'commands'},
        h = {'<Cmd>Telescope command_history<CR>', 'history'}
    },
    l = {'<Cmd>Telescope current_buffer_fuzzy_find<CR>', 'search in buffer'}
}

which_key_map.g = {
    name = '+git',
    g = {'<Cmd>Telescope git_commits<CR>', 'commits'},
    c = {'<Cmd>Telescope git_bcommits<CR>', 'bcommits'},
    b = {'<Cmd>Telescope git_branches<CR>', 'branches'},
    s = {'<Cmd>Telescope git_status<CR>', 'status'}
}

which_key_map.t = {
    name = "+telescope",
    d = {
        '<Cmd>lua require("plugins.tools.telescope-functions").search_dotfiles()<CR>',
        'dotfiles'
    },
    g = {
        ':lua require("telescope.builtin").grep_string({ search = vim.fn.input("  RG ❯ ")})<CR>',
        'grep'
    },
    w = {
        ':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>',
        'grep current word'
    },
    o = {
        ':lua require"telescope.builtin".oldfiles()<cr>', 'recent opened files'
    },
    v = {
        '<Cmd>lua require("plugins.tools.telescope-functions").dotfiles_nvim()<CR>',
        'nvim_config'
    }
}

-- lsp and syntax
which_key_map.l = {
    name = '+lsp',
    a = {'', ''},
    d = {':TroubleToggle<CR>', 'TroubleToggle'},
    c = {':Lspsaga show_line_diagnostics<CR>', 'Show Line Diagnostic'},
    h = {':Lspsaga lsp_finder<CR>', 'Lsp Finder'},
    -- k = {':Lspsaga hover_doc<CR>', 'Hover'},
    -- k = {':lua require("lspsaga.hover").render_hover_doc()<CR>', "hover"},
    k = {'<cmd>lua vim.lsp.buf.hover()<CR>', 'hover'},
    n = {':Lspsaga diagnostic_jump_next<CR>', 'Next Diagnostic'},
    P = {
        ':lua require"lspsaga.provider".preview_definition()<CR>',
        'Preview Definition'
    },
    p = {':Lspsaga diagnostic_jump_prev<CR>', 'Prev Diagnostic'},
    t = {':TodoTelescope<CR>', 'TodoTelescope'},
    T = {'call v:lua.toggle_diagnostics()<CR>', 'ToggleDiagnostics'},
    r = {':Lspsaga rename<CR>', 'Rename'},
    s = {':Lspsaga signature_help<CR>', 'Signature Help'},
    u = {
        ':lua require"lspsaga.action".smart_scroll_with_saga(1)<CR>',
        'Smart scroll with Saga Next'
    },
    U = {
        ':lua require"lspsaga.action".smart_scroll_with_saga(-1)<CR>',
        'Smart scroll with Saga Prev'
    }
}

which_key_map.S = {
    name = '+startify',
    p = {':e ~/.config/nvim/lua/plugins/init.lua<CR>', 'plugins'},
    h = {':Startify<CR>', 'Startify Home'},
    z = {':e ~/.config/zsh/.zshrc<CR>', 'zshrc'},
    Z = {':e ~/apps/vimwiki/Zoho.md<CR>', 'zohowiki'},
    b = {':e ~/apps/vimwiki/cookbook/cookbook.md<CR>', 'cookbook'},
    v = {'<Cmd>VimwikiIndex<CR>', 'VimWiki'},
}

local local_keymap = {
    e = {':Lspsaga diagnostic_jump_next<CR>', 'Next Diagnostic'},
    w = {':Lspsaga diagnostic_jump_prev<CR>', 'Prev Diagnostic'},
    c = {':Lspsaga show_line_diagnostics<CR>', 'Show Line Diagnostic'}
}

wk.register_keymap('leader', which_key_map)
wk.register_keymap('localleader', local_keymap)
