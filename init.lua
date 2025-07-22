local config = require("bt.config")
config.init()

local plugins = require("bt.plugins")
plugins.init()
plugins.load()
