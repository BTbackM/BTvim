local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["option"] = {
		fg = colors["custom"].blue,
		bold = false,
		italic = false,
	},
	["shSet"] = {
		fg = colors["custom"].red,
		bold = true,
		italic = false,
	},
	["shSetOption"] = { link = "option" },
	["shOption"] = { link = "option" },
	["shDerefSimple"] = {
		fg = colors["custom"].blue,
		bold = false,
		italic = false,
	},
	["bashStatement"] = { link = "@keyword" },
	["shConditional"] = { link = "@keyword" },
	["shStatement"] = { link = "@keyword" },
	["shCommandSub"] = { link = "@keyword" },
	["Delimiter"] = {},
	["shDeref"] = {
		fg = colors["custom"].blue,
		bold = false,
		italic = false,
	},
	["shVariable"] = {
		fg = colors["custom"].dark_blue,
		bold = false,
		italic = false,
	},
}
