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
	local blink_hl = require("bt.colorscheme.gruvbox.hl.plugins.blink")
	local nvim_cmp_hl = require("bt.colorscheme.gruvbox.hl.plugins.nvim-cmp")
	local nvim_tree_hl = require("bt.colorscheme.gruvbox.hl.plugins.nvim-tree")
	local nvim_treesitter_hl = require("bt.colorscheme.gruvbox.hl.plugins.nvim-treesitter")

	-- LSP highlight
	local astro_hl = require("bt.colorscheme.gruvbox.hl.lsp.astro")
	local cs_hl = require("bt.colorscheme.gruvbox.hl.lsp.cs")
	local css_hl = require("bt.colorscheme.gruvbox.hl.lsp.css")
	local dart_hl = require("bt.colorscheme.gruvbox.hl.lsp.dart")
	local go_hl = require("bt.colorscheme.gruvbox.hl.lsp.go")
	local js_hl = require("bt.colorscheme.gruvbox.hl.lsp.js")
	local json_hl = require("bt.colorscheme.gruvbox.hl.lsp.json")
	local kt_hl = require("bt.colorscheme.gruvbox.hl.lsp.kt")
	local html_hl = require("bt.colorscheme.gruvbox.hl.lsp.html")
	local http_hl = require("bt.colorscheme.gruvbox.hl.lsp.http")
	local hypr_hl = require("bt.colorscheme.gruvbox.hl.lsp.hypr")
	local lua_hl = require("bt.colorscheme.gruvbox.hl.lsp.lua")
	local obsidian_hl = require("bt.colorscheme.gruvbox.hl.lsp.obsidian")
	local py_hl = require("bt.colorscheme.gruvbox.hl.lsp.py")
	local razor_hl = require("bt.colorscheme.gruvbox.hl.lsp.razor")
	local rust_hl = require("bt.colorscheme.gruvbox.hl.lsp.rust")
	local tmux_hl = require("bt.colorscheme.gruvbox.hl.lsp.tmux")
	local toml_hl = require("bt.colorscheme.gruvbox.hl.lsp.toml")
	local ts_hl = require("bt.colorscheme.gruvbox.hl.lsp.ts")

	hls = concat_highlights(
		hls,
		blink_hl,
		nvim_cmp_hl,
		nvim_tree_hl,
		nvim_treesitter_hl,
		astro_hl,
		cs_hl,
		css_hl,
		dart_hl,
		go_hl,
		js_hl,
		json_hl,
		kt_hl,
		html_hl,
		http_hl,
		hypr_hl,
		lua_hl,
		obsidian_hl,
		py_hl,
		razor_hl,
		rust_hl,
		tmux_hl,
		toml_hl,
		ts_hl
	)

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
			vim.o.background = "light"

			require("gruvbox").setup({
				bold = true,
				contrast = "soft",
				terminal_colors = true,
				transparent_mode = false,
				overrides = get_highlights(),
			})

			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "gruvbox",
				callback = function()
					for name, val in pairs(get_highlights()) do
						vim.api.nvim_set_hl(0, name, val)
					end
				end,
			})
		end,
	},
}
