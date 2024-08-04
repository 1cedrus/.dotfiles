local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-e>', builtin.live_grep, {})
vim.keymap.set('n', '<C-q>', builtin.buffers, {})
vim.keymap.set('n', '<leader>fj', builtin.git_files, {})

-- Internet source
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
    	  ['<c-d>'] = require('telescope.actions').delete_buffer
      }, -- n
      i = {
        ["<C-h>"] = "which_key",
        ['<c-d>'] = require('telescope.actions').delete_buffer
      } 
    } 
  }, 
}
