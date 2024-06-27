return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        require("which-key").setup()

        require("which-key").register({
            ["<leader>"] = {
                c = "[C]ode",
                d = "[D]ocument",
                r = "[R]ename",
                s = "[S]earch",
                w = "[W]orkspace",
            },
        })
    end,
}
