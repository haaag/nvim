-- WhichKey
local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

wk.setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 10 -- how many suggestions should be shown in the list?
        },
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
    -- operators = {gc = "Comments"},
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
    triggers_blacklist = {i = {"j", "k"}, v = {"j", "k"}}
}

-- local telescope_findfiles = ":lua require('telescope.builtin').find_files({previewer=false,layout_strategy='vertical',layout_config={width=0.5}})<CR>"
-- local wk = require("which-key")

wk.register({
    ['<F2>'] = {':Vista!!<CR>', 'tagbar'},
    ['<F3>'] = {':NvimTreeToggle<CR>', 'nvimtree'},
    ['<F9>'] = {
        ':echo "Running Pandoc"<CR>:silent !convert2pdf.py -f "%:p" --open &<CR>',
        'pandoc'
    },
    ['<C-F>'] = {':Telescope find_files<CR>', 'find files'},
    ['<F4>'] = {"<cmd>lua _lazygit_toggle()<CR>", "lazygit"},
    ['bg'] = {':BufferLinePick<CR>', 'choose buffer'},
    ['sf'] = {':Explore .<CR>', 'netrw'},
    ['<C-\\>'] = {':ToggleTerm<CR>', 'terminal'},
    ['<S-Q>'] = {':RnvimrToggle<CR>', 'float explorer'}
})

wk.register({
    ['='] = {'<cmd>lua vim.lsp.buf.formatting()<CR>', 'formatting'},
    -- ['/'] = {'<cmd>lua require("Comment").toggle()<CR>', 'comment'},
    ['o'] = {':only<CR>', 'only buffer'},
    ['O'] = {':MaximizerToggle<CR>', 'MaximizerToggle'},
    ['?'] = {':NvimTreeFindFile<CR>', 'treefind'}
}, {prefix = "<leader>"})

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
        c = {':ColorizerToggle<CR>', 'ColorizerToggle'},
        d = {':BufDel<CR>', 'close'},
        g = {':BufferLinePick<CR>', 'choose buffer'},
        l = {
            ':lua require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({hidden = true, winblend = 10, previewer = false}))<CR>',
            'buffer list'
        },
        o = {':only<CR>', 'only buffer'},
        O = {':MaximizerToggle<CR>', 'MaximizerToggle'},
        y = {":%y<CR>", "Make yank all the buffer"}
    }
}, {prefix = "<leader>"})

-- wiki
wk.register({
    S = {
        name = '+wiki',
        p = {':e ~/.config/nvim/lua/plugins/init.lua<CR>', 'plugins'},
        z = {':e ~/.config/zsh/.zshrc<CR>', 'zshrc'},
        Z = {':e ~/apps/vimwiki/zoho/Zoho.md<CR>', 'zohowiki'},
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
        -- a = {'<cmd>lua vim.lsp.buf.code_action()<CR>', 'code action'},
        a = {':CodeActionMenu<CR>', 'code action'},
        c = {':cclose<CR>', 'close quickfix'},
        d = {'<cmd>lua vim.lsp.buf.declaration()<CR>', 'Declaration'},
        f = {':lua vim.lsp.buf.formatting_sync()<CR>', 'formatting'},
        k = {'<cmd>lua vim.lsp.buf.hover()<CR>', 'hover'},
        r = {':lua vim.lsp.buf.rename()<CR>', 'Rename'},
        t = {':TodoTelescope<CR>', 'TodoTelescope'}
    }
}, {prefix = "<leader>"})

-- telescope
wk.register({
    f = {
        name = "+telescope",
        -- b = {':Telescope file_browser previewer=false winblend=10<CR>', 'files browser'},
        -- b = {
        --     "<Cmd>lua require('telescope.builtin').file_browser({previewer=false, layout_strategy='vertical',layout_config={width=0.5}})<CR>",
        --     'files browser'
        -- },
        c = {"<Cmd>Telescope zoxide list<CR>", "zoxide"},
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
        h = {'<Cmd> Telescope help_tags<CR>', 'help tags'},
        l = {'<Cmd>Telescope current_buffer_fuzzy_find<CR>', 'search in buffer'},

        w = {
            ':lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>',
            'grep current word'
        },
        u = {
            '<Cmd>lua require("plugins.tools.telescope-functions").dotfiles_nvim_bk()<CR>',
            'nvim.bk files'
        },

        o = {':Telescope oldfiles theme=get_ivy<cr>', 'recent opened'},
        v = {
            '<Cmd>lua require("plugins.tools.telescope-functions").dotfiles_nvim_new()<CR>',
            'nvim_config'
        },
        z = {
            '<Cmd>lua require("plugins.tools.telescope-functions").work_files_new()<CR>',
            'work files'
        }
    }
}, {prefix = "<leader>"})

-- git
wk.register({
    g = {
        name = '+git',
        c = {'<Cmd>Telescope git_bcommits<CR>', 'bcommits'},
        b = {'<Cmd>Telescope git_branches<CR>', 'branches'},
        g = {'<Cmd>Telescope git_commits<CR>', 'commits'},
        p = {'<cmd>lua require("gitsigns").preview_hunk()<CR>', 'preview hunk'},
        s = {'<Cmd>Telescope git_status<CR>', 'status'},
        t = {':Gitsigns toggle_current_line_blame<CR>', 'toggle blame'}
    }
}, {prefix = "<leader>"})

-- jump
wk.register({
    j = {
        name = '+jump',
        w = {':HopWord<CR>', 'jump word'},
        l = {':HopLine<CR>', 'jump line'},
        p = {':HopPattern<CR>', 'jump pattern'}
    }
}, {prefix = "<leader>"})
