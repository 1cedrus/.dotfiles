return {
  {
    'prettier/vim-prettier',
    build = 'yarn install --frozen-lockfile --production',
    ft = { "javascript", "typescript", "css", "json" }, -- Only load on these filetypes
    keys = {
      -- 1. Format current buffer
      { "<leader>l", ":Prettier<CR>", desc = "Prettier" },
    },
    config = function()
      -- Optional: If you have specific settings like disabling autoformat
      -- vim.g["prettier#autoformat"] = 0
      -- vim.g["prettier#quickfix_enabled"] = 0
    end
  }
}