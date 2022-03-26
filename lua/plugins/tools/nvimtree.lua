-- Nvim Tree Lua Config
-----------------------
local present, _ = pcall(require, "nvim-tree.config")
if not present then
	return
end

local tree_cb = require("nvim-tree.config").nvim_tree_callback
local g = vim.g
local o = vim.o

o.termguicolors = true
g.nvim_tree_side = "left"
g.nvim_tree_width = 28
g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_allow_resize = 1
g.nvim_tree_root_folder_modifier = table.concat({
	":t:gs?$?/..",
	string.rep(" ", 1000),
	"?:gs?^??",
})
g.lsp_diagnostics = 1
g.nvim_tree_show_icons = { git = 1, folders = 1, files = 1 }

g.nvim_tree_icons = {
	default = " ",
	symlink = " ",
	git = {
		-- deleted = "",
		deleted = "",
		ignored = "◌",
		staged = "",
		unmerged = "",
		unstaged = "✗",
		-- unstaged = "",
		renamed = "➜ ",
		untracked = "★",
		-- unstaged = "",
		-- untracked = " "
	},
	-- folder = {default = " ", open = " ", symlink = " "}
	folder = {
		-- disable indent_markers option to get arrows working or if you want both arrows and indent then just add the arrow icons in front            ofthe default and opened folders below!
		arrow_open = "",
		arrow_closed = "",
		default = "",
		empty = "", -- 
		empty_open = "",
		open = "",
		symlink = "",
		symlink_open = "",
	},
}
--

require("nvim-tree").setup({
	require("nvim-tree").setup({
		actions = {
			open_file = {
				quit_on_open = true,
			},
		},
		disable_netrw = true,
		hijack_netrw = true,
		open_on_setup = false,
		ignore_ft_on_setup = {},
		auto_close = true,
		open_on_tab = false,
		hijack_cursor = false,
		update_cwd = true,
		git = {
			ignore = true,
		},
		diagnostics = {
			enable = true,
		},
		--[[ diagnostic = {
            enable = true,
            icons = { hint = "", info = "", warning = "", error = "" }
        }, --]]
		-- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
		update_focused_file = {
			enable = true,
			update_cwd = true,
			ignore_list = {},
		},
		filters = {
			custom = {
				".git",
				"node_modules",
				".cache",
				"__pycache__",
			},
			dotfiles = false,
		},
		system_open = {
			cmd = nil,
			args = {},
		},
		view = {
			width = 30,
			side = "left",
			auto_resize = false,
			mappings = {
				custom_only = false,
				list = {
					{ key = { "<CR>", "o", "<2-LeftMouse>" }, cb = tree_cb("edit") },
					{ key = { "<2-RightMouse>", "<C-]>" }, cb = tree_cb("cd") },
					{ key = "<C-v>", cb = tree_cb("vsplit") },
					{ key = "<C-x>", cb = tree_cb("split") },
					{ key = "<C-t>", cb = tree_cb("tabnew") },
					{ key = "<", cb = tree_cb("prev_sibling") },
					{ key = ">", cb = tree_cb("next_sibling") },
					{ key = "P", cb = tree_cb("parent_node") },
					{ key = "<BS>", cb = tree_cb("close_node") },
					{ key = "<S-CR>", cb = tree_cb("close_node") },
					{ key = "<Tab>", cb = tree_cb("preview") },
					{ key = "K", cb = tree_cb("first_sibling") },
					{ key = "J", cb = tree_cb("last_sibling") },
					{ key = "I", cb = tree_cb("toggle_ignored") },
					{ key = "H", cb = tree_cb("toggle_dotfiles") },
					{ key = "R", cb = tree_cb("refresh") },
					{ key = "a", cb = tree_cb("create") },
					{ key = "d", cb = tree_cb("remove") },
					{ key = "r", cb = tree_cb("rename") },
					{ key = "<C-r>", cb = tree_cb("full_rename") },
					{ key = "x", cb = tree_cb("cut") },
					{ key = "c", cb = tree_cb("copy") },
					{ key = "p", cb = tree_cb("paste") },
					{ key = "y", cb = tree_cb("copy_name") },
					{ key = "Y", cb = tree_cb("copy_path") },
					{ key = "gy", cb = tree_cb("copy_absolute_path") },
					{ key = "[c", cb = tree_cb("prev_git_item") },
					{ key = "]c", cb = tree_cb("next_git_item") },
					{ key = "-", cb = tree_cb("dir_up") },
					{ key = "q", cb = tree_cb("close") },
					{ key = "g?", cb = tree_cb("toggle_help") },
				},
			},
		},
	}),
})
