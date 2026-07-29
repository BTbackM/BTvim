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
	["pythonInclude"] = { link = "@keyword" },
	["@lsp.type.namespace.python"] = {
		fg = colors["custom"].purple,
		bold = false,
		italic = false,
	},
	["pythonStatement"] = { link = "@keyword" },
	["pythonNumber"] = {
		fg = colors["custom"].purple,
		bold = false,
		italic = false,
	},
	["pythonRepeat"] = { link = "@keyword" },
	["pythonConditional"] = { link = "@keyword" },
	["pythonOperator"] = { link = "@keyword" },
	["pythonEscape"] = {
		fg = colors["light"].aqua,
		bold = false,
		italic = false,
	},
	["pythonBoolean"] = {
		fg = colors["custom"].purple,
		bold = false,
		italic = false,
	},
}
