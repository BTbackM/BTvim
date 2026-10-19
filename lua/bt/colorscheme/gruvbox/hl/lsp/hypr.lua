local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["hyprCommand"] = {
		fg = colors["custom"].blue,
		bold = false,
		italic = false,
	},
	["hyprCategoryD"] = {
		fg = colors["custom"].red,
		bold = true,
		italic = false,
	},
	["hyprNumber"] = {
		fg = colors["custom"].purple,
		bold = false,
		italic = false,
	},
	["hyprBoolean"] = {
		fg = colors["custom"].purple,
		bold = false,
		italic = false,
	},
	["hyprModifier"] = {
		fg = colors["custom"].red,
		bold = true,
		italic = false,
	},
}
