return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
        -- LSP Support
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        -- Autocompletion
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",

        -- Debug Support
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",

        -- Snippets
        "L3MON4D3/LuaSnip",
    },
    config = function()
        local lsp_zero = require("lsp-zero")

        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })

            local opts = { buffer = bufnr, remap = false }
            vim.keymap.set(
                { "n", "v" },
                "<leader>ca",
                vim.lsp.buf.code_action,
                opts
            )
            vim.keymap.set({ "n", "v" }, "<leader>cf", vim.lsp.buf.format, opts)
            vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "gs", vim.lsp.buf.workspace_symbol, opts)
        end)

        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {},
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    require("lspconfig").lua_ls.setup(lua_opts)
                end,
                efm = function()
                    require("lspconfig").efm.setup({
                        init_options = { documentFormatting = true },
                        cmd = {
                            "efm-langserver",
                            "-c",
                            vim.fn.stdpath("config") .. "/efm_config.yaml",
                        },
                    })
                end,
            }
        })
        lsp_zero.set_sign_icons({
            error = "E",
            warn = "W",
            hint = "H",
            info = "I"
        })

        vim.diagnostic.config({
            virtual_text = false,
            severity_sort = true,
            float = {
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })

        local cmp = require("cmp")
        local cmp_action = lsp_zero.cmp_action()
        local cmp_format = lsp_zero.cmp_format()

        require("luasnip.loaders.from_vscode").lazy_load()

        vim.opt.completeopt = { "menu", "menuone", "noselect" }

        cmp.setup({
            formatting = cmp_format,
            preselect = "item",
            completion = {
                completeopt = "menu,menuone,noinsert"
            },
            window = {
                documentation = cmp.config.window.bordered(),
            },
            sources = {
                { name = "path" },
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
                { name = "buffer",                 keyword_length = 3 },
                { name = "luasnip",                keyword_length = 1 },
                { name = "nvim_lsp_signature_help" },
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                ["<C-e>"] = cmp_action.toggle_completion(),
                ["<Tab>"] = cmp_action.tab_complete(),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                ["<C-d>"] = cmp_action.luasnip_jump_forward(),
                ["<C-b>"] = cmp_action.luasnip_jump_backward(),
                ["<C-f>"] = cmp.mapping.scroll_docs(5),
                ["<C-u>"] = cmp.mapping.scroll_docs(-5),
            }),
        })
    end,
}
