local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["@tag.astro"] = { link = "@keyword" },
	["@tag.delimiter.astro"] = {
		fg = colors["custom"].black,
		bold = false,
		italic = false,
	},
	["@tag.attribute.astro"] = {
		fg = colors["custom"].blue,
		bold = false,
		italic = false,
	},
	["@markup.heading.astro"] = {},
	["@markup.heading.1.astro"] = {},
	["@punctuation.special.astro"] = { link = "@punctuation.bracket" },
	["@string.special.url.astro"] = {
		fg = colors["light"].aqua,
		bold = false,
		italic = false,
	},
}
