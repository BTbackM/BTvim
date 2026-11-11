local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config("lua_ls", {
	filetypes = { "lua", "c" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			completion = { callSnippet = "Replace" },
			workspace = {
				checkThirdParty = false,
			},
		},
	},
})

vim.lsp.config("gopls", {
	capabilities = vim.tbl_deep_extend("force", capabilities, {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		},
	}),
	init_options = {
		semanticTokens = true,
	},
})

vim.lsp.config("basedpyright", {
	settings = {
		basedpyright = {
			analysis = {
				typeCheckingMode = "standard",
			},
		},
	},
})

vim.lsp.config("html", {
	filetypes = { "html", "cshtml" },
	capabilities = capabilities,
})

vim.lsp.config("cssls", {
	settings = {
		css = { lint = { unknownAtRules = "ignore" } },
		scss = { lint = { unknownAtRules = "ignore" } },
		less = { lint = { unknownAtRules = "ignore" } },
	},
})

vim.lsp.enable({
	"angularls",
	"astro",
	"basedpyright",
	"bashls",
	"cssls",
	-- "csharp_ls",
	"gopls",
	"html",
	-- "kotlin_language_server",
	"kotlin_lsp",
	"lua_ls",
	-- "omnisharp",
	"roslyn",
	"ruff",
	"tailwindcss",
	"taplo",
	"ts_ls",
})

vim.diagnostic.config({
	virtual_text = false,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "if_many",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "󰋼",
			[vim.diagnostic.severity.HINT] = "󰛨",
		},
	},
})

local function create_floating_window(lines)
	-- Calculate dimensions
	local max_line = 0
	for _, line in ipairs(lines) do
		max_line = math.max(max_line, vim.fn.strdisplaywidth(line))
	end

	local width = math.min(max_line + 4, vim.o.columns - 10)
	local height = math.min(#lines + 2, vim.o.lines - 10)

	-- Create floating window
	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		col = (vim.o.columns - width) / 2,
		row = (vim.o.lines - height) / 3,
		style = "minimal",
		border = {
			{ "╭", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "╮", "FloatBorder" },
			{ "│", "FloatBorder" },
			{ "╯", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "╰", "FloatBorder" },
			{ "│", "FloatBorder" },
		},
	})

	-- Window styling
	vim.wo[win].winhl = "Normal:NormalFloat"

	-- Keymaps to close window
	vim.keymap.set("n", "<Esc>", "<cmd>q!<cr>", { buffer = buf })
	vim.keymap.set("n", "q", "<cmd>q!<cr>", { buffer = buf })

	-- Make buffer non-editable
	vim.bo[buf].modifiable = false
	vim.bo[buf].filetype = "markdown"
end

local function lsp_status()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = bufnr })
	local lines = {} -- Stores all output lines

	-- Header
	if #clients == 0 then
		table.insert(lines, "  No active LSP clients")
	else
		table.insert(lines, "  LSP Status for buffer " .. bufnr)
		table.insert(lines, "")
	end

	-- Client information
	for i, client in ipairs(clients) do
		---@type vim.lsp.Config
		local config = vim.lsp.config[client.name] or {}
		local filetypes = config.filetypes or {}

		table.insert(lines, string.format("%d. %s (ID: %d)", i, client.name, client.id))
		table.insert(lines, "   • Root: " .. (client.config.root_dir or "(none)"))
		table.insert(lines, "   • Filetypes: " .. table.concat(filetypes, ", "))
		table.insert(lines, "   • Cmd: " .. (vim.inspect(client.config.cmd) or "(none)"))

		-- Capabilities
		local lsp_capabilities = client.server_capabilities
		if not lsp_capabilities then
			table.insert(lines, "   • Server capabilities: none")
			goto continue
		end

		local features = {}
		if lsp_capabilities.completionProvider then
			table.insert(features, "completion")
		end
		if lsp_capabilities.hoverProvider then
			table.insert(features, "hover")
		end
		if lsp_capabilities.definitionProvider then
			table.insert(features, "definitions")
		end
		if lsp_capabilities.referencesProvider then
			table.insert(features, "references")
		end
		if lsp_capabilities.renameProvider then
			table.insert(features, "rename")
		end
		if lsp_capabilities.codeActionProvider then
			table.insert(features, "code actions")
		end
		if lsp_capabilities.documentFormattingProvider then
			table.insert(features, "formatting")
		end
		if lsp_capabilities.semanticTokensProvider then
			table.insert(features, "semantic tokens")
		end

		table.insert(lines, "   • Features:")
		for _, feature in ipairs(features) do
			table.insert(lines, "      • " .. feature)
		end

		if i < #clients then
			table.insert(lines, "")
		end

		::continue::
	end

	create_floating_window(lines)
end

local function lsp_client_info()
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = bufnr })
	local lsp_lines = vim.split(vim.inspect(clients), "\n")
	local lines = {}

	if #clients == 0 then
		table.insert(lines, "  No active LSP clients")
	else
		table.insert(lines, "  LSP Client Info for buffer " .. bufnr)
	end

	for _, client in ipairs(clients) do
		local name = client.name
		local id = client.id

		table.insert(lines, string.format("Client: %s (ID: %s)", name, id))
	end

	table.insert(lines, "")

	for _, line in ipairs(lsp_lines) do
		table.insert(lines, line)
	end

	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	vim.bo[buf].filetype = "lua"
	vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = math.floor(vim.o.columns * 0.8),
		height = math.floor(vim.o.lines * 0.8),
		row = math.floor(vim.o.lines * 0.1),
		col = math.floor(vim.o.columns * 0.1),
		style = "minimal",
		border = "rounded",
	})

	vim.keymap.set("n", "q", "<cmd>bdelete<cr>", { buffer = buf })
	vim.keymap.set("n", "<Esc>", "<cmd>bdelete<cr>", { buffer = buf })
end

vim.api.nvim_create_user_command("LspStatus", lsp_status, { desc = "Print LSP status" })
vim.api.nvim_create_user_command("LspClientInfo", lsp_client_info, { desc = "Print LSP client info" })
