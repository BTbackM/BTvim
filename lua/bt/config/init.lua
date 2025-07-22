local M = {}

function M.init()
  local keymaps = require("bt.config.keymaps")
  local settings = require("bt.config.settings")

  keymaps.load()
  settings.load()
end

return M
