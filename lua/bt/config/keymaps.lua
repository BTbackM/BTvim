local M = {}

function M.load()
  -- Remap space as leader key
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "

  local kmap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  -- Insert keymaps
  kmap("i", "<C-q>", "<Esc>:wq<CR>", opts)
  kmap("i", "<C-s>", "<Esc>:w<CR>", opts)

  -- Normal keymaps
  kmap("n", "<C-s>", ":w<CR>", opts)
  kmap("n", "<C-q>", ":q<CR>", opts)
  kmap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
end

return M
