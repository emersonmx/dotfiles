return {
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
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        luasnip.config.setup({
            update_events = { "TextChanged", "TextChangedI" },
        })
        luasnip.filetype_extend("cpp", { "c" })
        luasnip.filetype_extend("typescript", { "javascript" })

        require("luasnip.loaders.from_lua").lazy_load({
            paths = { "./lua/emersonmx/snippets" },
        })

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
                ["<C-j>"] = cmp.mapping(function()
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end, { "i", "s" }),
                ["<C-k>"] = cmp.mapping(function()
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { "i", "s" }),
            }),
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
            matching = { disallow_symbol_nonprefix_matching = false },
        })
    end,
}
