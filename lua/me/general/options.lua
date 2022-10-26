local HOME = tostring(os.getenv("HOME"))
local M = {}

M.load_options = function()
	vim.opt.clipboard = { "unnamed", "unnamedplus" } -- Yank and paste with the system clipboard
	vim.o.hidden = true -- Hides buffers instead of closing them hidden
	vim.o.swapfile = false -- No swapfile
	vim.o.pumheight = 25 -- Makes popup menu smaller
	vim.o.encoding = "utf-8" -- The encoding displayed
	vim.o.cmdheight = 0 -- More space for displaying messages
	vim.o.mouse = "a" -- Enable your mouse
	vim.o.splitbelow = true -- Horizontal splits will automatically be below
	vim.o.splitright = true -- Vertical splits will automatically be to the right
	vim.o.termguicolors = true --
	vim.o.conceallevel = 2 -- So that I can see `` in markdown files
	vim.o.laststatus = 3 -- Always display the status line
	vim.o.showtabline = 0 -- Always show tabs
	vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
	vim.o.undofile = true -- Allow undo mode after closing file
	vim.o.undodir = HOME .. "/.config/nvim/undodir" -- Set UndoDir
	vim.o.updatetime = 50 -- time required to update CursorHold hook
	vim.o.sidescroll = 1 -- Smoother sideways scrolling
	vim.o.dictionary = "/usr/share/dict/words" -- EN Dictionary - <CTRL-X><CTRL-K>
	vim.o.incsearch = true -- show where the pattern
	vim.o.inccommand = "split" -- substitute live update
	vim.o.hlsearch = false -- Disable Highlight search
	vim.o.lazyredraw = true -- faster scrolling

	vim.opt.tabstop = 4 -- Insert 4 spaces for a tab
	vim.opt.shiftwidth = 4 -- Change the number of space characters inserted for indentation
	vim.opt.softtabstop = 4
	vim.opt.expandtab = true -- Converts tabs to spaces
	vim.opt.smartindent = true -- Makes indenting smart

	vim.o.spellfile = HOME .. "/.config/nvim/spell/es.utf-8.add"
	vim.o.spelllang = "en_us,es" -- Spellchecker
	vim.o.autoindent = false -- Good auto indent
	vim.o.smarttab = true -- Makes tabbing smarter will realize you have 1 vs 4
	vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
	vim.o.number = true -- set numbered lines
	vim.o.relativenumber = true -- set relative numbered lines
	vim.o.numberwidth = 4 -- set number column width
	vim.o.cursorline = true -- highlight the current line
	vim.o.wrap = true -- Wrap Lines
	vim.o.scrolloff = 8 -- Minimal number of lines to keep above and below the cursor
	vim.o.sidescrolloff = 8 -- same as above, except for left and right, if nowrap is set
	vim.o.smartcase = true -- ignore case if search pattern is all lowercase, case-sensitive otherwise
	vim.g.python3_host_prog = HOME .. "/.local/debugpy/bin/python"
	vim.o.timeoutlen = 100
	-- vim.opt.spelllang = {'en_us','es'} -- Spellchecker
end

M.disable_builtin_plugs = function()
	local disable_plugs = {
		"gzip",
		"zip",
		"zipPlugin",
		"tar",
		"tarPlugin",
		"getscript",
		"getscriptPlugin",
		"vimball",
		"vimballPlugin",
		"2html_plugin",
		"matchit",
		"matchparen",
		"logiPat",
		"rrhelper",
		"spec",
		"netrw",
		"netrwPlugin",
		"netrwSettings",
	}
	for _, i in pairs(disable_plugs) do
		vim.g["loaded_" .. i] = 1
	end
end

return M
