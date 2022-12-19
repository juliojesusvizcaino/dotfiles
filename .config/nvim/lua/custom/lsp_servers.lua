local M = {}

local function tsserver(config)
  require('typescript').setup({ server = config })
end

M.tsserver = tsserver;

return M
