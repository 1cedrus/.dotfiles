return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'neovim/nvim-lspconfig',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
        },
        config = function()
            local lsp_zero = require('lsp-zero')

            -- 1. Global "On Attach"
            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
            end)

            -- 2. Capabilities
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- 3. CMP (Autocomplete)
            local cmp = require('cmp')
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-w>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                })
            })

            -- 4. Mason & Server Setup (Refactored to Handlers)
            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = { 'clangd', 'ts_ls', 'rust_analyzer', 'denols' },
                handlers = {
                    -- The default handler (applies to servers not listed below)
                    function(server_name)
                        require('lspconfig')[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,

                    -- RUST
                    ["rust_analyzer"] = function()
                        require('lspconfig').rust_analyzer.setup({
                            capabilities = capabilities,
                            settings = {
                                ["rust-analyzer"] = {
                                    assist = { importMergeBehavior = "last", importPrefix = "by_self" },
                                    cargo = { loadOutDirsFromCheck = true },
                                    procMacro = { enable = true },
                                }
                            }
                        })
                    end,

                    -- C/C++
                    ["clangd"] = function()
                        require('lspconfig').clangd.setup({
                            capabilities = capabilities,
                            filetypes = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
                            init_options = {
                                usePlaceholders = true,
                                completeUnimported = true,
                            }
                        })
                    end,

                    -- DENO
                    ["denols"] = function()
                        require('lspconfig').denols.setup({
                            capabilities = capabilities,
                            root_dir = require('lspconfig').util.root_pattern("deno.json", "deno.jsonc"),
                        })
                    end,

                    -- TYPESCRIPT
                    ["ts_ls"] = function()
                        require('lspconfig').ts_ls.setup({
                            capabilities = capabilities,
                            root_dir = require('lspconfig').util.root_pattern("package.json"),
                            single_file_support = false
                        })
                    end,
                }
            })
        end
    }
}
