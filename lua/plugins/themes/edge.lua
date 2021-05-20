local g = vim.g

-- g.edge_style = 'aura'

-- To enable italic in this color scheme, set this option to `1`.
g.edge_enable_italic = 1

-- By default, italic is enabled in `Comment`. To disable italic in `Comment`,
-- set this option to `1`.
g.edge_disable_italic_comment = 1

-- By default, the background color of sign column is different from normal text.
-- If you want to make it the same as normal text, set this option to `'none'`.
-- Available values: `'default'`, `'none'`
-- Default value: `'default'`
g.edge_sign_column_background = 'none'

-- Whether to highlight the background of error/warning/info/hint text.
-- Available values: `0`, `1`
-- Default value: `0`
g.edge_diagnostic_text_highlight = 0

-- Some plugins support highlighting error/warning/info/hint lines, but this
-- feature is disabled by default in this color scheme. To enable this feature,
-- set this option to `1`.
g.edge_diagnostic_line_highlight = 0

-- Some plugins can highlight the word under current cursor, you can use this
-- option to control their behavior.
-- Available values: `'grey background'`, `'bold'`, `'underline'`, `'italic'`
-- Default value: `'grey background'` when not in transparent mode, `'bold'`
-- when in transparent mode.
g.edge_current_word = 'bold'

vim.cmd('colorscheme edge')
