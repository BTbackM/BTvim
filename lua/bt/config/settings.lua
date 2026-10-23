local M = {}

function M.load()
	local options = {
		clipboard = "unnamedplus",
		conceallevel = 1,
		confirm = true,
		cursorline = true,
		expandtab = true,
		foldmethod = "expr",
		foldexpr = "v:lua.vim.lsp.foldexpr()",
		foldlevel = 99,
		foldenable = true,
		hlsearch = false,
		inccommand = "split",
		list = true,
		listchars = {
			tab = "» ",
			eol = "↲",
			trail = "·",
			nbsp = "␣",
			lead = "·",
		},
		number = true,
		relativenumber = true,
		signcolumn = "yes",
		shiftwidth = 2,
		smartindent = true,
		splitbelow = true,
		splitright = true,
		tabstop = 2,
		termguicolors = true,
		undofile = true,
		winborder = "rounded",
		wrap = false,
	}

	for k, v in pairs(options) do
		vim.opt[k] = v
	end

	local globals = {
		android_nvim = true,
		have_nerd_font = true,
		-- lazydev.nvim is declared in core.lua, general.lua, luadev.lua and
		-- blink.lua; it is a blink dependency, so it stays ungated here.
		better_escape = true,
		blink = true,
		colorscheme = true,
		conform = true,
		dev_icons = true,
		fidget = true,
		flutter_tools = true,
		gitsigns = true,
		kotlin = true,
		lualine = true,
		mason = true,
		mini = true,
		nvim_autopairs = true,
		nvim_lint = true,
		nvim_tree = true,
		nvim_ufo = true,
		obsidian = true,
		rest = true,
		rust = true,
		snippets = true,
		supermaven = true,
		telescope = true,
		which_key = true,
	}

	for k, v in pairs(globals) do
		vim.g[k] = v
	end
end

return M
