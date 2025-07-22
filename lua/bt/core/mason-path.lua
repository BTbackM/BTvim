-- Early Mason PATH initialization
-- Ensure Mason bin directory is always first in PATH

local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
local current_path = vim.env.PATH or ""

local path_entries = vim.split(current_path, ":")
local cleaned_entries = {}
local seen = {}

-- Remove mason_bin from path if it exists
for _, entry in ipairs(path_entries) do
  if entry ~= mason_bin and entry ~= "" and not seen[entry] then
    seen[entry] = true
    table.insert(cleaned_entries, entry)
  end
end

local new_path = mason_bin .. ":" .. table.concat(cleaned_entries, ":")
vim.env.PATH = new_path

if vim.fn.isdirectory(mason_bin) == 0 then
  vim.fn.mkdir(mason_bin, "p")
end
