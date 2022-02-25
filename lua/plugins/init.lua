-- packer
---------
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer...")
	vim.cmd([[packadd packer.nvim]])
end

local present, _ = pcall(require, "packer_init")
local packer

if present then
	packer = require("packer")
else
	return false
end

local use = packer.use

return require("packer").startup(function()
	config = {
		-- Move to lua dir so impatient.nvim can cache it
		compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
	}
	-- Packer can manage itself as an optional plugin
	use({ "wbthomason/packer.nvim" })

	-- lspconfig
	use({
		"neovim/nvim-lspconfig",
		config = [[require('lsp.config.lspconfig')]],
		event = "BufRead",
		-- opt = false
	})

	-- better python indentation
	use({ "Vimjas/vim-python-pep8-indent", ft = { "py", "python" } })

	-- treesitter {{{
	use({
		"nvim-treesitter/nvim-treesitter",
		config = [[require('lsp.code.treesitter')]],
		event = "BufRead",
		run = ":TSUpdate",
	})

	-- ts-context-commentstring
	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
		requires = { "nvim-treesitter/nvim-treesitter" },
		after = "nvim-treesitter",
	})

	-- rainbow auto pair
	use({
		"p00f/nvim-ts-rainbow",
		requires = { "nvim-treesitter/nvim-treesitter" },
		after = "nvim-treesitter",
	})

	-- text objects
	-- use({
	-- 	"nvim-treesitter/nvim-treesitter-textobjects",
	-- 	after = "nvim-treesitter",
	-- })

	-- auto tags
	use({ "windwp/nvim-ts-autotag", after = "nvim-cmp" })

	-- treesitter-refactor
	use({ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" })
	-- }}}

	-- null-ls
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = [[require('lsp.config.null-ls')]],
	})

	-- project
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				patterns = { ".env", ".git", "deluge", "app", "projects" },
			})
		end,
		event = "BufRead",
	})

	-- vista tagbar
	use({
		"liuchengxu/vista.vim",
		config = function()
			local g = vim.g
			g.vista_sidebar_width = 48
		end,
		cmd = "Vista",
	})

	-- Plugin to manipulate character pairs quickly
	use({ "machakann/vim-sandwich", event = "VimEnter" })

	-- vim-matchup - It extends vim's % key
	use({ "andymass/vim-matchup", event = "CursorMoved" })

	-- vim-move
	use({
		"matze/vim-move",
		config = function()
			local g = vim.g
			g.move_key_modifier = "S-M"
		end,
		opt = false,
	})

	-- code action
	use({ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" })

	-- themes {{{

	-- onedark
	--[[ use({
		"navarasu/onedark.nvim",
		config = function()
			vim.g.one_nvim_transparent_bg = true
			require("onedark").setup({
				ending_tildes = true,
				style = "dark",
			})
			require("onedark").load()
		end,
	}) ]]

	-- tokyonight
	use({
		"folke/tokyonight.nvim",
		config = [[require('plugins.themes')]],
	})

	-- rose pine
	--[[ use {
        "rose-pine/neovim",
        config = function ()
            -- require('rose-pine').set('moon')
            vim.cmd('colorscheme rose-pine')
        end
    } ]]

	-- statusline
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = [[require('plugins.ui.lualine-bubble')]],
		after = "nvim-lspconfig",
	})

	-- code completion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-vsnip" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "f3fora/cmp-spell" },
			{ "rafamadriz/friendly-snippets" },
			{
				"hrsh7th/vim-vsnip",
				config = function()
					vim.g.vsnip_snippet_dir = "$HOME/.config/nvim/vsnip"
				end,
			},
			{ "lukas-reineke/cmp-under-comparator" },
			{ "lukas-reineke/cmp-rg" },
		},
		config = [[require('lsp.code.cmp')]],
	})

	-- completion icons
	use({ "onsails/lspkind-nvim" })

	-- auto pair []
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
		after = "nvim-cmp",
	})

	-- comment
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
		after = "nvim-cmp",
	})

	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzy-native.nvim" },
			{ "jvgrootveld/telescope-zoxide" },
		},
		config = [[require('plugins.tools.telescope')]],
		cmd = { "Telescope" },
	})

	-- tabline
	use({
		"akinsho/nvim-bufferline.lua",
		config = [[require('plugins.ui.bufferline')]],
		event = "BufRead",
	})

	-- maximizer
	use({
		"szw/vim-maximizer",
		cmd = "MaximizerToggle",
		config = function()
			vim.g.maximizer_set_default_mapping = 1
		end,
	})

	-- better buffer del
	use({ "ojroques/nvim-bufdel", cmd = "BufDel" })

	-- git
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			vim.cmd([[ packadd plenary.nvim ]])
			require("gitsigns").setup()
		end,
		event = "BufRead",
	})

	-- ranger
	use({
		"kevinhwang91/rnvimr",
		config = function()
			vim.g.rnvimr_enable_bw = 1
		end,
		cmd = "RnvimrToggle",
	})

	-- smooth scroll
	use({
		"karb94/neoscroll.nvim",
		config = [[require('plugins.ui.neoscroll')]],
		event = "WinScrolled",
	})

	-- display icons
	use({
		"kyazdani42/nvim-web-devicons",
		config = [[require('plugins.ui.icons')]],
	})

	-- colorizer
	use({ "norcalli/nvim-colorizer.lua", cmd = "ColorizerToggle" })

	-- highlight todo comments
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = [[require('lsp.code.todo-comments')]],
		event = "BufRead",
	})

	-- indent highlight
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = [[require('lsp.code.indent-blankline')]],
		opt = false,
	})

	-- syntax highlight for sxhkd
	use({ "baskerville/vim-sxhkdrc", ft = { "sxhkdrc" } })

	-- which-key
	use({ "folke/which-key.nvim" })

	-- toggleterm
	use({
		"akinsho/toggleterm.nvim",
		config = [[require('plugins.tools.terminal')]],
	})

	-- nvim-markdown-preview
	use({
		"davidgranstrom/nvim-markdown-preview",
		config = [[require('plugins.tools.markdown-preview')]],
		ft = { "markdown", "md" },
		cmd = "MarkdownPreview",
	})

	-- vimwiki
	use({
		"vimwiki/vimwiki",
		config = [[require('plugins.tools.vimwiki')]],
		ft = { "vimwiki", "markdown", "md" },
	})

	-- jump-hop
	use({
		"phaazon/hop.nvim",
		as = "hop",
		config = function()
			require("hop").setup({})
		end,
		cmd = { "HopWord", "HopLine", "HopPattern" },
	})

	-- nvim-tree
	use({
		"kyazdani42/nvim-tree.lua",
		config = [[require('plugins.tools.nvimtree')]],
		opt = true,
		cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
	})

	-- CursorHold bug: https://github.com/neovim/neovim/issues/12587
	use({ "antoinemadec/FixCursorHold.nvim" })

	-- impatient
	use({ "lewis6991/impatient.nvim", config = [[require('plugins.tools.impatient')]] })

	-- better filetype.vim
	use({ "nathom/filetype.nvim" })

	-- trouble
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = [[require('lsp.code.trouble')]],
		cmd = { "TroubleToggle", "Trouble", "TroubleClose" },
	})

	-- alpha-nvim
	-- use({
	-- 	"goolord/alpha-nvim",
	-- 	requires = { "kyazdani42/nvim-web-devicons" },
	-- 	config = function()
	-- 		require("alpha").setup(require("alpha.themes.startify").opts)
	-- 	end,
	-- })

	-- syntax for kitty.conf
	use({ "fladson/vim-kitty", ft = { "kitty" } })

	-- pretty-fold
	use({
		"anuvyklack/pretty-fold.nvim",
		config = function()
			require("pretty-fold").setup({})
			require("pretty-fold.preview").setup_keybinding()
		end,
	})

    -- list chars
	use({ "tjdevries/cyclist.vim", event = "VimEnter" })
end)

-- Removed: {{{

-- debugg
-- use {
--     "mfussenegger/nvim-dap",
--     config = function() require("plugins.tools.dap").setup() end
-- }
-- dap-ui
-- use {
--     'rcarriga/nvim-dap-ui',
--     config = function() require('plugins.tools.dap-ui').setup() end
-- }
-- twilight
-- use {
--     "folke/twilight.nvim",
--     config = function() require("twilight").setup {} end,
--     cmd = {"Twilight"}
-- }
-- nnn file manager
-- use {
--     "luukvbaal/nnn.nvim",
--     config = function()
--         require("nnn").setup({explorer = {width = 30}})
--     end,
--     cmd = {'NnnExplorer', 'NnnPicker'}
-- }
--
-- themes: {{{
-- gruvbox original
-- use {
--     "ellisonleao/gruvbox.nvim",
--     requires = {"rktjmp/lush.nvim"},
--     config = [[require('plugins.themes.gruvbox-nvim')]]
-- }

-- catppuccin
-- use {
--     "catppuccin/nvim",
--     as = "catppuccin",
--     config = [[require('plugins.themes.catppuccin')]]
-- }

-- oceanic next
-- use {
--     'mhartington/oceanic-next',
--     config = function ()
--         vim.g.oceanic_next_terminal_bold = 1
--         vim.g.oceanic_next_terminal_italic = 1
--         vim.cmd [[ colorscheme OceanicNext ]]
--     end
-- }

-- kanagawa
-- use {
--     "rebelot/kanagawa.nvim",
--     config = function ()
--         vim.cmd("colorscheme kanagawa")
--     end
-- }

-- vim-drak
-- use {
--     'Th3Whit3Wolf/one-nvim',
--     config = function ()
--         vim.cmd [[ colorscheme one-nvim ]]
--     end
-- }

-- onenord
-- use {
--     'rmehri01/onenord.nvim',
--     config = function ()
--         require('onenord').setup()
--     end
-- }

-- }}}
