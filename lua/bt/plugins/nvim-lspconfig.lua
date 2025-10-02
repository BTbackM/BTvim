if true then
	return {
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"j-hui/fidget.nvim",
			"saghen/blink.cmp",
		},
	}
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"j-hui/fidget.nvim",
		"saghen/blink.cmp",
	},
	config = function()
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
				kmap("grd", builtin.lsp_definitions, "Definitions")
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
				if
					client
					and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
				then
					kmap("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "Toggle inlay hints")
				end
			end,
		})

		vim.diagnostic.config({
			severity_sort = true,
			float = {
				border = "rounded",
				source = "if_many",
			},
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = vim.g.have_nerd_font and {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			} or {},
			virtual_text = {
				source = "if_many",
				spacing = 2,
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = diagnostic.message,
						[vim.diagnostic.severity.WARN] = diagnostic.message,
						[vim.diagnostic.severity.INFO] = diagnostic.message,
						[vim.diagnostic.severity.HINT] = diagnostic.message,
					}
					return diagnostic_message[diagnostic.severity]
				end,
			},
		})

		local capabilities = require("blink.cmp").get_lsp_capabilities()

		local servers = {
			lua_ls = require("bt.lsp.lua-ls"),
			gopls = require("bt.lsp.gopls"),
			omnisharp = require("bt.lsp.omnisharp"),
			kotlin_lsp = require("bt.lsp.kotlin-ls"),
		}

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			-- Formatters
			"gofumpt",
			"goimports",
			"stylua",

			-- Linters
			"luacheck",
		})
		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed,
		})

		require("mason-lspconfig").setup({
			ensure_installed = {},
			automatic_installation = false,
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
