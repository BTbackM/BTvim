local colors = require("bt.colorscheme.gruvbox.colors")

return {
  ["@keyword.import.kotlin"] = { link = "@keyword" },
  ["@_import.kotlin"] = {
    fg = colors["custom"].purple,
    bold = false,
    italic = false,
  },
  ["@type.kotlin"] = {
    fg = colors["custom"].dark_yellow,
    bold = true,
    italic = false,
  },
  ["@lsp.type.method.kotlin"] = { link = "@function" },
  ["@variable.builtin.kotlin"] = { link = "@keyword" },
}
