local colors = require "bt.colorscheme.gruvbox.colors"

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
		bold = true,
		italic = false,
	},
	["@boolean"] = { link = "@constant" },
}
