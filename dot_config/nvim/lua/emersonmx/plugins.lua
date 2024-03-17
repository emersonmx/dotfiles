local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "darker",
        },
        config = function()
            vim.cmd.colorscheme("onedark")
        end,
    },
    "nvim-tree/nvim-web-devicons",

    "tpope/vim-unimpaired",
    "tpope/vim-repeat",
    "tpope/vim-abolish",
    "tpope/vim-eunuch",

    { "numToStr/Comment.nvim", opts = {} },
    { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },

    "tpope/vim-fugitive",
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
    },

    {
        "folke/which-key.nvim",
        event = "VimEnter",
        config = function()
            require("which-key").setup()

            require("which-key").register({
                ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
                ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
                ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
                ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
                ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
            })
        end,
    },

    {
        "lambdalisue/suda.vim",
        config = function()
            vim.keymap.set("c", "w!!", "w suda://%", {})
        end,
    },
    {
        "numToStr/Navigator.nvim",
        config = function()
            local navigator = require("Navigator")

            navigator.setup()

            vim.keymap.set({ "n", "t" }, "<A-h>", navigator.left)
            vim.keymap.set({ "n", "t" }, "<A-l>", navigator.right)
            vim.keymap.set({ "n", "t" }, "<A-k>", navigator.up)
            vim.keymap.set({ "n", "t" }, "<A-j>", navigator.down)
            vim.keymap.set({ "n", "t" }, "<A-p>", navigator.previous)
        end,
    },
    "mbbill/undotree",
    "folke/zen-mode.nvim",

    {
        "nvim-telescope/telescope.nvim",
        event = "VimEnter",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function()
                    return vim.fn.executable("make") == 1
                end,
            },
            { "nvim-telescope/telescope-ui-select.nvim" },
            { "nvim-tree/nvim-web-devicons" },
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
            })

            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "ui-select")

            local builtin = require("telescope.builtin")
            vim.keymap.set(
                "n",
                "<leader>sh",
                builtin.help_tags,
                { desc = "[S]earch [H]elp" }
            )
            vim.keymap.set(
                "n",
                "<leader>sk",
                builtin.keymaps,
                { desc = "[S]earch [K]eymaps" }
            )
            vim.keymap.set(
                "n",
                "<leader>sf",
                builtin.find_files,
                { desc = "[S]earch [F]iles" }
            )
            vim.keymap.set(
                "n",
                "<leader>ss",
                builtin.builtin,
                { desc = "[S]earch [S]elect Telescope" }
            )
            vim.keymap.set(
                "n",
                "<leader>sw",
                builtin.grep_string,
                { desc = "[S]earch current [W]ord" }
            )
            vim.keymap.set(
                "n",
                "<leader>sg",
                builtin.live_grep,
                { desc = "[S]earch by [G]rep" }
            )
            vim.keymap.set(
                "n",
                "<leader>sd",
                builtin.diagnostics,
                { desc = "[S]earch [D]iagnostics" }
            )
            vim.keymap.set(
                "n",
                "<leader>sr",
                builtin.resume,
                { desc = "[S]earch [R]esume" }
            )
            vim.keymap.set(
                "n",
                "<leader>s.",
                builtin.oldfiles,
                { desc = '[S]earch Recent Files ("." for repeat)' }
            )
            vim.keymap.set(
                "n",
                "<leader><leader>",
                builtin.buffers,
                { desc = "[ ] Find existing buffers" }
            )

            vim.keymap.set("n", "<leader>/", function()
                builtin.current_buffer_fuzzy_find(
                    require("telescope.themes").get_dropdown({
                        winblend = 10,
                        previewer = false,
                    })
                )
            end, { desc = "[/] Fuzzily search in current buffer" })

            vim.keymap.set("n", "<leader>s/", function()
                builtin.live_grep({
                    grep_open_files = true,
                    prompt_title = "Live Grep in Open Files",
                })
            end, { desc = "[S]earch [/] in Open Files" })

            vim.keymap.set("n", "<leader>sn", function()
                builtin.find_files({ cwd = vim.fn.stdpath("config") })
            end, { desc = "[S]earch [N]eovim files" })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
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
                    map(
                        "<leader>D",
                        tb.lsp_type_definitions,
                        "Type [D]efinition"
                    )
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
                    map(
                        "<leader>ca",
                        vim.lsp.buf.code_action,
                        "[C]ode [A]ction"
                    )
                    map("K", vim.lsp.buf.hover, "Hover Documentation")
                    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                    local client =
                        vim.lsp.get_client_by_id(event.data.client_id)
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

            local servers = {
                bashls = {},
                docker_compose_language_service = {},
                dockerls = {},
                efm = {
                    settings = {
                        init_options = { documentFormatting = true },
                    },
                    cmd = {
                        "efm-langserver",
                        "-c",
                        vim.fn.stdpath("config") .. "/efm_config.yaml",
                    },
                },
                emmet_ls = {},
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
                                    unpack(
                                        vim.api.nvim_get_runtime_file("", true)
                                    ),
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
    },

    {
        "stevearc/conform.nvim",
        opts = {
            notify_on_error = false,
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
            formatters_by_ft = {
                lua = { "stylua" },
                python = function(bufnr)
                    if
                        require("conform").get_formatter_info(
                            "ruff_format",
                            bufnr
                        ).available
                    then
                        return { "ruff_format" }
                    else
                        return { "isort", "black" }
                    end
                end,
                javascript = { { "prettierd", "prettier" } },
                gdscript = { "gdformat" },
            },
        },
    },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                "L3MON4D3/LuaSnip",
                build = (function()
                    if
                        vim.fn.has("win32") == 1
                        or vim.fn.executable("make") == 0
                    then
                        return
                    end
                    return "make install_jsregexp"
                end)(),
            },
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            luasnip.config.setup({
                update_events = { "TextChanged", "TextChangedI" },
            })

            require("luasnip.loaders.from_vscode").lazy_load()
            -- require("luasnip.loaders.from_lua").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                completion = { completeopt = "menu,menuone,noinsert" },

                mapping = cmp.mapping.preset.insert({
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete({}),
                    ["<C-l>"] = cmp.mapping(function()
                        if luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        end
                    end, { "i", "s" }),
                    ["<C-h>"] = cmp.mapping(function()
                        if luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        end
                    end, { "i", "s" }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                },
            })
        end,
    },

    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { signs = false },
    },

    {
        "echasnovski/mini.nvim",
        config = function()
            require("mini.ai").setup({ n_lines = 500 })
            require("mini.surround").setup()
            local statusline = require("mini.statusline")
            statusline.setup({ use_icons = vim.g.have_nerd_font })
            statusline.section_location = function()
                return "%2l:%-2v"
            end
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "vimdoc",
                    "bash",
                    "c",
                    "css",
                    "dockerfile",
                    "gitcommit",
                    "gitignore",
                    "go",
                    "html",
                    "javascript",
                    "json",
                    "lua",
                    "make",
                    "markdown",
                    "python",
                    "rust",
                    "toml",
                    "typescript",
                    "vim",
                    "yaml",
                },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
}, {
    ui = {
        icons = {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            task = "📌",
            lazy = "💤 ",
        },
    },
})
