return {
  {
    "vim-test/vim-test",
    keys = {
      { "<leader>t", ":TestNearest<CR>", desc = "Run Nearest Test" },
      { "<leader>T", ":TestFile<CR>", desc = "Run Test File" },
    },
    config = function()
      -- Configure Vitest options (or any other runners)
      vim.g["test#javascript#vitest#options"] = "--environment=jsdom"
      
      -- Optional: If you want to configure the strategy (e.g., using Neovim's terminal)
      -- vim.g["test#strategy"] = "neovim"
    end
  }
}