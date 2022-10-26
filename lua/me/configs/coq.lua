local M = {}

function M.setup()
  local icons = require("me.ui.styles").lsp()

  vim.g.coq_settings = {
    auto_start = "shut-up",
    keymap = {
      pre_select = false,
      jump_to_mark = "<c-y>",
    },
    display = {
      icons = {
        mode = "long",
        mappings = icons.kind,
      },
    },
    clients = {
      tags = { enabled = true, short_name = "tags" },
      tabnine = { enabled = true },
      tmux = { enabled = true, short_name = "tmux" },
      buffers = { same_filetype = true, short_name = "buf" },
      paths = { preview_lines = 3, short_name = "path" },
      lsp = { enabled = true, short_name = "lsp" },
      snippets = { enabled = true, short_name = "snip" },
      tree_sitter = {
        always_on_top = true,
        enabled = true,
        short_name = "ts",
      },
    },
  }

  --[[ pum = {
        source_context = { "[", "]" },
    }, ]]

  -- 3party sources
  require("coq_3p") {
    { src = "nvimlua", short_name = "api", conf_only = false }, -- Lua
    { src = "bc", short_name = "math", precision = 6 }, -- Calculator
    { src = "figlet", trigger = "!big" }, -- figlet command
    {
      src = "repl",
      sh = "zsh",
      shell = { p = "perl", n = "node" },
      max_lines = 99,
      deadline = 500,
      unsafe = { "rm", "poweroff", "mv" },
    },
  }
end

return M
