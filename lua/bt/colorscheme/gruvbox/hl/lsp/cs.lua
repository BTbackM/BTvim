local colors = require("bt.colorscheme.gruvbox.colors")

return {
	-- Class
	["@lsp.type.struct.cs"] = {
		fg = colors["custom"].dark_yellow,
		bold = true,
		italic = false,
	},
	["@lsp.type.recordClass.cs"] = { link = "@lsp.type.struct.cs" },
	["@lsp.typemod.class.static.cs"] = {
		fg = colors["custom"].orange,
		bold = false,
		italic = false,
	},
  ["@lsp.type.class.cs"] = { link = "@lsp.type.struct.cs" },

	-- Function
	["@lsp.type.method.cs"] = { link = "@function" },
	["@lsp.type.extensionMethodName.cs"] = { link = "@function" },
  ["@lsp.type.extensionMethod.cs"] = { link = "@function" },

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
