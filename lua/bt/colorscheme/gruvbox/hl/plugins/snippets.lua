local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["snipKeyword"] = {
		fg = colors["custom"].red,
		bold = true,
		italic = false,
	},
	["snippet"] = {
		fg = colors["custom"].blue,
		bold = false,
		italic = false,
	},
	["placeHolder"] = {
		fg = colors["custom"].dark_pink,
		bold = false,
		italic = false,
	},
}
