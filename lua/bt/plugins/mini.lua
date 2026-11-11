if not vim.g.mini then
	return {}
end

return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({
				n_lines = 500,
			})
			require("mini.surround").setup()

			local hipatterns = require("mini.hipatterns")
			local oklch = require("bt.colorscheme.oklch")
			hipatterns.setup({
				highlighters = {
					oklch_color = {
						pattern = "oklch%([%d%s,.-]+%)",
						group = function(_, match)
							local hex = oklch.from_string(match)
							if hex == nil then
								return nil
							end

							return hipatterns.compute_hex_color_group(hex, "bg")
						end,
					},
				},
			})
		end,
	},
}
