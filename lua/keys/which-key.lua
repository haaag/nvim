require("which-key").setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 10 -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true -- bindings for prefixed with g
        }
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = {gc = "Comments"},
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+" -- symbol prepended to a group
    },
    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 4, max = 25}, -- min and max height of the columns
        width = {min = 20, max = 50}, -- min and max width of the columns
        spacing = 15, -- spacing between columns
        align = "center" -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = {"j", "k"},
        v = {"j", "k"}
    }
}

local wk = require("which-key")

wk.register({
    ['<F1>'] = {"<cmd>:ToggleTerm<CR>", "terminal"},
    ['<F2>'] = {':TagbarToggle<CR>', 'tagbar'},
    ['<F3>'] = {':NvimTreeToggle<CR>', 'nvimtree'},
    ['<C-F>'] = {':Telescope find_files<CR>', 'find files'},
    ['<F4>'] = { "<cmd>lua _lazygit_toggle()<CR>", "lazygit"},
})

wk.register({
    ['='] = {'<cmd>lua vim.lsp.buf.formatting()<CR>', 'formatting'},
    ['/'] = {'<Plug>kommentary_line_default', 'kommentary', noremap = false},
    ['?'] = {':NvimTreeFindFile<CR>', 'treefind'}
    -- ['<F1>'] = {':FloatermToggle<CR>', 'toggle_term'},
    --[[ ['<F2>'] = {':TagbarToggle<CR>', 'tagbar'},
    ['<F3>'] = {':NvimTreeToggle<CR>', 'nvimtree'} ]]
}, {prefix = "<leader>"})

-- find
--[[ wk.register({
    f = {
        name = '+find',
        c = {
            name = '+commands',
            c = {'<Cmd>Telescope commands<CR>', 'commands'},
            h = {'<Cmd>Telescope command_history<CR>', 'history'}
        },
        l = {'<Cmd>Telescope current_buffer_fuzzy_find<CR>', 'search in buffer'}
    }
}, {prefix = "<leader>"}) ]]

-- debug
wk.register({
    d = {
        name = "+debugging",
        b = {
            "<cmd>lua require'dap'.toggle_breakpoint()<cr>", 'toggle breakpoint'
        },
        r = {"<cmd>lua require'dap'.run_to_cursor()<cr>", "run to cursor"},
        p = {"<cmd>lua require'dap'.repl.open()<cr>", "repl open"},
        c = {"<cmd>lua require'dap'.continue()<cr>", "continue"},
        s = {
            name = "+step",
            o = {"<cmd>lua require'dap'.step_over()<cr>", "step over"},
            i = {"<cmd>lua require'dap'.step_into()<cr>", "step into"}
        },
        x = {"<cmd>lua require'dap'.close()<cr>", "close"}
    }
}, {prefix = "<leader>"})

-- quickfix
wk.register({
    q = {
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
}, {prefix = "<leader>"})

-- buffers
wk.register({
    b = {
        name = '+buffer',
        d = {':BufDel<CR>', 'close'},
        g = {':BufferLinePick<CR>', 'choose buffer'},
        l = {
            ':lua require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({hidden = true, winblend = 10, previewer = false}))<CR>',
            'buffer list'
        },
        o = {':only<CR>', 'only buffer'},
        O = {':MaximizerToggle<CR>', 'MaximizerToggle'},
        c = {':ColorizerToggle<CR>', 'ColorizerToggle'}
    }
}, {prefix = "<leader>"})

-- wiki
wk.register({
    S = {
        name = '+wiki',
        p = {':e ~/.config/nvim/lua/plugins/init.lua<CR>', 'plugins'},
        z = {':e ~/.config/zsh/.zshrc<CR>', 'zshrc'},
        Z = {':e ~/apps/vimwiki/Zoho.md<CR>', 'zohowiki'},
        b = {':e ~/apps/vimwiki/cookbook/cookbook.md<CR>', 'cookbook'},
        v = {':e ~/apps/vimwiki/index.md<CR>', 'VimWiki'}
    }
}, {prefix = "<leader>"})

-- commands
wk.register({
    p = {
        name = '+commands',
        s = {':PackerSync<CR>', 'PackerSync'},
        c = {':PackerCompile<CR>', 'PackerCompile'}
    }
}, {prefix = "<leader>"})

-- lsp and syntax
wk.register({
    l = {
        name = '+lsp',
        a = {'', ''},
        -- d = {':TroubleToggle<CR>', 'TroubleToggle'},
        c = {':Lspsaga show_line_diagnostics<CR>', 'Show Line Diagnostic'},
        D = {'<cmd>lua vim.lsp.buf.declaration()<CR>', 'Declaration'},
        f = {':Neoformat<CR>', 'formatting'},
        h = {':Lspsaga lsp_finder<CR>', 'Lsp Finder'},
        -- k = {'<cmd>lua vim.lsp.buf.hover()<CR>', 'hover'},
        k = {':Lspsaga hover_doc<CR>', 'hover'},
        n = {':Lspsaga diagnostic_jump_next<CR>', 'Next Diagnostic'},
        -- n = {'<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', "Next Diagnostic"},
        P = {
            ':lua require"lspsaga.provider".preview_definition()<CR>',
            'Preview Definition'
        },
        p = {':Lspsaga diagnostic_jump_prev<CR>', 'Prev Diagnostic'},
        -- p = {'<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', "Prev Diagnostic"},
        t = {':TodoTelescope<CR>', 'TodoTelescope'},
        T = {'call v:lua.toggle_diagnostics()<CR>', 'ToggleDiagnostics'},
        -- r = {':lua vim.lsp.buf.rename()<CR>', 'Rename'},
        r = {':Lspsaga rename<CR>', 'Rename'},
        -- s = {':Lspsaga signature_help<CR>', 'Signature Help'},
        s = {':COQnow<CR>', 'coq init'},
        u = {
            ':lua require"lspsaga.action".smart_scroll_with_saga(1)<CR>',
            'Smart scroll with Saga Next'
        },
        U = {
            ':lua require"lspsaga.action".smart_scroll_with_saga(-1)<CR>',
            'Smart scroll with Saga Prev'
        }
    }
}, {prefix = "<leader>"})

-- telescope
wk.register({
    f = {
        name = "+find",
        b = {':Telescope file_browser<CR>', 'files browser'},
        d = {
            '<Cmd>lua require("plugins.tools.telescope-functions").search_dotfiles()<CR>',
            'dotfiles'
        },
        g = {
            ':lua require("telescope.builtin").grep_string({ search = vim.fn.input("  RG ❯ ")})<CR>',
            'search in files'
        },
        G = {
            ':lua require("plugins.tools.telescope-functions").projects_files()<CR>',
            'git projects'
        },
        l = {'<Cmd>Telescope current_buffer_fuzzy_find<CR>', 'search in buffer'},

        w = {
            ':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>',
            'grep current word'
        },
        u = {
            '<Cmd>lua require("plugins.tools.telescope-functions").search_dotfiles_vim_bk()<CR>',
            'nvim.bk files'
        },

        o = {':Telescope oldfiles theme=get_ivy<cr>', 'recent opened'},
        v = {
            '<Cmd>lua require("plugins.tools.telescope-functions").dotfiles_nvim()<CR>',
            'nvim_config'
        },
        z = {
            '<Cmd>lua require("plugins.tools.telescope-functions").work_files()<CR>',
            'work files'
        }
    }
}, {prefix = "<leader>"})

-- git
wk.register({
    g = {
        name = '+git',
        g = {'<Cmd>Telescope git_commits<CR>', 'commits'},
        c = {'<Cmd>Telescope git_bcommits<CR>', 'bcommits'},
        b = {'<Cmd>Telescope git_branches<CR>', 'branches'},
        s = {'<Cmd>Telescope git_status<CR>', 'status'}
    }
}, {prefix = "<leader>"})

-- kommentary
local visual_keymap = {
    ['/'] = {'<Plug>kommentary_visual_default', 'kommentary', noremap = false}
}

wk.register(visual_keymap, {mode = "v", prefix = "<leader>"})
