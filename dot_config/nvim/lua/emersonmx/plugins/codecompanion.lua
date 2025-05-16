local api_key_file = vim.fn.stdpath("config") .. "/ai_api_key.gpg"
local default_adapter = "gemini"

return {
    "olimorris/codecompanion.nvim",
    opts = {
        adapters = {
            [default_adapter] = function()
                return require("codecompanion.adapters").extend(
                    default_adapter,
                    {
                        env = {
                            api_key = "cmd: gpg --batch --quiet --decrypt "
                                .. api_key_file,
                        },
                    }
                )
            end,
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
