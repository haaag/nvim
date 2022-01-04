local impatient = require('impatient')
impatient.enable_profile()

vim.lsp.set_log_level("debug")
--
-- Do not source the default filetype.vim
vim.g.did_load_filetypes = 1

local modules = {
    "general",
	"keys",
	"lsp",
	"plugins.ui",
	"plugins"
}

for i = 1, #modules, 1 do
    pcall(require, modules[i])
end
