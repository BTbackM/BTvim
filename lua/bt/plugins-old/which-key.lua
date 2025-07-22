local ok, which_key = pcall(require, "which-key")
if not ok then
  return
end

local setup = {
  plugins = {
    marks = false,
    registers = false,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = false,
      g = false,
    },
  },
  icons = {
    ---breadcrumb = lvim.icons.ui.DoubleChevronRight,
    ---separator = lvim.icons.ui.BoldArrowRight,
    ---group = lvim.icons.ui.Plus,
  },
  keys = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>",
  },
  win = {
    no_overlap = true,
    border = "single",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left",
  },
  show_help = true,
  show_keys = true,
  disable = {
    buftypes = {},
    filetypes = { "TelescopePrompt" },
  },
}

which_key.setup(setup)
which_key.add({
  { "<leader>c",  "<cmd>bd<cr>",                             desc = "Close Buffer" },
  { "<leader>e",  "<cmd>NvimTreeToggle<cr>",                 desc = "Toggle Explorer" },
  { "<leader>w",  "<cmd>TSHighlightCapturesUnderCursor<cr>", desc = "Highlight Captures" },
  { "<leader>f",  group = "Find" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>",              desc = "Buffers" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>",           desc = "Find Files" },
  { "<leader>fg", "<cmd>Telescope git_branches<cr>",         desc = "Git Branches" },
})
