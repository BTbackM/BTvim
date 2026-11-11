local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["gitconfigSection"] = { link = "@keyword" },
	["gitconfigVariable"] = {
		fg = colors["custom"].dark_blue,
		bold = false,
		italic = false,
	},
	["gitconfigBoolean"] = {
		fg = colors["custom"].dark_purple,
		bold = false,
		italic = false,
	},
}
