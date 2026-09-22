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

local function has_query(lang, name)
    return #vim.treesitter.query.get_files(lang, name) > 0
end

vim.api.nvim_create_user_command("TSInstallDefault", function()
    require("nvim-treesitter").install(languages):wait(60000)
    print("Treesitter parsers installed")
end, {
    desc = "Install the default set of treesitter parsers",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = languages,
    callback = function(args)
        local lang = args.match

        vim.treesitter.start()
        if has_query(lang, "folds") then
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.wo.foldmethod = "expr"
        end
        if has_query(lang, "indents") then
            vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
        end
    end,
})

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
}
