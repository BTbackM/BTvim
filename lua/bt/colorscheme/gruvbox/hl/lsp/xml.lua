local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["xmlTag"] = {
		fg = colors["custom"].blue,
		bold = true,
		italic = false,
	},
	["xmlTagName"] = {
		fg = colors["custom"].blue,
		bold = false,
		italic = false,
	},
	["xmlAttrib"] = {
		fg = colors["custom"].red,
		bold = false,
		italic = false,
	},
}
