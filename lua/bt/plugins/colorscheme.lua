if false then
	return {}
end

local colors = require("bt.colorscheme.gruvbox.colors")

local function concat_highlights(...)
	local full_hls = {}

	for _, hls in pairs({ ... }) do
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
	local nvim_tree_hl = require("bt.colorscheme.gruvbox.hl.plugins.nvim-tree")
	local nvim_treesitter_hl = require("bt.colorscheme.gruvbox.hl.plugins.nvim-treesitter")

	-- LSP highlight
	local cs_hl = require("bt.colorscheme.gruvbox.hl.lsp.cs")
	local dart_hl = require("bt.colorscheme.gruvbox.hl.lsp.dart")
	local go_hl = require("bt.colorscheme.gruvbox.hl.lsp.go")
  local kt_hl = require("bt.colorscheme.gruvbox.hl.lsp.kt")
  local http_hl = require("bt.colorscheme.gruvbox.hl.lsp.http")
	local lua_hl = require("bt.colorscheme.gruvbox.hl.lsp.lua")
	local ts_hl = require("bt.colorscheme.gruvbox.hl.lsp.ts")

	hls = concat_highlights(hls, nvim_tree_hl, nvim_treesitter_hl, cs_hl, dart_hl, go_hl, kt_hl, http_hl, lua_hl, ts_hl)

	return hls
end

return {
	{
		"ellisonleao/gruvbox.nvim",
		enabled = true,
		priority = 1000,
    dependencies = {
		  "mistweaverco/kulala.nvim",
    },
		config = function()
			require("gruvbox").setup({
				bold = true,
				contrast = "soft",
				terminal_colors = true,
				transparent_mode = false,
				overrides = get_highlights(),
			})

			vim.o.background = "light"
			vim.cmd("colorscheme gruvbox")
		end,
	},
}
