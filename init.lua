-- vim.lsp.set_log_level("debug")
--
require("plugins.tools.impatient")

-- Do not source the default filetype.vim
vim.g.did_load_filetypes = 1

local modules = {
	"general",
	"keys",
	"lsp",
	"plugins",
}

for i = 1, #modules, 1 do
	pcall(require, modules[i])
end
