local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["zshCommands"] = { link = "@keyword" },
	["zshVariableDef"] = {
		fg = colors["custom"].dark_blue,
		bold = false,
		italic = false,
	},
	["zshDeref"] = {
		fg = colors["custom"].blue,
		bold = false,
		italic = false,
	},
	["zshConditional"] = { link = "@keyword" },
}
