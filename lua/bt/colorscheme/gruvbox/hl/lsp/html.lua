local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["@tag.html"] = {
		fg = colors["custom"].red,
		bold = true,
		italic = false,
	},
	["@tag.attribute.html"] = {
		fg = colors["custom"].blue,
		bold = true,
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
}
