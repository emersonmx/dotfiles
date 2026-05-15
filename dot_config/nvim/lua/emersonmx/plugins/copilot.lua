return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            panel = {
                enabled = true,
                auto_refresh = true,
            },
            suggestion = {
                enabled = true,
                auto_trigger = true,
                keymap = {},
            },
        })

        vim.keymap.set("i", "<C-y>", function()
            require("copilot.suggestion").accept()
        end, { silent = true, noremap = true })
    end,
}
