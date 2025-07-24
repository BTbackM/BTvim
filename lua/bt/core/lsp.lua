vim.lsp.enable({
	"lua-language-server",
	"gopls",
})

local function lsp_status()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr })

  if #clients == 0 then
    print " LSP"
    return
  end

  print(" LSP: Status for buffer " .. bufnr)
  print("--------------")

  for i, client in ipairs(clients) do
    print(string.format(
      "LSP Client %d: %s (ID: %d)",
      i,
      client.name,
      client.id
    ))
    print("Root path: " .. (client.config.root_dir or "(none)"))
    print("Filetypes: " .. table.concat(client.config.filetypes or {}, ", "))

    -- Check capabilities
    local capabilities = client.server_capabilities
    local features = {}

    if capabilities.completionProvider then table.insert(features, "completion") end
    if capabilities.hoverProvider then table.insert(features, "hover") end
    if capabilities.definitionProvider then table.insert(features, "definition") end
    if capabilities.referencesProvider then table.insert(features, "references") end
    if capabilities.renameProvider then table.insert(features, "rename") end
    if capabilities.codeActionProvider then table.insert(features, "code_action") end
    if capabilities.documentFormattingProvider then table.insert(features, "formatting") end

    print("Features: " .. table.concat(features, ", "))
    print("--------------")
  end
end

vim.api.nvim_create_user_command("LspStatus", lsp_status, { desc = "Print LSP status" })
