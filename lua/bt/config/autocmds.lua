vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
	callback = function(event)
		local kmap = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		kmap("gl", vim.diagnostic.open_float, "Open float diagnostic")
	end
})
