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
      vim.highlight.on_yank { on_visual = true, timeout = 250 }
    end,
  })

  -- Fixes Autocomment
  api.nvim_create_autocmd({ "BufWinEnter" }, {
    group = misc,
    callback = function()
      vim.cmd("set formatoptions-=cro")
    end,
  })

  -- Use 'q' to quit from common plugins
  api.nvim_create_autocmd({ "FileType" }, {
    group = misc,
    pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "startuptime" },
    command = [[nnoremap <buffer><silent> q :quit<CR>]],
  })

  -- COQ start
  api.nvim_create_autocmd({ "VimEnter" }, {
    group = misc,
    pattern = "*",
    callback = function()
      vim.cmd("COQnow -s")
    end,
  })

  -- Enable spell checking for certain file types
  --[[ api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
		pattern = { "*.txt", "*.md", "*.tex" },
		callback = function()
			vim.opt.spell = true
			vim.opt.spelllang = "en,es"
		end,
	}) ]]
end

return M
