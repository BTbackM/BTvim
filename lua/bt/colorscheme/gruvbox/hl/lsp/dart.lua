local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["@lsp.mod.annotation.dart"] = {
    fg = colors["light"].aqua,
		bold = true,
		italic = false,
	},
	["@lsp.type.method.dart"] = { link = "@function" },
  ["@lsp.type.class.dart"] = {
    fg = colors["custom"].dark_yellow,
    bold = true,
    italic = false,
  },
}
