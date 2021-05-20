-- Function for nvim files.
---------------------------
local HOME = tostring(os.getenv("HOME"))

local M = {}
M.search_dotfiles_vim = function()
    require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({
      previewer = false,
      winblend = 10,
      prompt_title = "< nvim >",
      cwd = HOME .. "/.dotfiles/.config/nvim/",
    }
  )
)
end

M.search_dotfiles = function()
    require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({
      prompt_title = "< dotfiles >",
      cwd = HOME .. "/.dotfiles/",
      find_command = {
        'fd',
        '--type',
        'f',
        '--hidden'
      }
    }
  )
)
end

M.search_backup = function()
    require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({
      prompt_title = "< dotfiles backup >",
      cwd = HOME .. "/bigarch/home/backup/rsync/.dotfiles/",
      find_command = {
        'fd',
        '-H',
        '-t',
        'f',
      }
    }
  )
)
end

M.search_dotfiles_vim_bk = function()
    require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({
      previewer = false,
      winblend = 10,
      prompt_title = "< nvim.bk >",
      cwd = HOME .. "/.dotfiles/.config/nvim.bk/",
    }
  )
)
end
return M
