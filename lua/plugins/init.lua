-- Check if packer is installed (~/local/share/nvim/site/pack)
--------------------------------------------------------------
local present, _ = pcall(require, "packer_init")
local packer

if present then
    packer = require "packer"
else
    return false
end

local use = packer.use

return require("packer").startup(function()
    -- Packer can manage itself as an optional plugin
    use {"wbthomason/packer.nvim"}

    -- lsp config
    use {"neovim/nvim-lspconfig"}

    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        config = [[require('lsp.code.treesitter')]],
        event = "BufRead",
        run = ":TSUpdate"
    }

    -- telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            {"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"},
            {"nvim-telescope/telescope-fzy-native.nvim"}
        },
        config = [[require('plugins.tools.telescope')]]
        -- cmd = "Telescope"
    }

    -- utilities
    use {"folke/which-key.nvim"}

    -- file manager
    use {
        "kyazdani42/nvim-tree.lua",
        config = [[require('plugins.tools.nvimtree')]],
        cmd = "NvimTreeToggle"
    }

    -- tagbar
    use {"preservim/tagbar", cmd = "TagbarToggle"}

    -- display icons
    use {"kyazdani42/nvim-web-devicons"}

    -- code formatting
    use {"sbdchd/neoformat"}

    -- code completion
    use {
        "ms-jpq/coq_nvim",
        branch = "coq",
        config = function()
            vim.g.coq_settings = {
                ['keymap.jump_to_mark'] = '<c-n>',
                ['auto_start'] = true
            }
            require('coq')
            -- print("COQ Loaded.")
            vim.cmd [[ COQnow -s ]]
        end,
        event = "VimEnter"
    }

    -- completion snippets
    use {"ms-jpq/coq.artifacts", branch = "artifacts"}

    -- auto pair []
    use {
        "windwp/nvim-autopairs",
        config = [[require('lsp.code.autopairs')]],
        after = "coq_nvim"
    }

    -- Plugin to manipulate character pairs quickly
    use {"machakann/vim-sandwich", event = "VimEnter"}

    -- vim-matchup - It extends vim's % key
    use {"andymass/vim-matchup", event = "CursorMoved"}

    -- colarizer
    use {"norcalli/nvim-colorizer.lua", cmd = "ColorizerToggle"}

    -- better buffer del
    use {"ojroques/nvim-bufdel"}

    -- smooth scroll
    use {
        "karb94/neoscroll.nvim",
        config = [[require('plugins.ui.neoscroll')]],
        event = "WinScrolled"
    }

    -- git
    use {"lewis6991/gitsigns.nvim", config = [[require('plugins.ui.gitsigns')]]}

    -- comment
    use {"b3nj5m1n/kommentary"}

    -- theme: gruvbox-flat
    use {
        "eddyekofo94/gruvbox-flat.nvim",
        config = [[require('plugins.themes')]]
    }

    -- theme: tokyonight
    use {'folke/tokyonight.nvim', config = [[require('plugins.themes')]]}

    -- tabline
    use {
        "akinsho/nvim-bufferline.lua",
        config = [[require('plugins.ui.bufferline')]],
        event = "BufRead",
        after = "gruvbox-flat.nvim"
    }

    -- statusline
    use {
        "hoob3rt/lualine.nvim",
        config = [[require('plugins.ui.lualine')]],
        event = "BufRead",
        after = "gruvbox-flat.nvim"
    }

    -- highlight todo comments
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = [[require('lsp.code.todo-comments')]],
        event = "BufRead",
        after = "gruvbox-flat.nvim"
    }

    -- better indent highlight
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = [[require('lsp.code.indent-blankline')]]
        -- event = "BufRead",
        -- after = "gruvbox-flat.nvim"
    }

    -- syntax highlight for sxhkd
    use {"baskerville/vim-sxhkdrc", ft = {"sxhkdrc"}}

    -- markdown
    use {
        'davidgranstrom/nvim-markdown-preview',
        config = [[require('plugins.tools.markdown-preview')]],
        ft = {'markdown', 'md'}
    }

    -- vimwiki
    use {
        "vimwiki/vimwiki",
        config = [[require('plugins.tools.vimwiki')]],
        cmd = "VimwikiIndex",
        ft = {"markdown", "md"}
    }

    -- rooter
    use {
        "airblade/vim-rooter",
        config = [[require('plugins.tools.vim-rooter')]]
    }

    -- profiling
    use {
        'dstein64/vim-startuptime',
        cmd = 'StartupTime',
        config = [[vim.g.startuptime_tries = 10]]
    }

    -- ....
    use 'tjdevries/cyclist.vim'

end)
