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

-- vim.cmd([[ au ColorScheme * hi Normal ctermbg=NONE guibg=NONE ]])
-- vim.cmd([[ au ColorScheme * highlight! link FloatBorder Normal ]])
-- vim.cmd([[ au ColorScheme * hi TelescopeBorder ctermbg=NONE guibg=NONE ]])
-- vim.cmd('hi! link MiniIndentscopeSymbol Whitespace')
