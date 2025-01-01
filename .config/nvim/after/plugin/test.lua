vim.keymap.set("n", "<leader>t", ":TestNearest<CR>")
vim.keymap.set("n", "<leader>T", ":TestFile<CR>")

vim.g["test#javascript#vitest#options"] = "--environment=jsdom"

