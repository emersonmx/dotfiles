local default_adapter = "copilot"

return {
    "olimorris/codecompanion.nvim",
    opts = {
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
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "zbirenbaum/copilot.lua",
    },
}
