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
	kmap("n", "<C-h>", "<C-w>h", opts)
	kmap("n", "<C-j>", "<C-w>j", opts)
	kmap("n", "<C-k>", "<C-w>k", opts)
	kmap("n", "<C-l>", "<C-w>l", opts)
	kmap("n", "<M-i>", ":Inspect<CR>", opts)
  kmap("n", "<C-s>", ":w<CR>", opts)
  kmap("n", "<C-q>", ":q<CR>", opts)
  kmap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
	kmap("n", "<M-j>", ":m .+1<CR>==", opts)
	kmap("n", "<M-k>", ":m .-2<CR>==", opts)

	-- Visual keymaps
	kmap("v", "<", "<gv", opts)
	kmap("v", ">", ">gv", opts)
	kmap("v", "<M-j>", ":m '>+1<CR>gv=gv", opts)
	kmap("v", "<M-k>", ":m '<-2<CR>gv=gv", opts)
end

return M
