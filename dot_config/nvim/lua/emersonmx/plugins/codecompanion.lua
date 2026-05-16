return {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "zbirenbaum/copilot.lua",
        "ravitemer/mcphub.nvim",
    },
    config = function()
        local default_adapter = "copilot"

        require("codecompanion").setup({
            extensions = {
                mcphub = {
                    callback = "mcphub.extensions.codecompanion",
                    opts = {
                        make_tools = true,
                        show_server_tools_in_chat = true,
                        add_mcp_prefix_to_tool_names = false,
                        show_result_in_chat = true,
                        format_tool = nil,
                        make_vars = false,
                        make_slash_commands = true,
                    },
                },
            },
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
            prompt_library = {
                markdown = {
                    dirs = {
                        vim.fn.getcwd() .. "/.prompts",
                        "~/.config/prompts",
                    },
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

        vim.cmd([[cabbrev cc CodeCompanion]])
    end,
}
