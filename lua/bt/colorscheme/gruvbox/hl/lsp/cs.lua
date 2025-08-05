local colors = require("bt.colorscheme.gruvbox.colors")

return {
	-- Class
	["@lsp.type.class.cs"] = {
		fg = colors["custom"].dark_yellow,
		bold = true,
		italic = false,
	},
	["@lsp.type.struct.cs"] = { link = "@lsp.type.class.cs" },

	-- Function
	["@lsp.type.method.cs"] = { link = "@function" },
	["@lsp.type.extensionMethodName.cs"] = { link = "@function" },

	-- General
	["@lsp.type.number.cs"] = {
		fg = colors["custom"].purple,
		bold = false,
		italic = false,
	},
	["@lsp.type.identifier.cs"] = { link = "@function" },
	["@lsp.type.parameter.cs"] = {
		fg = colors["light"].aqua,
		bold = false,
		italic = false,
	},
}
