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

return packer.startup(function()
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
	})

	-- better python indentation
	use({ "Vimjas/vim-python-pep8-indent", ft = { "py", "python" } })

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		config = [[require('lsp.code.treesitter')]],
		run = ":TSUpdate",
	})

	use({
		"nvim-treesitter/nvim-treesitter-context",
		requires = { "nvim-treesitter/nvim-treesitter" },
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

	-- auto tags
	use({ "windwp/nvim-ts-autotag", after = "nvim-cmp" })

	-- treesitter-refactor
	use({ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" })

    -- treesitter-textobjects
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
		tequires = { "nvim-treesitter/nvim-treesitter" },
        after = "nvim-treesitter"
    })

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
	})

	-- vista tagbar
	use({
		"liuchengxu/vista.vim",
		config = function()
			local g = vim.g
			g.vista_sidebar_width = 48
            -- g.vista_default_executive = 'nvim_lsp'
            -- g.vista_echo_cursor_strategy = 'floating_win'
		end,
		cmd = "Vista",
	})

	-- use({
	-- 	"simrat39/symbols-outline.nvim",
	-- 	config = [[require('plugins.tools.symbols-outline')]],
	-- })

	-- Plugin to manipulate character pairs quickly
	use({ "machakann/vim-sandwich", event = "VimEnter" })

	-- vim-matchup - It extends vim's % key
	use({
		"andymass/vim-matchup",
		event = "CursorMoved",
		-- config = [[require('plugins.tools.vim-matchup')]]
	})

	-- vim-move
	use({
		"matze/vim-move",
		config = function()
			local g = vim.g
			g.move_key_modifier = "S-M"
			g.move_key_modifier_visualmode = "S-M"
		end,
	})

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
	-- use({
	-- 	"folke/tokyonight.nvim",
	-- 	config = [[require('plugins.themes')]],
	-- })

	-- gruvbox
	use({
		"ellisonleao/gruvbox.nvim",
		config = [[require('plugins.themes.gruvbox-nvim')]],
	})

	-- gruvbox-community
	-- use({
	-- 	"gruvbox-community/gruvbox",
	-- 	config = [[require('plugins.themes.gruvbox-community')]],
	-- })

	-- gruvbox-baby
	-- use({
	--     "luisiacc/gruvbox-baby",
	--     config = [[require('plugins.themes.gruvbox-baby')]]
	-- })

	-- gruvbox8
	-- use({
	--     "lifepillar/vim-gruvbox8",
	--     config = [[require('plugins.themes.gruvbox8')]]
	-- })

	-- kanagawa
	-- use({
	--     "rebelot/kanagawa.nvim",
	--     config = function ()
	--         vim.cmd("colorscheme kanagawa")
	--     end
	-- })

	-- statusline
	-- use({
	-- 	"nvim-lualine/lualine.nvim",
	-- 	requires = { "kyazdani42/nvim-web-devicons" },
	-- 	config = [[require('plugins.ui.lualine-bubble')]],
	-- })

	-- statusline - tabline
	use({
		"tamton-aquib/staline.nvim",
		config = "require('plugins.ui.staline-simple')",
	})

	-- statusline
	--[[ use({
		"beauwilliams/statusline.lua",
		config = function()
			local statusline = require("statusline")
			statusline.tabline = false
		end,
	}) ]]

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
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{
				"hrsh7th/vim-vsnip",
				config = function()
					vim.g.vsnip_snippet_dir = "$HOME/.config/nvim/vsnip"
				end,
			},
			{ "lukas-reineke/cmp-under-comparator" },
			{ "lukas-reineke/cmp-rg" },
		},
		-- config = [[require('lsp.code.cmp-new')]],
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
		config = [[require('plugins.tools.gitsings')]],
		event = "BufRead",
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
	})

	-- indent highlight
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = [[require('lsp.code.indent-blankline')]],
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

	-- lightspeed
	use({
		"ggandor/lightspeed.nvim",
	})

	-- neo-tree
	use({
		"nvim-neo-tree/neo-tree.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = [[require('plugins.tools.neo-tree')]],
	})

	-- CursorHold bug: https://github.com/neovim/neovim/issues/12587
	use({ "antoinemadec/FixCursorHold.nvim" })

	-- impatient
	use({ "lewis6991/impatient.nvim", config = [[require('plugins.tools.impatient')]] })

	-- better filetype.vim
	use({ "nathom/filetype.nvim" })

	-- trouble
	-- use({
	-- 	"folke/trouble.nvim",
	-- 	requires = "kyazdani42/nvim-web-devicons",
	-- 	config = [[require('lsp.code.trouble')]],
	-- 	cmd = { "TroubleToggle", "Trouble", "TroubleClose" },
	-- })

	-- syntax for kitty.conf
	use({ "fladson/vim-kitty", ft = { "kitty" } })

	-- pretty-fold
	use({
		"anuvyklack/pretty-fold.nvim",
		requires = "anuvyklack/nvim-keymap-amend",
		config = function()
			require("pretty-fold").setup({})
			require("pretty-fold.preview").setup()
		end,
	})

	-- sessions
	use({
		"tpope/vim-obsession",
	})

	-- rest.nvim
	use({
		"NTBBloodbath/rest.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = [[require('plugins.tools.rest')]],
	})

	-- list chars
	use({
		"tjdevries/cyclist.vim",
	})

    use({
        "SmiteshP/nvim-gps",
        requires = "nvim-treesitter/nvim-treesitter"
    })

	-- ui
	-- use({
	--     "stevearc/dressing.nvim"
	-- })
end)
