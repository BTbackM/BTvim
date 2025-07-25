local opts = {
	snippets = {},
	signature = {
		enabled = true,
	},
	sources = {
		default = {
			"lsp",
			"path",
			-- "supermaven",
			"snippets",
			"buffer",
		},
		providers = {},
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
}

return {
	"saghen/blink.cmp",
	version = "*",
	config = function()
		require("blink.cmp").setup(opts)
	end
}
