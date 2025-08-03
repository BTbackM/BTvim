local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["@lsp.type.method.go"] = {
		fg = colors["custom"].blue,
		bold = true,
		italic = false,
	},
  ["@lsp.type.type.go"] = {
    fg = colors["custom"].dark_yellow,
    bold = true,
    italic = false,
  },
  ["@lsp.mod.readonly.go"] = {
    fg = colors["light"].aqua,
    bold = false,
    italic = false,
  },
  ["@lsp.mod.defaultLibrary.go"] = { link = "@keyword" },
  ["@lsp.mod.definition.go"] = {
    fg = colors["light"].blue,
    bold = false,
    italic = false,
  },
  ["@lsp.mod.signature.go"] = {
    fg = colors["custom"].blue,
    bold = false,
    italic = false,
  },
  ["@lsp.mod.struct.go"] = {
    fg = colors["custom"].dark_yellow,
    bold = true,
    italic = false,
  },
}
