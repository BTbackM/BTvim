local crates = require("crates")

vim.keymap.set("n", "<leader>rd", crates.open_documentation, { desc = "Open documentation" })
vim.keymap.set("n", "<leader>ro", crates.open_crates_io, { desc = "Open crates.io" })
vim.keymap.set("n", "<leader>rr", crates.reload, { desc = "Reload crates" })
vim.keymap.set("n", "<leader>rs", crates.show_popup, { desc = "Show popup" })
vim.keymap.set("n", "<leader>rt", crates.toggle, { desc = "Toggle UI" })
vim.keymap.set("n", "<leader>ru", crates.upgrade_crate, { desc = "Upgrade crate" })
vim.keymap.set("n", "<leader>rU", crates.upgrade_all_crates, { desc = "Upgrade all crates" })
