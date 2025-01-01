vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { "rose-pine/neovim", as = "rose-pine" }

  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment the two plugins below if you want to manage the language servers from neovim
		  -- {'williamboman/mason.nvim'},
		  -- {'williamboman/mason-lspconfig.nvim'},


		  {'neovim/nvim-lspconfig'},
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }

  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
  }

  use { "catppuccin/nvim", as = "catppuccin" }

  use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
  use {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { {"nvim-lua/plenary.nvim"} }
  }

  use ('tpope/vim-fugitive')

  use ('vim-test/vim-test')

  use { 'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' }

  use { 'codota/tabnine-nvim', run = "./dl_binaries.sh" }
end)
