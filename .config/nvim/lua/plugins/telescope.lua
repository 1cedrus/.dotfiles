return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')

      -- 1. Your Custom Keymaps
      vim.keymap.set('n', '<leader>f', builtin.find_files, {})
      vim.keymap.set('n', '<C-e>', builtin.live_grep, {})
      vim.keymap.set('n', '<C-q>', builtin.buffers, {})
      vim.keymap.set('n', '<leader>j', builtin.git_files, {})

      -- 2. Telescope Setup (Actions & Defaults)
      local actions = require('telescope.actions')

      require('telescope').setup{
        defaults = {
          mappings = {
            n = {
              ['<c-d>'] = actions.delete_buffer
            }, 
            i = {
              ["<C-h>"] = "which_key",
              ['<c-d>'] = actions.delete_buffer
            } 
          } 
        }, 
      }
    end
  }
}