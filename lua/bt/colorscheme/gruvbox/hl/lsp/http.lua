local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["String"] = { link = "@string" },
	["@constant.http"] = {
		fg = colors["custom"].red,
		bold = true,
		italic = false,
	},
	["@variable.http"] = {
		fg = colors["custom"].red,
		bold = true,
		italic = false,
	},
	["@constant.kulala_http"] = {
		fg = colors["custom"].red,
		bold = true,
		italic = false,
	},
	["@variable.kulala_http"] = {
		fg = colors["light"].aqua,
		bold = false,
		italic = false,
	},
	["@punctuation.bracket.kulala_http"] = { link = "@punctuation.bracket" },
	["@string.special.url.kulala_http"] = { link = "@property" },
	["@character.special.kulala_http"] = {},
}
