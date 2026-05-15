return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "zbirenbaum/copilot.lua",
    },
    config = function()
        local default_adapter = "copilot"

        require("codecompanion").setup({
            ignore_warnings = true,
            opts = {
                language = "pt-BR",
            },
            strategies = {
                chat = {
                    adapter = default_adapter,
                },
                inline = {
                    adapter = default_adapter,
                },
                cmd = {
                    adapter = default_adapter,
                },
            },
            display = {
                chat = {
                    auto_scroll = false,
                },
            },
        })

        vim.keymap.set(
            { "n", "v" },
            "<leader>aa",
            "<cmd>CodeCompanionChat Toggle<cr>",
            { noremap = true, silent = true }
        )
        vim.keymap.set(
            "v",
            "ga",
            "<cmd>CodeCompanionChat Add<cr>",
            { noremap = true, silent = true }
        )

        vim.cmd([[cab cc CodeCompanion]])
    end,
}
