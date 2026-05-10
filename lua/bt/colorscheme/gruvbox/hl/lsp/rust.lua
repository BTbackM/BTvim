local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["rustFoldBraces"] = {
		fg = colors["custom"].black,
		bold = false,
		italic = false,
	},
	["rustKeyword"] = {
		fg = colors["custom"].red,
		bold = true,
		italic = false,
	},
	["@lsp.type.decorator.rust"] = {
		fg = colors["custom"].purple,
		bold = false,
		italic = false,
	},
	["rustModPath"] = { link = "@lsp.type.namespace.rust" },
	["@lsp.type.operator.rust"] = {
		fg = colors["custom"].red,
		bold = false,
		italic = false,
	},
	["rustModPathSep"] = { link = "@lsp.type.operator.rust" },
	["@lsp.type.attributeBracket.rust"] = { link = "@lsp.type.operator.rust" },
	["rustFuncCall"] = {
		fg = colors["light"].aqua,
		bold = false,
		italic = false,
	},
	["rustMacro"] = {
		fg = colors["light"].aqua,
		bold = false,
		italic = false,
	},
}
