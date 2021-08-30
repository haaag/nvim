-- Check if packer is installed (~/local/share/nvim/site/pack)
--------------------------------------------------------------
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
local use = require('packer').use
return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- Code: {{{
    use 'neovim/nvim-lspconfig'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    -- }}}
    -- Code Utility {{{
    use 'sbdchd/neoformat'
    use 'preservim/tagbar'
    use 'hrsh7th/nvim-compe'
    use {'ms-jpq/coq_nvim', branch = 'coq'}
    use 'baskerville/vim-sxhkdrc'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'rafamadriz/friendly-snippets'
    use 'mattn/emmet-vim'
    use 'windwp/nvim-ts-autotag'
    use 'lukas-reineke/format.nvim'
    use 'glepnir/lspsaga.nvim'
    use {'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim'}
    use {'lukas-reineke/indent-blankline.nvim', branch = 'master'}
    use 'kristijanhusak/vim-carbon-now-sh'
    use "ray-x/lsp_signature.nvim"
    use "gennaro-tedesco/nvim-jqx"
    use {'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    -- use 'p00f/nvim-ts-rainbow'
    --[[ use {
        "ray-x/lsp_signature.nvim",
        after = "nvim-lspconfig",
        config = function()
            require('lsp.code.lsp_signature')
        end
    } ]]
    -- }}}
    -- Telescope: {{{
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzy-native.nvim'}
        }
    }
    -- }}}
    -- FileExplorer: {{{
    use 'kyazdani42/nvim-tree.lua'
    -- }}}
    -- Themes: {{{
    use 'Th3Whit3Wolf/one-nvim'
    use 'folke/tokyonight.nvim'
    use 'shaunsingh/solarized.nvim'
    use 'Mofiqul/dracula.nvim'
    -- use 'morhetz/gruvbox'
    use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    use 'eddyekofo94/gruvbox-flat.nvim'
    -- use 'pineapplegiant/spaceduck'
    -- use 'joshdick/onedark.vim'
    -- use 'datwaft/bubbly.nvim'
    -- use 'sainnhe/edge'
    -- }}}
    -- Syntax: {{{
    use 'chrisbra/csv.vim'
    --[[ use 'aklt/plantuml-syntax'
  use 'vim-pandoc/vim-pandoc-syntax' ]]
    -- }}}
    -- Git: {{{
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    -- }}}
    -- General Plugins: {{{
    use 'windwp/nvim-autopairs'
    use 'b3nj5m1n/kommentary'
    use 'ojroques/nvim-bufdel'
    use 'vimwiki/vimwiki'
    use 'junegunn/limelight.vim'
    use 'tjdevries/cyclist.vim'
    use 'szw/vim-maximizer'
    use 'voldikss/vim-floaterm'
    use 'tweekmonster/startuptime.vim'
    use 'airblade/vim-rooter'
    -- use 'iamcco/markdown-preview.nvim'
    use 'davidgranstrom/nvim-markdown-preview'
    -- }}}
    -- UI: {{{
    -- use "Pocco81/TrueZen.nvim"
    use 'norcalli/nvim-colorizer.lua'
    use 'karb94/neoscroll.nvim'
    use 'mhinz/vim-startify'
    --[[ use {
        'AckslD/nvim-whichkey-setup.lua',
        requires = {'liuchengxu/vim-which-key'}
    } ]]
    use {'folke/which-key.nvim'}
    use {
        'yamatsum/nvim-web-nonicons',
        requires = {'kyazdani42/nvim-web-devicons'}
    }
    use 'onsails/lspkind-nvim'
    --[[ use {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  } ]]

    -- StatusLine and Bufferline {{{
    use {
        'akinsho/nvim-bufferline.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    -- }}}
    -- }}}
end)
-- Removed: {{{
-- use 'mhinz/vim-signify'
-- use 'romgrk/nvim-treesitter-context'
-- use 'nvim-lua/lsp-status.nvim'
-- use 'simrat39/symbols-outline.nvim'
-- use 'RRethy/vim-illuminate'
-- use 'mtdl9/vim-log-highlighting'
-- use 'wfxr/minimap.vim'
-- use 'Yggdroot/indentLine'
-- use 'cstrap/python-snippets'
-- use { 'phaazon/hop.nvim' }
-- use 'junegunn/goyo.vim'
-- use 'folke/which-key.nvim'

-- vim: set ft=lua fdm=marker fmr={{{,}}}:
