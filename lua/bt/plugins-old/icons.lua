local ok, web_devicons = pcall(require, "nvim-web-devicons")
if not ok then
  return
end

local ok_mini, mini_icons = pcall(require, "mini.icons")
if not ok_mini then
  return
end

web_devicons.setup()
mini_icons.setup()
