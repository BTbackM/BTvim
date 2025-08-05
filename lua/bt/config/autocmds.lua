vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local kmap = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		local builtin = require("telescope.builtin")
		kmap("gl", vim.diagnostic.open_float, "Open float diagnostic")
		kmap("gO", builtin.lsp_document_symbols, "Document Symbols")
		kmap("gra", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
		kmap("grd", vim.lsp.buf.definition, "Definition")
		kmap("grD", vim.lsp.buf.declaration, "Declaration")
		kmap("gri", builtin.lsp_implementations, "Implementations")
		kmap("grn", vim.lsp.buf.rename, "Rename")
		kmap("grt", vim.lsp.buf.type_definition, "Type Definition")
		kmap("grr", builtin.lsp_references, "References")
		kmap("gW", builtin.lsp_dynamic_workspace_symbols, "Workspace Symbols")

		local function client_supports_method(client, method, bufnr)
			if vim.fn.has("nvim-0.11") == 1 then
				return client:supports_method(method, bufnr)
			else
				return client.supports_method(method, { bufnr = bufnr })
			end
		end

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			kmap("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "Toggle inlay hints")
		end
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked text",
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
