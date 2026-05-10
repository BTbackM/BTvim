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
	-- New TS HL Groups
	["TSType"] = {
		fg = colors["custom"].dark_yellow,
		bold = true,
		italic = false,
	},
	["TSPunctuation"] = {
		fg = colors["custom"].black,
		bold = false,
		italic = false,
	},

	["typescriptMember"] = { link = "@variable" },
  ["typescriptPredefinedType"] = {
    fg = colors["custom"].red,
    bold = true,
    italic = false,
  },
  ["typescriptIdentifier"] = { link = "@keyword" },
	["typescriptVariable"] = { link = "@keyword" },
	["typescriptImport"] = { link = "@keyword" },
	["typescriptImportType"] = { link = "TSType" },
	["typescriptClassKeyword"] = { link = "@keyword" },
  ["typescriptOperator"] = { link = "@keyword" },
	["typescriptExport"] = { link = "@keyword" },
	["typescriptDefault"] = { link = "@keyword" },
	["typescriptParens"] = { link = "TSPunctuation" },
	["typescriptBraces"] = { link = "TSPunctuation" },
	["typescriptBinaryOp"] = { link = "TSPunctuation" },
	["typescriptArrowFunc"] = {
		fg = colors["custom"].red,
		bold = false,
		italic = false,
	},
	["typescriptTemplateSB"] = {
		fg = colors["custom"].red,
		bold = false,
		italic = false,
	},
	["typescriptNumber"] = {
		fg = colors["custom"].purple,
		bold = false,
		italic = false,
	},
	["@lsp.type.interface.typescript"] = { link = "TSType" },
	["@lsp.type.member.typescript"] = {
		fg = colors["light"].aqua,
		bold = false,
		italic = false,
	},
	["@lsp.type.class.typescript"] = { link = "@type.tsx" },
  ["@lsp.type.parameter.typescript"] = {
    fg = colors["light"].aqua,
    bold = false,
    italic = false,
  }
}
