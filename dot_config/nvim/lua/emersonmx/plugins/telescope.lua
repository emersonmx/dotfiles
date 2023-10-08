return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    config = function()
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
        vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
    end,
}
