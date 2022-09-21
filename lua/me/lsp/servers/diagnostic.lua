-- diagnostic
local M = {}

M.load_diagnostic_config = function()
  -- local map = vim.keymap.set
  local icons = require("me.ui.styles").icons()

  local config = {
    virtual_text = false,
    -- virtual_text = { prefix = "" },
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })

  -- Custom Sings
  local signs = {
    Error = icons.lsp.error,
    Warn = icons.lsp.warn,
    Hint = icons.lsp.hint,
    Info = icons.lsp.info,
  }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "single",
    silent = true,
    focusable = false,
    close_events = { "InsertCharPre", "CursorMoved" },
  })

  -- mappings
  --[[ map("n", "[d", function()
		vim.diagnostic.goto_prev()
	end, { desc = "Prev diagnostic" })

	map("n", "]d", function()
		vim.diagnostic.goto_next()
	end, { desc = "Next diagnostic" })

	map("n", "[D", function()
		vim.diagnostic.open_float()
	end, { desc = "Float diagnostic" }) ]]
end

return M
