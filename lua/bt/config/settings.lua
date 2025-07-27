local M = {}

function M.load()
	local options = {
    cursorline = true,
		expandtab = true,
    foldmethod = "expr",
    foldexpr = "v:lua.vim.lsp.foldexpr()",
    foldlevel = 99,
    foldenable = true,
		hlsearch = false,
		list = true,
		number = true,
		relativenumber = true,
		signcolumn = "yes",
		shiftwidth = 2,
		smartindent = true,
		tabstop = 2,
		termguicolors = true,
		winborder = "rounded",
		wrap = false,
	}

	for k, v in pairs(options) do
		vim.opt[k] = v
	end
end

return M
