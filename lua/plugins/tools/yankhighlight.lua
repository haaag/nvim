-- TextYankHighlight
--------------------
local u = require('utils')

u.define_augroups(
  {_general_settings = {
      {'TextYankPost', '*', 'lua require(\'vim.highlight\').on_yank({higroup = \'IncSearch\', timeout = 200})'},
    },
  }
)
