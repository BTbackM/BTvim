local colors = require("bt.colorscheme.gruvbox.colors")

return {
	-- Functions
	["@function"] = {
		fg = colors["custom"].blue,
		bold = true,
		italic = false,
	},
	["@function.builtin"] = { link = "@function" },
	["@function.method"] = { link = "@function" },
	["@function.call"] = {
		fg = colors["light"].aqua,
		bold = false,
		italic = false,
	},
	["@function.method.call"] = { link = "@function.call" },

	--Keywords
	["@keyword"] = {
		fg = colors["custom"].red,
		bold = true,
		italic = false,
	},
	["@keyword.conditional"] = { link = "@keyword" },
	["@keyword.function"] = { link = "@keyword" },
	["@keyword.operator"] = { link = "@keyword" },
	["@keyword.repeat"] = { link = "@keyword" },
	["@keyword.return"] = { link = "@keyword" },

	-- Punctuation
	["@punctuation.bracket"] = {
		fg = colors["custom"].black,
		bold = false,
		italic = false,
	},
	["@constructor"] = { link = "@punctuation.bracket" },

	-- General
	["@string"] = {
		fg = colors["custom"].gray,
		bold = false,
		italic = true,
	},
	["@constant"] = {
		fg = colors["custom"].purple,
		bold = false,
		italic = false,
	},
	["@boolean"] = { link = "@constant" },

	-- Types
	["@type"] = {
		fg = colors["custom"].dark_yellow,
		bold = false,
		italic = false,
	},
	["@type.go"] = { link = "@type" },
	["@type.builtin.go"] = { link = "@type" },

	-- Link
	["@markup.link.label.markdown_inline"] = {
		fg = colors["custom"].orange,
		bold = true,
		italic = false,
	},

	-- YAML
	["@property.yaml"] = {
		fg = colors["custom"].blue,
		bold = true,
		italic = false,
	},

	-- SQL
	["@type.builtin.sql"] = {
		fg = colors["custom"].red,
		bold = true,
		italic = false,
	},
	["@number.sql"] = {
		fg = colors["custom"].purple,
		bold = false,
		italic = false,
	},
	["@number.float.sql"] = { link = "number.sql" },
	["@type.sql"] = {},
}
