vim.lsp.enable({
	"lua-language-server",
	"gopls",
  "omnisharp",
})

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
    table.insert(lines, string.format("%d. %s (ID: %d)", i, client.name, client.id))
    table.insert(lines, "   • Root: " .. (client.config.root_dir or "(none)"))
    table.insert(lines, "   • Filetypes: " .. table.concat(client.config.filetypes or {}, ", "))

    -- Capabilities
    local capabilities = client.server_capabilities
    local features = {}
    if capabilities.completionProvider then table.insert(features, "completion") end
    if capabilities.hoverProvider then table.insert(features, "hover") end
    if capabilities.definitionProvider then table.insert(features, "definitions") end
    if capabilities.referencesProvider then table.insert(features, "references") end
    if capabilities.renameProvider then table.insert(features, "rename") end
    if capabilities.codeActionProvider then table.insert(features, "code actions") end
    if capabilities.documentFormattingProvider then table.insert(features, "formatting") end

    table.insert(lines, "   • Features: " .. table.concat(features, ", "))
    if i < #clients then
      table.insert(lines, "")
    end
  end

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
    relative = 'editor',
    width = width,
    height = height,
    col = (vim.o.columns - width) / 2,
    row = (vim.o.lines - height) / 3, -- Slightly higher than center
    style = 'minimal',
    border = {
      { '╭', 'FloatBorder' }, { '─', 'FloatBorder' },
      { '╮', 'FloatBorder' }, { '│', 'FloatBorder' },
      { '╯', 'FloatBorder' }, { '─', 'FloatBorder' },
      { '╰', 'FloatBorder' }, { '│', 'FloatBorder' },
    },
  })

  -- Window styling
  vim.api.nvim_win_set_option(win, 'winhl', 'Normal:NormalFloat')

  -- Keymaps to close window
  vim.keymap.set('n', '<Esc>', '<cmd>q!<cr>', { buffer = buf })
  vim.keymap.set('n', 'q', '<cmd>q!<cr>', { buffer = buf })

  -- Make buffer non-editable
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)
  vim.api.nvim_buf_set_option(buf, 'filetype', 'markdown') -- For better syntax
end

vim.api.nvim_create_user_command("LspStatus", lsp_status, { desc = "Print LSP status" })
