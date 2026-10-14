local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["@tag.html"] = {
		fg = colors["custom"].red,
		bold = true,
		italic = false,
	},
	["@tag.attribute.html"] = {
		fg = colors["custom"].blue,
		bold = false,
		italic = false,
	},
	["@string.special.url.html"] = {
		fg = colors["custom"].blue,
		bold = false,
		italic = false,
	},
	["@markup.link.label.html"] = { link = "@none" },
	["@constant.macro.razor"] = {
		fg = colors["light"].aqua,
		bold = true,
		italic = false,
	},
	["htmlEndTag"] = {
		fg = colors["custom"].black,
		bold = false,
		italic = false,
	},
	["htmlTag"] = {
		fg = colors["custom"].black,
		bold = false,
		italic = false,
	},
	["htmlTagName"] = { link = "@tag.html" },
	["htmlArg"] = { link = "@tag.attribute.html" },
}
