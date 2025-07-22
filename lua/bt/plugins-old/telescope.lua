local ok, _ = pcall(require, "telescope")
if not ok then
  return
end

local opts = {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git", "node_modules", ".cache" },
  },
  pickers = {},
  extensions = {},
}

require "telescope".setup(opts)
