local colors = require("bt.colorscheme.gruvbox.colors")

return {
  ["@type.tsx"] = {
    fg = colors["custom"].dark_yellow,
    bold = true,
    italic = false,
  },
  ["@type.typescript"] = { link = "@type.tsx" },
  ["@keyword.import.tsx"] = {
    fg = colors["custom"].red,
    bold = true,
    italic = false,
  },
  ["@keyword.import.typescript"] = { link = "@keyword.import.tsx" },
  ["@tag.tsx"] = {
    fg = colors["custom"].red,
    bold = true,
    italic = false,
  },
  ["@lsp.type.namespace.typescriptreact"] = {
    fg = colors["custom"].purple,
    bold = true,
    italic = false,
  },
  ["@type.builtin.tsx"] = { link = "@keyword" },
  ["@lsp.type.interface.typescriptreact"] = {
    fg = colors["custom"].dark_yellow,
    bold = true,
    italic = false,
  },
  ["@boolean.tsx"] = {
    fg = colors["custom"].purple,
    bold = false,
    italic = false,
  },
  ["@number.tsx"] = { link = "@boolean.tsx" },
  ["@tag.delimiter.tsx"] = {
    fg = colors["custom"].black,
    bold = false,
    italic = false,
  },
  ["@tag.attribute.tsx"] = {
    fg = colors["custom"].blue,
    bold = false,
    italic = false,
  },
}
