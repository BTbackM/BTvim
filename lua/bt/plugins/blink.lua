if false then
	return {}
end

local opts = {
	enabled = function()
		return vim.bo.filetype ~= "DressingInput"
	end,
	keymap = {
		preset = "default",
		["<CR>"] = { "accept", "fallback" },
		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },
		["<C-e>"] = { "hide", "fallback" },
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
			"lazydev",
			"lsp",
			"path",
			-- "supermaven",
			"snippets",
			"buffer",
		},
		providers = {
			lazydev = {
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},
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
		vim.lsp.config("*", {
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})

		require("blink.cmp").setup(opts)
	end,
}
