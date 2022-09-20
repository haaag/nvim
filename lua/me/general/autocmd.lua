local M = {}

M.load_autocmd = function()
  local api = vim.api
  local cmd = vim.cmd
  local misc = vim.api.nvim_create_augroup("Misc", { clear = true })

  -- Update binds when sxhkdrc is updated.
  api.nvim_create_autocmd("BufWritePost", {
    group = misc,
    pattern = "*sxhkdrc",
    command = "!pkill -USR1 sxhkd",
  })

  -- Run xrdb whenever Xdefaults or Xresources are updated.
  api.nvim_create_autocmd("BufWritePost", {
    group = misc,
    pattern = { "xdefaults", "Xresources" },
    command = "!xrdb %",
  })

  -- Automatically deletes all trailing whitespace on save.
  api.nvim_create_autocmd("BufWritePre", {
    group = misc,
    pattern = "*",
    callback = function()
      cmd([[ %s/\s\+$//e ]])
    end,
  })

  -- Highlight on Yank
  api.nvim_create_autocmd("TextYankPost", {
    group = misc,
    callback = function()
      vim.highlight.on_yank({ on_visual = true, timeout = 150 })
    end,
  })

end


return M
