local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["sshconfigKeyword"] = { link = "@keyword" },
	["sshconfigHostPort"] = {
		fg = colors["custom"].dark_pink,
		bold = false,
		italic = false,
	},
	["sshconfigMatch"] = {
		fg = colors["custom"].blue,
		bold = true,
		italic = false,
	},
	["sshconfigNumber"] = {
		fg = colors["custom"].dark_blue,
		bold = false,
		italic = false,
	},
}
