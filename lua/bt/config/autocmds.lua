local function map_csproj_picker(bufnr, root)
	vim.keymap.set("n", "<leader>fp", function()
		require("telescope.builtin").find_files({
			cwd = root,
			find_command = { "rg", "--files", "--glob", "*.csproj" },
			prompt_title = "C# Projects",
		})
	end, { buffer = bufnr, desc = "LSP: Find C# projects" })
end

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
		if client and client.name == "roslyn" then
			map_csproj_picker(event.buf, client.root_dir)
		end

		if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			kmap("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "Toggle inlay hints")
		end
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("roslyn-csproj", { clear = true }),
	pattern = "*.csproj",
	callback = function(event)
		local file = vim.fs.normalize(vim.api.nvim_buf_get_name(event.buf))
		for _, client in ipairs(vim.lsp.get_clients({ name = "roslyn" })) do
			local root = client.root_dir and vim.fs.normalize(client.root_dir)
			if root and file:sub(1, #root + 1) == root .. "/" then
				map_csproj_picker(event.buf, client.root_dir)
				return
			end
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

vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
		vim.bo.expandtab = true
	end,
})

local languages = {
	"go",
	"kotlin",
}
vim.api.nvim_create_autocmd("FileType", {
	pattern = languages,
	callback = function()
		vim.treesitter.start()
	end,
})
