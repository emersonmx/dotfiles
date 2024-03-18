return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "vimdoc",
                "bash",
                "c",
                "css",
                "dockerfile",
                "gitcommit",
                "gitignore",
                "go",
                "html",
                "javascript",
                "json",
                "lua",
                "make",
                "markdown",
                "python",
                "rust",
                "toml",
                "typescript",
                "vim",
                "yaml",
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
