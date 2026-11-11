local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["@lsp.type.method.lua"] = {
		fg = colors["custom"].blue,
		bold = false,
		italic = false,
	},
	["@boolean.lua"] = {
		fg = colors["custom"].dark_purple,
		bold = false,
		italic = false,
	},
}
