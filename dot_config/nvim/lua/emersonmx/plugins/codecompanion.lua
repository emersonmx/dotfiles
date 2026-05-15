return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "zbirenbaum/copilot.lua",
    },
    config = function()
        local default_adapter = "copilot"

        require("codecompanion").setup({
            rules = {
                default = {
                    description = "Collection of common files for all projects",
                    files = {
                        ".clinerules",
                        ".cursorrules",
                        ".goosehints",
                        ".rules",
                        ".windsurfrules",
                        ".github/copilot-instructions.md",
                        "AGENT.md",
                        "AGENTS.md",
                        { path = "CLAUDE.md", parser = "claude" },
                        { path = "CLAUDE.local.md", parser = "claude" },
                        { path = "~/.claude/CLAUDE.md", parser = "claude" },
                    },
                    is_preset = true,
                },
            },
            opts = {
                language = "pt-BR",
                chat = {
                    autoload = "default",
                    enabled = true,
                },
            },
            interactions = {
                chat = {
                    adapter = default_adapter,
                },
                inline = {
                    adapter = default_adapter,
                },
                cmd = {
                    adapter = default_adapter,
                },
                background = {
                    adapter = default_adapter,
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
