-- Function for autocmds
------------------------
local U = {}
function U.define_augroups(definitions) -- {{{
	-- Create autocommand groups based on the passed definitions
	--
	-- The key will be the name of the group, and each definition
	-- within the group should have:
	--    1. Trigger
	--    2. Pattern
	--    3. Text
	-- just like how they would normally be defined from Vim itself
	for group_name, definition in pairs(definitions) do
		vim.cmd("augroup " .. group_name)
		vim.cmd("autocmd!")

		for _, def in pairs(definition) do
			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
			vim.cmd(command)
		end

		vim.cmd("augroup END")
	end
end

U.cmd = function(commands)
	for _, value in ipairs(commands) do
		vim.cmd(value)
	end
end

U.is_buffer_empty = function()
	-- Check whether the current buffer is empty
	return vim.fn.empty(vim.fn.expand("%:t")) == 1
end

U.has_width_gt = function(cols)
	-- Check if the windows width is greater than a given number of columns
	return vim.fn.winwidth(0) / 2 > cols
end

-- function U.has_width_gt(cols)
-- 	-- Check if the windows width is greater than a given number of columns
-- 	return vim.fn.winwidth(0) / 2 > cols
-- end

U.extract_hl = function(hl, fore)
	return ("#%06x"):format(vim.api.nvim_get_hl_by_name(hl, true)[fore and "background" or "foreground"] or 255)
end

return U
