return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "b0o/SchemaStore.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()

        local tools = {
            "clang-format",
            "commitlint",
            "detekt",
            "djlint",
            "editorconfig-checker",
            "gdtoolkit",
            "gofumpt",
            "golangci-lint",
            "jsonlint",
            "ktlint",
            "markdownlint",
            "prettier",
            "shellcheck",
            "shfmt",
            "staticcheck",
            "stylelint",
            "stylua",
            "tsc",
            "yamlfmt",
            "yamllint",
        }

        -- Configs live in after/lsp/<name>.lua
        local servers = {
            "bashls",
            "clangd",
            "docker_compose_language_service",
            "dockerls",
            "emmet_language_server",
            "eslint",
            "golangci_lint_ls",
            "gopls",
            "html",
            "jdtls",
            "jsonls",
            "kotlin_lsp",
            "lemminx",
            "lua_ls",
            "oxlint",
            "ruff",
            "rust_analyzer",
            "stylelint_lsp",
            "tailwindcss",
            "taplo",
            "templ",
            "ts_query_ls",
            "ty",
            "yamlls",
        }

        -- Enabled, but installed outside Mason
        local manual_servers = {
            "gdscript",
        }

        require("mason-tool-installer").setup({
            ensure_installed = vim.list_extend(vim.deepcopy(servers), tools),
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend(
            "force",
            capabilities,
            require("cmp_nvim_lsp").default_capabilities()
        )
        vim.lsp.config("*", { capabilities = capabilities })

        vim.lsp.enable(servers)
        vim.lsp.enable(manual_servers)

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

                local function nmap(keys, func, desc)
                    vim.keymap.set(
                        "n",
                        keys,
                        func,
                        { buffer = bufnr, desc = "LSP: " .. desc }
                    )
                end
                local function vmap(keys, func, desc)
                    vim.keymap.set(
                        "v",
                        keys,
                        func,
                        { buffer = bufnr, desc = "LSP: " .. desc }
                    )
                end
                local tb = require("telescope.builtin")

                nmap("gd", tb.lsp_definitions, "Goto Definition")
                nmap("gr", tb.lsp_references, "Goto References")
                nmap("gI", tb.lsp_implementations, "Goto Implementation")
                nmap("<leader>D", tb.lsp_type_definitions, "Type Definition")
                nmap("<leader>ds", tb.lsp_document_symbols, "Document Symbols")
                nmap(
                    "<leader>ws",
                    tb.lsp_dynamic_workspace_symbols,
                    "Workspace Symbols"
                )
                nmap("<leader>rn", vim.lsp.buf.rename, "Rename")
                nmap("<leader>ca", vim.lsp.buf.code_action, "Code Action")
                vmap("<leader>ca", vim.lsp.buf.code_action, "Code Action")
                nmap("K", function()
                    vim.lsp.buf.hover({ wrap = true, max_width = 80 })
                end, "Hover Documentation")
                nmap("gD", vim.lsp.buf.declaration, "Goto Declaration")

                if
                    client
                    and client.server_capabilities.documentHighlightProvider
                then
                    local hl_group = vim.api.nvim_create_augroup(
                        "custom-lsp-document-highlight-" .. bufnr,
                        { clear = true }
                    )

                    vim.api.nvim_create_autocmd(
                        { "CursorHold", "CursorHoldI" },
                        {
                            buffer = bufnr,
                            group = hl_group,
                            callback = vim.lsp.buf.document_highlight,
                        }
                    )

                    vim.api.nvim_create_autocmd(
                        { "CursorMoved", "CursorMovedI" },
                        {
                            buffer = bufnr,
                            group = hl_group,
                            callback = vim.lsp.buf.clear_references,
                        }
                    )

                    vim.api.nvim_create_autocmd("LspDetach", {
                        buffer = bufnr,
                        group = hl_group,
                        callback = function()
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds({
                                group = hl_group,
                                buffer = bufnr,
                            })
                        end,
                    })
                end
            end,
        })
    end,
}
