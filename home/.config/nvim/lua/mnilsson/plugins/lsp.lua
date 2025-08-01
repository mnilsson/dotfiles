return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/conform.nvim",
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp"
    },
    config = function()
        require("conform").setup({})
        local cmp = require("cmp")
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )
        require("fidget").setup({})

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                -- "ts_ls",
                "zls",
                -- "gopls"
            },
            handlers = {
                function(server_name)
                    require ("lspconfig")[server_name].setup {
                        capabilities=capabilities
                    }
                end,
                zls = function ()
                    local lspconfig = require("lspconfig")
                    lspconfig.zls.setup({
                        root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
                        settings = {
                            enable_inlay_hints = true,
                            enable_snippets = true,
                            warn_style = true
                        }

                    })
                    vim.g.zig_fmt_parse_errors = 0
                    vim.g.zig_fmt_autosave = 1
                end
            }
        })


        local cmp_select = {behavior = cmp.SelectBehavior.Select}

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true}),
                ["<C-Space>"] = cmp.mapping.complete()
            }),
            sources = cmp.config.sources({
                {name = 'nvim_lsp'}
            },{
                { name = 'buffer'}
            })
        })


        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source ="always",
                header="",
                prefix=""
            }
        })

    end

}
