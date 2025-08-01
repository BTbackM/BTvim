vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local kmap = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		kmap("gl", vim.diagnostic.open_float, "Open float diagnostic")
		kmap("gd", ":lua vim.lsp.buf.definition()<CR>", "Go to definition")
		kmap("gD", ":lua vim.lsp.buf.declaration()<CR>", "Go to declaration")
		kmap("gi", ":lua vim.lsp.buf.implementation()<CR>", "Go to implementation")
		kmap("K", ":lua vim.lsp.buf.hover()<CR>", "Hover")
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked text",
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
