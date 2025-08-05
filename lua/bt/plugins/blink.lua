if false then
	return {}
end

local opts = {
	keymap = {
		preset = "default",
	},
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = {
		menu = {
			draw = {
				columns = {
					{ "kind_icon" },
					{ "label", "label_description", gap = 1 },
					{ "kind" },
					{ "source_name" },
				},
			},
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
		},
	},
	sources = {
		default = {
			"lsp",
			"path",
			-- "supermaven",
			"snippets",
			"buffer",
			"lazydev",
		},
		providers = {
			lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
		},
	},
	snippets = {
		preset = "luasnip",
	},
	fuzzy = { implementation = "lua" },
	signature = {
		enabled = true,
	},
}

return {
	"saghen/blink.cmp",
	event = "VimEnter",
	version = "1.*",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"folke/lazydev.nvim",
	},
	config = function()
		require("blink.cmp").setup(opts)
	end,
}
