return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        spec = {
            { "<leader>c", desc = "Code" },
            {
                "<leader>d",
                icon = { icon = "󰈔", color = "green" },
                desc = "Document",
            },
            {
                "<leader>r",
                icon = { icon = "󰑕", color = "green" },
                desc = "Rename",
            },
            { "<leader>s", desc = "Search" },
            {
                "<leader>w",
                icon = { icon = "", color = "green" },
                desc = "Workspace",
            },
        },
        icons = {
            rules = {
                { pattern = "directory", icon = "", color = "green" },
            },
        },
    },
}
