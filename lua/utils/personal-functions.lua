local command = require('utils.functions')
local M = {}

M.toggle_stuff = function()
  command.cmd({
    "set relativenumber!",
    "set number!",
    "set laststatus=0 noshowmode noruler",
    "set showtabline=0",
    "set signcolumn=no",
  })
end
return M
