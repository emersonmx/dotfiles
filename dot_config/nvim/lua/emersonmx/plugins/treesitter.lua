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
    "toml",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
}

vim.api.nvim_create_user_command("TSInstallDefault", function()
    local registry = require("treesitter-registry")

    local to_install = {}
    for _, lang in ipairs(languages) do
        table.insert(to_install, lang)
        local info = registry.get(lang)
        local requires = info["requires"] or {}
        for _, dep_lang in ipairs(requires) do
            table.insert(to_install, dep_lang)
        end
    end

    require("nvim-treesitter").install(to_install):wait(300000)
    print("Treesitter parsers installed")
end, {
    desc = "Install the default set of treesitter parsers",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "bash",
        "c",
        "go",
        "html",
        "javascript",
        "json",
        "lua",
        "python",
        "query",
        "rust",
        "toml",
        "typescript",
        "yaml",
    },
    callback = function()
        vim.treesitter.start()
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo.foldmethod = "expr"
        vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
    end,
})

return {
    "neovim-treesitter/nvim-treesitter",
    dependencies = { "neovim-treesitter/treesitter-parser-registry" },
    lazy = false,
    build = ":TSUpdate",
}
