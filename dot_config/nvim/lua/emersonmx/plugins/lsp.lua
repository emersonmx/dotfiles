return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        { "creativenull/efmls-configs-nvim", version = "v1.x.x" },
        { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup(
                "custom-lsp-attach",
                { clear = true }
            ),
            callback = function(event)
                local map = function(keys, func, desc)
                    vim.keymap.set(
                        "n",
                        keys,
                        func,
                        { buffer = event.buf, desc = "LSP: " .. desc }
                    )
                end
                local tb = require("telescope.builtin")

                map("gd", tb.lsp_definitions, "[G]oto [D]efinition")
                map("gr", tb.lsp_references, "[G]oto [R]eferences")
                map("gI", tb.lsp_implementations, "[G]oto [I]mplementation")
                map("<leader>D", tb.lsp_type_definitions, "Type [D]efinition")
                map(
                    "<leader>ds",
                    tb.lsp_document_symbols,
                    "[D]ocument [S]ymbols"
                )
                map(
                    "<leader>ws",
                    tb.lsp_dynamic_workspace_symbols,
                    "[W]orkspace [S]ymbols"
                )
                map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                map("K", vim.lsp.buf.hover, "Hover Documentation")
                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if
                    client
                    and client.server_capabilities.documentHighlightProvider
                then
                    vim.api.nvim_create_autocmd(
                        { "CursorHold", "CursorHoldI" },
                        {
                            buffer = event.buf,
                            callback = vim.lsp.buf.document_highlight,
                        }
                    )

                    vim.api.nvim_create_autocmd(
                        { "CursorMoved", "CursorMovedI" },
                        {
                            buffer = event.buf,
                            callback = vim.lsp.buf.clear_references,
                        }
                    )
                end
            end,
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend(
            "force",
            capabilities,
            require("cmp_nvim_lsp").default_capabilities()
        )

        local languages = {
            python = { require("efmls-configs.linters.mypy") },
        }
        local efmls_config = {
            filetypes = vim.tbl_keys(languages),
            settings = {
                rootMarkers = { ".git/" },
                languages = languages,
            },
            init_options = {
                documentFormatting = true,
                documentRangeFormatting = true,
            },
        }

        local servers = {
            bashls = {},
            clangd = {},
            docker_compose_language_service = {},
            dockerls = {},
            efm = efmls_config,
            emmet_language_server = {},
            eslint = {},
            golangci_lint_ls = {},
            gopls = {},
            html = {},
            jsonls = {},
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                "${3rd}/luv/library",
                                unpack(vim.api.nvim_get_runtime_file("", true)),
                            },
                        },
                        completion = {
                            callSnippet = "Replace",
                        },
                    },
                },
            },
            pyright = {},
            ruff_lsp = {},
            rust_analyzer = {
                settings = {
                    ["rust-analyzer"] = {
                        check = {
                            command = "clippy",
                        },
                    },
                },
            },
            stylelint_lsp = {},
            tailwindcss = {},
            tsserver = {},
            yamlls = {},
        }

        require("mason").setup()

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
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
            "prettierd",
            "shellcheck",
            "shfmt",
            "sonarlint-language-server",
            "stylelint",
            "stylua",
            "taplo",
            "yamlfmt",
            "yamllint",
        })
        require("mason-tool-installer").setup({
            ensure_installed = ensure_installed,
        })

        require("mason-lspconfig").setup({
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend(
                        "force",
                        {},
                        capabilities,
                        server.capabilities or {}
                    )
                    require("lspconfig")[server_name].setup(server)
                end,
            },
        })

        require("lspconfig").gdscript.setup({})
    end,
}
