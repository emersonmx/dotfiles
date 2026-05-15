return {
    "yetone/avante.nvim",
    build = vim.fn.has("win32") ~= 0
            and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
        or "make",
    event = "VeryLazy",
    version = false,
    opts = {
        instructions_file = "avante.md",
        provider = "copilot",
        providers = {
            copilot = {
                adapter = "copilot",
                config = {
                    accept_keymap = "<C-y>",
                },
            },
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "zbirenbaum/copilot.lua",
    },
}
