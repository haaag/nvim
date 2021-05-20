-- Personal Functions:
---------------------

local Command = {}

Command.cmd = function(commands)
  for _, value in ipairs(commands) do
    vim.cmd(value)
  end
end

Command.test = function()
  print("Test function")
end
return Command
