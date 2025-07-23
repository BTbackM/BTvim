local keymaps = require "bt.config.keymaps"
local settings = require "bt.config.settings"

keymaps.load()
settings.load()
require "bt.config.autocmds"
