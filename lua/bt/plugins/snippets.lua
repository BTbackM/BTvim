if not vim.g.snippets then
	return {}
end

return {
	{
		"L3MON4D3/LuaSnip",
		version = "2.*",
		build = (function()
			if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
				return
			end
			return "make install_jsregexp"
		end)(),
		dependencies = {},
		opts = {},
		config = function(_, opts)
			local luasnip = require("luasnip")
			luasnip.setup(opts)
			require("luasnip.loaders.from_snipmate").lazy_load()

			vim.keymap.set({ "i", "s" }, "<C-j>", function()
				if luasnip.jumpable(1) then
					luasnip.jump(1)
				end
			end, { silent = true, desc = "Jump to next snippet placeholder" })

			vim.keymap.set({ "i", "s" }, "<C-k>", function()
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
				end
			end, { silent = true, desc = "Jump to previous snippet placeholder" })
		end,
	},
}
