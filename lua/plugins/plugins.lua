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
    use 'baskerville/vim-sxhkdrc'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'rafamadriz/friendly-snippets'
    use 'mattn/emmet-vim'
    use 'windwp/nvim-ts-autotag'
    use 'p00f/nvim-ts-rainbow'
    use 'lukas-reineke/format.nvim'
    use 'glepnir/lspsaga.nvim'
    use { 'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim' }
    use { 'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons' }
    use { 'lukas-reineke/indent-blankline.nvim', branch = 'lua' }
    -- }}}
    -- StatusLine and Bufferline {{{
    use {
        'akinsho/nvim-bufferline.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
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
    -- use 'joshdick/onedark.vim'
    use 'Th3Whit3Wolf/one-nvim'
    use 'norcalli/nvim-colorizer.lua'
    use {
        'yamatsum/nvim-web-nonicons',
        requires = {'kyazdani42/nvim-web-devicons'}
    }
    use 'onsails/lspkind-nvim'
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use 'folke/tokyonight.nvim'
    -- use 'datwaft/bubbly.nvim'
    -- use 'sainnhe/edge'
    -- }}}
    -- UML: {{{
    use 'weirongxu/plantuml-previewer.vim'
    use 'tyru/open-browser.vim'
    -- }}}
    -- Syntax: {{{
    use 'chrisbra/csv.vim'
    use 'aklt/plantuml-syntax'
    -- }}}
    -- Git: {{{
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    -- }}}
    -- General Plugins: {{{
    use 'windwp/nvim-autopairs'
    use 'b3nj5m1n/kommentary'
    use 'airblade/vim-rooter'
    use 'ojroques/nvim-bufdel'
    use 'vimwiki/vimwiki'
    use 'iamcco/markdown-preview.nvim'
    use 'junegunn/goyo.vim'
    use 'junegunn/limelight.vim'
    use 'tjdevries/cyclist.vim'
    use 'szw/vim-maximizer'
    use 'voldikss/vim-floaterm'
    use 'mhinz/vim-startify'
    use {
        'AckslD/nvim-whichkey-setup.lua',
        requires = {'liuchengxu/vim-which-key'}
    }
end)
    -- }}}
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
    -- }}}

-- vim: set ft=lua fdm=marker fmr={{{,}}}:
