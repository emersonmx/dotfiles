return {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
        require("which-key").setup()

        require("which-key").register({
            c = { name = "[C]ode", _ = "which_key_ignore" },
            d = { name = "[D]ocument", _ = "which_key_ignore" },
            r = { name = "[R]ename", _ = "which_key_ignore" },
            s = { name = "[S]earch", _ = "which_key_ignore" },
            w = { name = "[W]orkspace", _ = "which_key_ignore" },
        }, { prefix = "<leader>" })
    end,
}
