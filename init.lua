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
