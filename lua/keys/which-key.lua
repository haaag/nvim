-- WhichKey
local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	return
end

-- setup: {{{

vim.g.maplocalleader = ","

wk.setup({
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 10, -- how many suggestions should be shown in the list?
		},
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = false, -- bindings for prefixed with g
		},
	},
	-- operators = {gc = "Comments"},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 15, -- spacing between columns
		align = "center", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = { i = { "j", "k" }, v = { "j", "k" } },
})
-- }}}

-- no <leader>
wk.register({
	["<F2>"] = { "<cmd>Vista!!<CR>", "tagbar" },
	["<C-F>"] = { "<cmd>Telescope find_files<CR>", "find files" },
	["bg"] = {
		'<cmd>lua require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({hidden = true, winblend = 10, previewer = false}))<CR>',
		"buffer list",
	},
})

-- old: {{{
--[[ wk.register({
	["="] = { "<cmd>lua vim.lsp.buf.format{ async = true }<CR>", "formatting" },
	["o"] = { "<cmd>only<CR>", "only buffer" },
	["O"] = { "<cmd>MaximizerToggle<CR>", "MaximizerToggle" },
}, { prefix = "<leader>" }) ]]

--[[ -- quickfix
wk.register({
	q = {
		name = "+quickfix",
		q = {
			'<cmd>lua require("funcs.quicklist").create_from_buffer()<CR>',
			"from buffer",
		},
		G = { "<cmd>clast<CR>", "last" },
		g = { "<cmd>cfirst<CR>", "first" },
		c = { "<cmd>cclose<CR>", "close" },
		o = { "<cmd>copen<CR>", "open" },
	},
}, { prefix = "<leader>" })

-- buffers
wk.register({
	b = {
		name = "+buffer",
		c = { "<cmd>ColorizerToggle<CR>", "ColorizerToggle" },
		d = { "<cmd>BufDel<CR>", "close" },
		g = { "<cmd>BufferLinePick<CR>", "choose buffer" },
		l = {
			'<cmd>lua require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({hidden = true, winblend = 10, previewer = false}))<CR>',
			"buffer list",
		},
		o = { "<cmd>only<CR>", "only buffer" },
		O = { "<cmd>MaximizerToggle<CR>", "MaximizerToggle" },
		y = { "<cmd>%y<CR>", "Make yank all the buffer" },
	},
}, { prefix = "<leader>" }) ]]

-- wiki
--[[ wk.register({
	S = {
		name = "+wiki",
		p = { "<cmd>e ~/.config/nvim/lua/plugins/init.lua<CR>", "plugins" },
		z = { "<cmd>e ~/.config/zsh/.zshrc<CR>", "zshrc" },
		Z = { "<cmd>e ~/apps/vimwiki/zoho/Zoho.md<CR>", "zohowiki" },
		b = { "<cmd>e ~/apps/vimwiki/cookbook/cookbook.md<CR>", "cookbook" },
		v = { "<cmd>e ~/apps/vimwiki/index.md<CR>", "VimWiki" },
	},
}, { prefix = "<leader>" }) ]]

-- lsp and syntax
--[[ wk.register({
	l = {
		name = "+lsp",
		a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "code action" },
		c = { "<cmd>Telescope lsp_references<CR>", "references" },
		d = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "declaration" },
		f = { "<cmd>lua vim.lsp.buf.format{ async = true }<CR>", "formatting" },
		k = { "<cmd>lua vim.lsp.buf.hover()<CR>", "hover" },
		r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
		t = { "<cmd>TodoTelescope<CR>", "TodoTelescope" },
	},
}, { prefix = "<leader>" }) ]]

-- telescope
--[[ wk.register({
	f = {
		name = "+telescope",
		c = { "<cmd>Telescope zoxide list<CR>", "zoxide" },
		d = {
			'<cmd>lua require("plugins.tools.telescope-functions").search_dotfiles()<CR>',
			"dotfiles",
		},
		g = {
			'<cmd>lua require("telescope.builtin").grep_string({ search = vim.fn.input("  RG ❯ ")})<CR>',
			"search in files",
		},
		G = {
			'<cmd>lua require("plugins.tools.telescope-functions").projects_files()<CR>',
			"git projects",
		},
		h = { "<cmd> Telescope help_tags<CR>", "help tags" },
		l = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "search in buffer" },

		w = {
			'<cmd>lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>',
			"grep current word",
		},
		u = {
			'<cmd>lua require("plugins.tools.telescope-functions").dotfiles_nvim_bk()<CR>',
			"nvim.bk files",
		},

		o = { "<cmd>Telescope oldfiles theme=get_ivy<cr>", "recent opened" },
		v = {
			'<cmd>lua require("plugins.tools.telescope-functions").dotfiles_nvim_new()<CR>',
			"nvim_config",
		},
		z = {
			'<cmd>lua require("plugins.tools.telescope-functions").work_files_new()<CR>',
			"work files",
		},
	},
}, { prefix = "<leader>" }) ]]
-- }}}

-- mappings {{{
local mappings = {

	["="] = { "<cmd>lua vim.lsp.buf.format{ async = true }<CR>", "formatting" },
	["o"] = { "<cmd>only<CR>", "only buffer" },
	["O"] = { "<cmd>MaximizerToggle<CR>", "MaximizerToggle" },

	-- quickfix {{{
	q = {
		name = "+quickfix",
		q = {
			'<cmd>lua require("funcs.quicklist").create_from_buffer()<CR>',
			"from buffer",
		},
		G = { "<cmd>clast<CR>", "last" },
		g = { "<cmd>cfirst<CR>", "first" },
		c = { "<cmd>cclose<CR>", "close" },
		o = { "<cmd>copen<CR>", "open" },
	},
    -- }}}

	-- buffers {{{
	b = {
		name = "+buffer",
		c = { "<cmd>ColorizerToggle<CR>", "ColorizerToggle" },
		d = { "<cmd>BufDel<CR>", "close" },
		g = { "<cmd>BufferLinePick<CR>", "choose buffer" },
		l = {
			'<cmd>lua require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({hidden = true, winblend = 10, previewer = false}))<CR>',
			"buffer list",
		},
		o = { "<cmd>only<CR>", "only buffer" },
		O = { "<cmd>MaximizerToggle<CR>", "MaximizerToggle" },
		y = { "<cmd>%y<CR>", "Make yank all the buffer" },
	},
    -- }}}

	-- lsp {{{
	l = {
		name = "+lsp",
		a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "code action" },
		c = { "<cmd>Telescope lsp_references<CR>", "references" },
		d = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "declaration" },
		f = { "<cmd>lua vim.lsp.buf.format{ async = true }<CR>", "formatting" },
		k = { "<cmd>lua vim.lsp.buf.hover()<CR>", "hover" },
		r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
		t = { "<cmd>TodoTelescope<CR>", "TodoTelescope" },
	},
    -- }}}

	-- files {{{
	f = {
		name = "+telescope",
        a = {"<cmd>lua require('plugins.tools.telescope-functions').nvim_cache_file()<CR>", "nvim cache"},
		c = { "<cmd>Telescope zoxide list<CR>", "zoxide" },
		d = {
			'<cmd>lua require("plugins.tools.telescope-functions").search_dotfiles()<CR>',
			"dotfiles",
		},
		g = {
			'<cmd>lua require("telescope.builtin").grep_string({ search = vim.fn.input("  RG ❯ ")})<CR>',
			"search in files",
		},
		G = {
			'<cmd>lua require("plugins.tools.telescope-functions").projects_files()<CR>',
			"git projects",
		},
		h = { "<cmd> Telescope help_tags<CR>", "help tags" },
		l = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "search in buffer" },

		w = {
			'<cmd>lua require("telescope.builtin").grep_string { search = vim.fn.expand("<cword>") }<CR>',
			"grep current word",
		},
		u = {
			'<cmd>lua require("plugins.tools.telescope-functions").dotfiles_nvim_bk()<CR>',
			"nvim.bk files",
		},

		o = { "<cmd>Telescope oldfiles theme=get_ivy<cr>", "recent opened" },
		v = {
			'<cmd>lua require("plugins.tools.telescope-functions").dotfiles_nvim_new()<CR>',
			"nvim_config",
		},
		z = {
			'<cmd>lua require("plugins.tools.telescope-functions").work_files_new()<CR>',
			"work files",
		},
	},
    -- }}}

    -- vimwiki {{{
	S = {
		name = "+wiki",
		p = { "<cmd>e ~/.config/nvim/lua/plugins/init.lua<CR>", "plugins" },
		z = { "<cmd>e ~/.config/zsh/.zshrc<CR>", "zshrc" },
		Z = { "<cmd>e ~/apps/vimwiki/zoho/Zoho.md<CR>", "zohowiki" },
		b = { "<cmd>e ~/apps/vimwiki/cookbook/cookbook.md<CR>", "cookbook" },
		v = { "<cmd>e ~/apps/vimwiki/index.md<CR>", "VimWiki" },
	},
    -- }}}
}

local opts = {
	mode = "n",
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

wk.register(mappings, opts)

-- }}}

-- vim: fdm=marker fmr={{{,}}}:
