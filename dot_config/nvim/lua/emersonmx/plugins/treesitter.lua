local languages = {
    "bash",
    "c",
    "css",
    "dockerfile",
    "gitcommit",
    "gitignore",
    "go",
    "gotmpl",
    "helm",
    "html",
    "javascript",
    "json",
    "lua",
    "make",
    "markdown",
    "python",
    "query",
    "rust",
    "tera",
    "toml",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = languages,
    callback = function()
        vim.treesitter.start()
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo.foldmethod = "expr"
        vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
    end,
})

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter")
        treesitter.setup()
        treesitter.install(languages):wait(60000)
    end,
}
