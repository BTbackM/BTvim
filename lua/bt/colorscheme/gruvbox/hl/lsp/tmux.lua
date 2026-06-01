local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["tmuxKey"] = { link = "@string" },
	["tmuxCommands"] = {
		fg = colors["custom"].blue,
		bold = false,
		italic = false,
	},
	["tmuxOptions"] = {
		fg = colors["custom"].red,
		bold = false,
		italic = false,
	},
	["tmuxFlags"] = {
		fg = colors["custom"].purple,
		bold = false,
		italic = false,
	},
	["tmuxNumber"] = {
		fg = colors["custom"].purple,
		bold = false,
		italic = false,
	},
	["tmuxEnums"] = {
		fg = colors["custom"].purple,
		bold = false,
		italic = false,
	},
}
