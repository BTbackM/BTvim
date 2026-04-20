local colors = require("bt.colorscheme.gruvbox.colors")

return {
	["@keyword.import.python"] = { link = "@keyword" },
  ["@lsp.type.class.python"] = {
    fg = colors["custom"].dark_yellow,
    bold = true,
    italic = false,
  },
  ["@lsp.type.method.python"] = {
    fg = colors["custom"].blue,
    bold = true,
    italic = false,
  },
}
