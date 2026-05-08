local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["rustFoldBraces"] = {
		fg = colors["custom"].black,
		bold = false,
		italic = false,
	},
	["rustKeyword"] = {
		fg = colors["custom"].red,
		bold = true,
		italic = false,
	},
}
