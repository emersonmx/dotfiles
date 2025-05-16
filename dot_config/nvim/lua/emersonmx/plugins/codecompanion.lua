local api_key_file = vim.fn.stdpath("config") .. "/ai_api_key.gpg"
local default_adapter = "gemini"

return {
    "olimorris/codecompanion.nvim",
    opts = {
        env = {
            api_key = "cmd: gpg --batch --quiet --decrypt" .. api_key_file,
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
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
}
