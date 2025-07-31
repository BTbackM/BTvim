if false then return {} end

local colors = require "bt.colorscheme.gruvbox.colors"

local function concat_highlights(...)
	local full_hls = {}

	for _, hls in pairs { ... } do
		for hl_group, hl_value in pairs(hls) do
			full_hls[hl_group] = hl_value
		end
	end

	return full_hls
end

local function get_highlights()
	local hls = {
    ["CursorLineNr"] = {
      fg = colors["custom"].blue,
      bold = true,
      italic = false,
    },
  }

	-- Plugin highlight
	local nvim_treesitter_hl = require "bt.colorscheme.gruvbox.hl.plugins.nvim-treesitter"
	local nvim_tree_hl = require "bt.colorscheme.gruvbox.hl.plugins.nvim-tree"

	-- LSP highlight
	local lua_hl = require "bt.colorscheme.gruvbox.hl.lsp.lua"

	hls = concat_highlights(
		hls,
		nvim_tree_hl,
		nvim_treesitter_hl,
		lua_hl
	)

	return hls
end

return {
	{
		"ellisonleao/gruvbox.nvim",
		enabled = true,
		priority = 1000,
		config = function()
			require "gruvbox".setup({
				bold = true,
				contrast = "soft",
				terminal_colors = true,
				transparent_mode = false,
				overrides = get_highlights()
			})

			vim.o.background = "light"
			vim.cmd('colorscheme gruvbox')
		end
	}
}
