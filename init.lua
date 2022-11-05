local present_imp, impatient = pcall(require, "impatient")
if present_imp then
	impatient.enable_profile()
end

for _, source in ipairs({
	"me.general",
	"me.plugins",
	"me.lsp",
}) do
	local status_ok, fault = pcall(require, source)
	if not status_ok then
		vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
	end
end
