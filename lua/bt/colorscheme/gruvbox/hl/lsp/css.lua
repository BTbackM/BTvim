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
	["cssClassName"] = {
		fg = colors["custom"].blue,
		bold = true,
		italic = false,
	},
	["cssIdentifier"] = {
		fg = colors["custom"].red,
		bold = true,
		italic = false,
	},
	["cssColorProp"] = {
		fg = colors["custom"].blue,
		bold = false,
		italic = false,
	},
	["cssFontProp"] = { link = "cssColorProp" },
	["cssBorderProp"] = { link = "cssColorProp" },
	["cssBoxProp"] = { link = "cssColorProp" },
	["cssBackgroundProp"] = { link = "cssColorProp" },
	["cssTransitionProp"] = { link = "cssColorProp" },
	["cssTextProp"] = { link = "cssColorProp" },
	["cssValueNumber"] = {
		fg = colors["custom"].purple,
		bold = false,
		italic = false,
	},
	["cssFontAttr"] = {
		fg = colors["custom"].purple,
		bold = false,
		italic = false,
	},
	["cssValueLength"] = {
		fg = colors["custom"].purple,
		bold = false,
		italic = false,
	},
	["cssTagName"] = {
		fg = colors["custom"].red,
		bold = true,
		italic = false,
	},
	["cssUnitDecorators"] = {
		fg = colors["custom"].black,
		bold = false,
		italic = false,
	},
	["cssCustomProp"] = {
		fg = colors["custom"].blue,
		bold = false,
		italic = false,
	},
	["cssMediaAttr"] = {
		fg = colors["custom"].purple,
		bold = false,
		italic = false,
	},
	["cssMediaProp"] = {
		fg = colors["custom"].red,
		bold = 0,
		italic = 0,
	},
	["cssPseudoClassId"] = {
		fg = colors["custom"].red,
		bold = true,
		italic = false,
	},
	["cssBraces"] = {
		fg = colors["custom"].black,
		bold = false,
		italic = false,
	},
	["cssAtRule"] = {
		fg = colors["light"].aqua,
		bold = true,
		italic = false,
	},
	["cssFunctionName"] = {
		fg = colors["custom"].blue,
		bold = true,
		italic = false,
	},
	["cssUIProp"] = {
		fg = colors["custom"].blue,
		bold = false,
		italic = false,
	},
	["cssPageProp"] = {
		fg = colors["custom"].blue,
		bold = false,
		italic = true,
	},
}
