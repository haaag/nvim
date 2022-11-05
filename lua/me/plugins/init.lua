local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP =
  fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
  vim.cmd([[packadd packer.nvim]])
end

return require("packer").startup(function(use)
  use { "wbthomason/packer.nvim" }

  -- mason
  use {
    "williamboman/mason.nvim",
    config = function()
      require("me.lsp.mason-config")
    end,
  }

  -- mason
  use { "williamboman/mason-lspconfig.nvim", }

  -- lspconfig
  use { "neovim/nvim-lspconfig", }

  -- impatient
  use { "lewis6991/impatient.nvim" }

  -- better filetype.vim
  use { "nathom/filetype.nvim" }

  -- mason lspconfig
  use {
    "williamboman/mason-lspconfig.nvim",
    requires = "neovim/nvim-lspconfig",
  }

  -- tree-sitter
  use {
    {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      event = { "BufRead", "BufNewFile" },
      cmd = {
        "TSInstall",
        "TSInstallInfo",
        "TSInstallSync",
        "TSUninstall",
        "TSUpdate",
        "TSUpdateSync",
        "TSDisableAll",
        "TSEnableAll",
      },
      config = function()
        require("me.configs.treesitter")
      end,
    },
    -- Parenthesis highlighting
    {
      "p00f/nvim-ts-rainbow",
      after = "nvim-treesitter",
    },
    -- Autoclose tags
    {
      "windwp/nvim-ts-autotag",
      after = "nvim-treesitter",
    },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = "nvim-treesitter",
    },
  }

  -- comment
  use {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      require("Comment").setup()
    end,
  }

  -- better python indentation
  use {
    "Vimjas/vim-python-pep8-indent",
    ft = { "py", "python" },
  }

  -- indent highlight
  -- use {
  --   "lukas-reineke/indent-blankline.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("me.configs.indent-blankline")
  --   end,
  -- }

  -- which-key
  use {
    "folke/which-key.nvim",
    config = function()
      require("me.configs.whichkey")
    end,
  }

  -- completion
  use {
    "ms-jpq/coq_nvim",
    branch = "coq",
    event = "InsertEnter",
    run = ":COQdeps",
    config = function()
      require("me.configs.coq").setup()
    end,
    requires = {
      { "ms-jpq/coq.artifacts", branch = "artifacts" },
      { "ms-jpq/coq.thirdparty", branch = "3p", module = "coq_3p" },
    },
    disable = false,
  }

  -- lsp fidget
  use {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup {
        -- grow_vertical, bouncing_bar, pipe, dots_scrolling
        text = { spinner = "dots_scrolling" },
        window = { winblend = 100 },
      }
    end,
  }

  -- Fuzzy files
  use {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.x",
    requires = { { "nvim-lua/plenary.nvim" } },
    cmd = "Telescope",
    config = function()
      require("me.configs.telescope-config")
    end,
  }

  -- catppuccin
  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("catppuccin").setup {
        flavour = "macchiato", -- mocha, macchiato, frappe, latte
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        integrations = {
          navic = {
            enabled = true,
          },
          indent_blankline = {
            enabled = true,
          },
        },
      }
      vim.cmd([[ colorscheme catppuccin ]])
    end,
  }

  -- themes:
  -- tokyonight
  -- use {
  --   "folke/tokyonight.nvim",
  --   config = function()
  --     require("tokyonight").setup {
  --       style = "storm",
  --       transparent = false,
  --       terminal_colors = true,
  --       styles = {
  --         comments = { italic = true },
  --         keywords = { italic = true },
  --         functions = { italic = true },
  --       },
  --       sidebars = { "qf", "vista", "terminal", "packer", "tagbar" },
  --       dim_inactive = false,
  --     }
  --     vim.cmd([[ colorscheme tokyonight ]])
  --   end,
  -- }

  -- kanagawa
  --[[ use({
		-- "rebelot/kanagawa.nvim",
		"/home/hh/dev/plugins/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				-- dimInactive = true,
				transparent = false,
				globalStatus = true,
			})
			vim.cmd("colorscheme kanagawa")
		end,
		disable = false,
	}) ]]

  -- startuptime
  use {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  }

  -- neo-tree . fileexplorer
  use {
    "nvim-neo-tree/neo-tree.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "NeoTreeRevealToggle", "Neotree" },
    config = function()
      require("me.configs.neotree-config")
    end,
  }

  -- explorer
  --[[ use {
    "luukvbaal/nnn.nvim",
    cmd = { "NnnPicker", "NnnExplorer" },
    config = function()
      require("nnn").setup {
        explorer = {
          cmd = "nnn -G",
          width = 34,
          side = "botright", -- or "topleft", location of the explorer window
        },
        picker = {
          cmd = "nnn -G",
        },
        auto_close = true,
        replace_netrw = "explorer",
      }
    end,
  } ]]

  -- statusline - tabline
  use {
    "tamton-aquib/staline.nvim",
    config = function()
      require("me.ui.staline-simple")
    end,
  }

  -- Plugin to manipulate character pairs quickly
  use {
    "machakann/vim-sandwich",
    event = "VimEnter",
  }

  -- vim-matchup - It extends vim's % key
  use {
    "andymass/vim-matchup",
    event = "CursorMoved",
  }

  -- vim-move
  --[[ use {
    "matze/vim-move",
    config = function()
      local g = vim.g
      g.move_key_modifier = "S-M"
      g.move_key_modifier_visualmode = "S-M"
    end,
  } ]]

  -- colorizer
  use {
    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
  }

  -- toggleterm
  use {
    "akinsho/toggleterm.nvim",
    config = function()
      require("me.configs.terminal")
    end,
  }

  -- leap.nvim
  use {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
  }

  -- better buffer del
  use {
    "ojroques/nvim-bufdel",
    cmd = "BufDel",
  }

  -- buffer list
  use {
    "matbme/JABS.nvim",
    cmd = "JABSOpen",
    config = function()
      require("jabs").setup {
        position = "center",
        width = 80,
        border = "rounded",
      }
    end,
  }

  -- syntax highlight sxhkdrc
  use {
    "baskerville/vim-sxhkdrc",
    ft = { "sxhkdrc" },
  }

  -- ksyntax highlight kitty.conf
  use {
    "fladson/vim-kitty",
    ft = { "kitty" },
  }

  -- sessions
  use {
    "tpope/vim-obsession",
  }

  -- gitsigns
  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    cmd = "Gitsigns",
    config = function()
      require("me.configs.gitsigns")
    end,
  }

  -- hlargs.nvim
  use {
    "m-demare/hlargs.nvim",
    config = function()
      require("hlargs").setup()
    end,
    after = "nvim-treesitter",
  }

  -- diffview
  use {
    "sindrets/diffview.nvim",
    requires = "nvim-lua/plenary.nvim",
  }

  -- neogit
  use {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    config = function()
      require("neogit").setup {
        integrations = {
          diffview = true,
        },
      }
    end,
  }

  -- null-ls
  -- use {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   requires = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("me.lsp.servers.null-ls")
  --   end,
  --   disable = false,
  -- }

  -- Tagbar
  use {
    "liuchengxu/vista.vim",
    config = function()
      local g = vim.g
      g.vista_sidebar_width = 40
    end,
  }

  -- lsp signature
  use {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    after = "nvim-lspconfig",
  }

  -- maximizer
  use {
    "szw/vim-maximizer",
    cmd = "MaximizerToggle",
    config = function()
      vim.g.maximizer_set_default_mapping = 1
    end,
  }

  -- wiki
  use {
    "vimwiki/vimwiki",
    ft = { "vimwiki", "markdown", "md" },
  }

  -- rest.nvim
  use {
    "NTBBloodbath/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    ft = { "rest", "http" },
    config = function()
      require("me.configs.rest")
    end,
  }

  -- typescript
  use {
    "jose-elias-alvarez/typescript.nvim",
  }

  -- inlay hints
  use {
    "lvimuser/lsp-inlayhints.nvim",
    config = function()
      require("lsp-inlayhints").setup()
    end,
  }

  --
  use {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
  }

  -- annotation Toolkit
  use {
    "danymat/neogen",
    config = function()
      require("neogen").setup {}
    end,
    cmd = "Neogen",
    requires = "nvim-treesitter/nvim-treesitter",
  }

  -- winbar
  use {
    "SmiteshP/nvim-navic",
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("me.lsp.navic").setup()
    end,
  }

  -- debugging with dap.
  use {
    {
      "mfussenegger/nvim-dap",
      module = "dapui",
      config = function()
        require("me.configs.dap").setup()
      end,
      requires = "folke/which-key.nvim",
    },
    {
      "rcarriga/nvim-dap-ui",
      requires = { "mfussenegger/nvim-dap" },
    },
    {
      "theHamsta/nvim-dap-virtual-text",
      requires = { "mfussenegger/nvim-dap" },
    },
    {
      "nvim-telescope/telescope-dap.nvim",
      requires = {
        { "mfussenegger/nvim-dap" },
        { "nvim-telescope/telescope.nvim" },
      },
    },
  }

  use {
    "Abstract-IDE/penvim",
    config = function()
      require("penvim").setup()
    end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
