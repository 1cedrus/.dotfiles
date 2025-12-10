return {
  { "nvim-lua/plenary.nvim" }, -- Common utility library
  
  { 
    'tpope/vim-fugitive',
    keys = {
      { "<leader>gs", vim.cmd.Git, desc = "Git Status" }
    }
  },
}