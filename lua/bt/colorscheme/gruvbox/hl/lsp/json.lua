local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["jsonKeyword"] = {
		fg = colors["custom"].blue,
		bold = false,
		italic = false,
	},
	["jsonBoolean"] = {
		fg = colors["custom"].purple,
		bold = false,
		italic = false,
	},
	["jsonString"] = { link = "@string" },
}
