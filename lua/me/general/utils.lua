local M = {}

M.toggle_numbers_mode = function()
  local wo = vim.wo

  if wo.relativenumber then
    wo.number = false
    wo.relativenumber = false
  else
    wo.number = true
    wo.relativenumber = true
  end

end

return M
