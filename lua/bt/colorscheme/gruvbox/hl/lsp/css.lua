local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["@type.css"] = {
		fg = colors["custom"].red,
		bold = true,
		italic = false,
	},
	["@property.css"] = {
		fg = colors["custom"].blue,
		bold = false,
		italic = false,
	},
	["@tag.css"] = {
		fg = colors["custom"].red,
		bold = true,
		italic = false,
	},
	["@keyword.directive.css"] = {
		fg = colors["light"].aqua,
		bold = true,
		italic = false,
	},
	["@number.css"] = {
		fg = colors["custom"].purple,
		bold = false,
		italic = false,
	},
  ["@number.float.css"] = { link = "@number.css" },
}
