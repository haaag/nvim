local M = {}

M.highlight_document = function(client)
  if client.server_capabilities.document_highlight then
    local lsp_document_highlight = vim.api.nvim_create_augroup("_lsp_document_highlight", { clear = true })

    vim.api.nvim_create_autocmd("CursorHold", {
      group = lsp_document_highlight,
      pattern = "<buffer>",
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd("CursorMoved", {
      group = lsp_document_highlight,
      pattern = "<buffer>",
      callback = vim.lsp.buf.clear_references,
    })
  end
end

M.diagnostic_pop = function(bufnr)
  local popup = vim.api.nvim_create_augroup("_popup", { clear = true })

  vim.api.nvim_create_autocmd("CursorHold", {
    group = popup,
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always",
        prefix = " ",
      }

      if not vim.b.diagnostics_pos then
        vim.b.diagnostics_pos = { nil, nil }
      end

      local cursor_pos = vim.api.nvim_win_get_cursor(0)
      if
        (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
        and #vim.diagnostic.get() > 0
      then
        vim.diagnostic.open_float(nil, opts)
      end

      vim.b.diagnostics_pos = cursor_pos
    end,
  })
end

M.lsp_signature = function(bufnr)
  local signature_present, lsp_signature = pcall(require, "lsp_signature")
  if signature_present then
    lsp_signature.on_attach({
      bind = true,
      hint_enable = false,
      hint_prefix = " ",
      handler_opts = {
        border = "rounded",
      },
    }, bufnr)
  end
end

M.lsp_format = function(client)
  local lsp_present, lsp_format = pcall(require, "lsp-format")
  if lsp_present then
    lsp_format.on_attach(client)
  else
    print("No lsp-format")
  end
end

M.is_truncated = function(_, width)
  local current_width = vim.api.nvim_win_get_width(0)
  return current_width < width
end

M.get_git_status = function(self)
  -- use fallback because it doesn't set this variable on the initial `BufEnter`
  local signs = vim.b.gitsigns_status_dict or { head = "", added = 0, changed = 0, removed = 0 }
  local is_head_empty = signs.head ~= ""

  if self:is_truncated(self.trunc_width.git_status) then
    return is_head_empty and string.format("  %s ", signs.head or "") or ""
  end

  return is_head_empty
      and string.format(" +%s ~%s -%s |  %s ", signs.added, signs.changed, signs.removed, signs.head)
    or ""
end

M.lsp_status = function()
  local lsp = vim.lsp.util.get_progress_messages()[1]
  if lsp then
    local name = lsp.name or ""
    local msg = lsp.message or ""
    local percentage = lsp.percentage or 0
    local title = lsp.title or ""
    return string.format(" [%%<%s] %s %s (%s%%%%) ", name, title, msg, percentage)
  end

  return ""
end

M.load_navic = function(client, bufnr)
  local present, navic = pcall(require, "nvim-navic")
  if present then
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end
  end
end

M.setup = function(client, bufnr)
  require("me.lsp.keys").lsp_keys(bufnr)
  M.highlight_document(client)
  M.load_navic(client, bufnr)
  -- M.lsp_signature(bufnr)
  -- M.lsp_format(client)
end

return M
