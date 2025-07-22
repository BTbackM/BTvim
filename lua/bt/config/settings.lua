local M = {}

function M.load()
  local options = {
    hlsearch = false,
    list = true,
    number = true,
    relativenumber = true,
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
