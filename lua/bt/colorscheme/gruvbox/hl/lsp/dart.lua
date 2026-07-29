local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["@lsp.type.method.dart"] = { link = "@function" },
	["@lsp.type.class.dart"] = {
		fg = colors["custom"].dark_yellow,
		bold = true,
		italic = false,
	},
	["@lsp.type.enum.dart"] = {
		fg = colors["custom"].dark_yellow,
		bold = true,
		italic = false,
	},
	["dartFunction"] = { link = "Normal" },
	["@lsp.mod.annotation.dart"] = {
		fg = colors["custom"].blue,
		bold = true,
		italic = false,
	},
	["@lsp.type.type.dart"] = {
		fg = colors["custom"].dark_yellow,
		bold = true,
		italic = false,
	},
}
