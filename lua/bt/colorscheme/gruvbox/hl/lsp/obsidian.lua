local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["ObsidianImportant"] = {
		fg = colors["custom"].dark_yellow,
		bold = true,
		italic = false,
	},
	["ObsidianDone"] = {
		fg = colors["custom"].blue,
		bold = true,
		italic = false,
	},
	["ObsidianTilde"] = {
		fg = colors["custom"].red,
		bold = true,
		italic = false,
	},
	["ObsidianTodo"] = {
		fg = colors["custom"].gray,
		bold = true,
		italic = false,
	},
	["ObsidianRightArrow"] = {
		fg = colors["light"].purple,
		bold = false,
		italic = false,
	},
	["ObsidianRefText"] = {
		fg = colors["custom"].red,
		bold = true,
		italic = false,
	},
	["@markup.strong"] = {
		fg = colors["custom"].blue,
		bold = true,
		italic = false,
	},
	["@keyword.directive.markdown"] = { link = "@string" },
}
