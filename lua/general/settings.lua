local HOME = tostring(os.getenv("HOME"))

local M = {}

M.load_options = function()
    local set = vim.opt
    local default_options = {
        clipboard = "unnamed,unnamedplus", -- Yank and paste with the system clipboard
        hidden = true, -- Hides buffers instead of closing them hidden
        swapfile = false, -- No swapfile
        pumheight = 25, -- Makes popup menu smaller
        encoding = "utf-8", -- The encoding displayed
        ruler = true, -- Show the cursor position all the time
        cmdheight = 1, -- More space for displaying messages
        mouse = "a", -- Enable your mouse
        splitbelow = true, -- Horizontal splits will automatically be below
        splitright = true, -- Vertical splits will automatically be to the right
        termguicolors = true, -- xx
        conceallevel = 2, -- So that I can see `` in markdown files
        laststatus = 2, -- Always display the status line
        showtabline = 2, -- Always show tabs
        showmode = false, -- We don't need to see things like -- INSERT -- anymore
        undofile = true, -- Allow undo mode after closing file
        undodir = HOME .. "/.config/nvim/undodir", -- Set UndoDir
        updatetime = 100, -- Faster completion
        fileformat = "unix", -- Set fileformat
        sidescroll = 1, -- Smoother sideways scrolling
        dictionary = "/usr/share/dict/words", -- EN Dictionary - <CTRL-X><CTRL-K>
        incsearch = true, -- show where the pattern
        inccommand = "split", -- substitute live update
        hlsearch = false, -- Disable Highlight search
        lazyredraw = true, -- faster scrolling
        sts = 4, -- softtabstop
        sw = 4, -- shiftwidth
        tabstop = 4, -- Insert 4 spaces for a tab
        shiftwidth = 4, -- Change the number of space characters inserted for indentation
        spelllang = 'en_us,es', -- Spellchecker
        autoindent = true, -- Good auto indent
        smarttab = true, -- Makes tabbing smarter will realize you have 1 vs 4
        smartindent = true, -- Makes indenting smart
        expandtab = true, -- Converts tabs to spaces
        signcolumn = "yes", -- Always show the signcolumn, otherwise it would shift the text each time
        number = true, -- set numbered lines
        relativenumber = true, -- set relative numbered lines
        numberwidth = 4, -- set number column width
        cursorline = true, -- highlight the current line
        wrap = true, -- Wrap Lines
        scrolloff = 8, -- Minimal number of lines to keep above and below the cursor
        sidescrolloff = 8 -- same as above, except for left and right, if nowrap is set

    }
    for k, v in pairs(default_options) do set[k] = v end

    -- completion global settings
    vim.o.completeopt = "menuone,noselect"

end

    M.disable_builtin_plugs = function()
        -- disable built-in plugins:
        local disable_plugs = {
            'loaded_gzip',
            'loaded_tar',
            'loaded_tarPlugin',
            'loaded_zipPlugin',
            'loaded_2html_plugin',
            'loaded_matchit',
            'loaded_matchparen',
            'loaded_spec'
            -- 'loaded_netrw'
            -- 'loaded_netrwPlugin'
        }

        for _, i in pairs(disable_plugs) do
            vim.g['loaded_' .. i] = 1
        end
    end

return M
