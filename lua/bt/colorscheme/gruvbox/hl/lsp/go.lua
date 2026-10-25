local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["@lsp.type.method.go"] = {
		fg = colors["custom"].blue,
		bold = true,
		italic = false,
	},
	["@lsp.type.type.go"] = {
		fg = colors["custom"].yellow,
		bold = true,
		italic = false,
	},
	["@lsp.mod.readonly.go"] = {
		fg = colors["custom"].neutral_blue,
		bold = false,
		italic = false,
	},
	["@lsp.mod.defaultLibrary.go"] = { link = "@keyword" },
	["@lsp.mod.signature.go"] = {
		fg = colors["custom"].blue,
		bold = false,
		italic = false,
	},
	["@lsp.typemod.function.definition.go"] = { link = "@function" },
	["@lsp.typemod.method.definition.go"] = { link = "@function" },
	["@lsp.typemod.type.struct.go"] = {
		fg = colors["custom"].yellow,
		bold = true,
		italic = false,
	},
	["@lsp.typemod.variable.definition.go"] = { link = "@variable.go" },
	["@lsp.typemod.variable.struct.go"] = { link = "@variable.go" },
	["@lsp.type.namespace.go"] = {
		fg = colors["custom"].dark_pink,
		bold = false,
		italic = false,
	},
	["@lsp.type.number.go"] = {
		fg = colors["light"].aqua,
		bold = false,
		italic = false,
	},
	["@lsp.type.property.go"] = {
		fg = colors["custom"].dark_blue,
		bold = false,
		italic = false,
	},
	["@lsp.type.parameter.go"] = { link = "GruvboxFg1" },
	["@lsp.mod.definition.go"] = {},
	["@lsp.mod.struct.go"] = {
		fg = colors["custom"].dark_blue,
		bold = false,
		italic = false,
	},
}
