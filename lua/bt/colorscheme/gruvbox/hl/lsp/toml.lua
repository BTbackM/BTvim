local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["tomlTable"] = {
		fg = colors["custom"].dark_pink,
		bold = true,
		italic = false,
	},
	["tomlKey"] = {
		fg = colors["custom"].dark_blue,
		bold = false,
		italic = false,
	},
}
