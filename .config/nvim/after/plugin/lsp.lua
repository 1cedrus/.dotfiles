local lsp_zero = require('lsp-zero')

lsp_zero.preset("recommended")

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-w>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    })
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'clangd', 'ts_ls', 'rust_analyzer', 'gopls', 'denols' },
})

local nvim_lsp = require('lspconfig')

nvim_lsp.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importMergeBehavior = "last",
        importPrefix = "by_self",
      },
      cargo = {
        loadOutDirsFromCheck = true
      },
      procMacro = {
        enable = true
      },
    }
  }
}

nvim_lsp.clangd.setup{
  capabilities = capabilities,
  filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
  init_options = {
    usePlaceholders = true, 
    completeUnimported = true,
  }
}

nvim_lsp.denols.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
}

nvim_lsp.ts_ls.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  single_file_support = false
}

-- nvim_lsp.pylsp.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     pylsp = {
--       plugins = {
--         pycodestyle = { enabled = false },
--         pyflakes = { enabled = false },
--         pylint = { enabled = true },
--         yapf = { enabled = false },
--         flake8 = { enabled = false },
--         jedi = { enabled = true },
--         mccabe = { enabled = false },
--         mypy = { enabled = false },
--         pep8 = { enabled = false },
--         pydocstyle = { enabled = false },
--         rope = { enabled = false },
--         yapf = { enabled = false },
--       }
--     }
--   }
-- }




