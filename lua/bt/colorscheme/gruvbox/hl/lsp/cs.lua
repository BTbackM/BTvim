local colors = require("bt.colorscheme.gruvbox.colors")

return {
	-- Class
	["class.cs"] = {
		fg = colors["custom"].yellow,
		bold = true,
		italic = false,
	},
	["@lsp.type.struct.cs"] = { link = "class.cs" },
	["@lsp.type.interface.cs"] = {
		fg = colors["custom"].dark_pink,
		bold = false,
		italic = false,
		nocombine = true,
	},
	["@lsp.type.recordClass.cs"] = { link = "@lsp.type.struct.cs" },
	["@lsp.type.class.cs"] = { link = "@lsp.type.struct.cs" },
	["@lsp.typemod.class.static.cs"] = {
		fg = colors["custom"].dark_pink,
		bold = false,
		italic = false,
		nocombine = true,
	},

	-- Function
	["@lsp.type.method.cs"] = { link = "@function" },
	["@lsp.type.extensionMethodName.cs"] = { link = "@function" },
	["@lsp.type.extensionMethod.cs"] = { link = "@function" },
	["@lsp.typemod.method.static.cs"] = {
		fg = colors["custom"].blue,
		bold = false,
		italic = false,
		nocombine = true,
	},

	-- General
	["@lsp.type.number.cs"] = {
		fg = colors["custom"].purple,
		bold = false,
		italic = false,
	},
	["@lsp.type.identifier.cs"] = { link = "@function" },
	["@lsp.type.parameter.cs"] = { link = "GruvboxFg1" },
	["@lsp.type.controlKeyword.cs"] = { link = "@keyword" },
	["@lsp.type.property.cs"] = {
		fg = colors["custom"].dark_blue,
		bold = false,
		italic = false,
	},
}
