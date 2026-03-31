local M = {}

function M.load()
	local options = {
		clipboard = "unnamedplus",
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
		have_nerd_font = true,
	}

	for k, v in pairs(globals) do
		vim.g[k] = v
	end
end

return M
