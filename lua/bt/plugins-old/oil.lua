local ok, _ = pcall(require, "oil")
if not ok then
  return
end

require "oil".setup()
