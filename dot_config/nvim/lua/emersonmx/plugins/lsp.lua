return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "creativenull/efmls-configs-nvim",
        { "j-hui/fidget.nvim", opts = {} },
        "b0o/SchemaStore.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()

        local servers = {
            bashls = {},
            clangd = {},
            docker_compose_language_service = {},
            dockerls = {},
            efm = {
                filetypes = { "python" },
                settings = {
                    rootMarkers = { ".git/" },
                    languages = {
                        python = { require("efmls-configs.linters.mypy") },
                    },
                },
                init_options = {
                    documentFormatting = true,
                    documentRangeFormatting = true,
                },
            },
            emmet_language_server = {},
            eslint = {},
            gdscript = { manual_install = true },
            golangci_lint_ls = {},
            gopls = {},
            html = {},
            jsonls = {
                settings = {
                    json = {
                        schemas = require("schemastore").json.schemas(),
                        validate = { enable = true },
                    },
                },
                init_options = { provideFormatter = false },
            },
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                            path = { "lua/?.lua", "lua/?/init.lua" },
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = { vim.env.VIMRUNTIME },
                        },
                        completion = { callSnippet = "Replace" },
                    },
                },
            },
            pyright = {},
            ruff = {},
            rust_analyzer = {
                settings = {
                    ["rust-analyzer"] = {
                        check = { command = "clippy" },
                    },
                },
            },
            stylelint_lsp = {},
            tailwindcss = {},
            taplo = {},
            templ = {},
            ts_ls = {},
            yamlls = {
                settings = {
                    yaml = {
                        schemaStore = {
                            enable = false,
                            url = "",
                        },
                        schemas = require("schemastore").yaml.schemas(),
                    },
                },
            },
        }

        local ensure_installed = {
            "clang-format",
            "commitlint",
            "djlint",
            "editorconfig-checker",
            "gdtoolkit",
            "gofumpt",
            "golangci-lint",
            "jsonlint",
            "markdownlint",
            "mypy",
            "prettier",
            "rustywind",
            "shellcheck",
            "shfmt",
            "stylelint",
            "stylua",
            "taplo",
            "yamlfmt",
            "yamllint",
        }
        local servers_to_install = vim.tbl_filter(function(key)
            local t = servers[key]
            if type(t) == "table" then
                return not t.manual_install
            else
                return t
            end
        end, vim.tbl_keys(servers))
        vim.list_extend(ensure_installed, servers_to_install)

        require("mason-tool-installer").setup({
            ensure_installed = ensure_installed,
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend(
            "force",
            capabilities,
            require("cmp_nvim_lsp").default_capabilities()
        )

        for name, config in pairs(servers) do
            config = vim.tbl_deep_extend(
                "force",
                {},
                { capabilities = capabilities },
                config
            )
            vim.lsp.config(name, config)
            vim.lsp.enable(name)
        end

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup(
                "custom-lsp-attach",
                { clear = true }
            ),
            callback = function(event)
                local bufnr = event.buf
                local client = assert(
                    vim.lsp.get_client_by_id(event.data.client_id),
                    "must have valid client"
                )

                local function map(keys, func, desc)
                    vim.keymap.set(
                        "n",
                        keys,
                        func,
                        { buffer = bufnr, desc = "LSP: " .. desc }
                    )
                end
                local tb = require("telescope.builtin")

                map("gd", tb.lsp_definitions, "Goto Definition")
                map("gr", tb.lsp_references, "Goto References")
                map("gI", tb.lsp_implementations, "Goto Implementation")
                map("<leader>D", tb.lsp_type_definitions, "Type Definition")
                map("<leader>ds", tb.lsp_document_symbols, "Document Symbols")
                map(
                    "<leader>ws",
                    tb.lsp_dynamic_workspace_symbols,
                    "Workspace Symbols"
                )
                map("<leader>rn", vim.lsp.buf.rename, "Rename")
                map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
                map("K", function()
                    vim.lsp.buf.hover({ wrap = false, max_width = 80 })
                end, "Hover Documentation")
                map("gD", vim.lsp.buf.declaration, "Goto Declaration")

                if
                    client
                    and client.server_capabilities.documentHighlightProvider
                then
                    vim.api.nvim_create_autocmd(
                        { "CursorHold", "CursorHoldI" },
                        {
                            buffer = bufnr,
                            callback = vim.lsp.buf.document_highlight,
                        }
                    )

                    vim.api.nvim_create_autocmd(
                        { "CursorMoved", "CursorMovedI" },
                        {
                            buffer = bufnr,
                            callback = vim.lsp.buf.clear_references,
                        }
                    )
                end
            end,
        })
    end,
}
