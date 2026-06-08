vim.api.nvim_create_user_command("TSInstallDefault", function()
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

    require("nvim-treesitter").install(to_install)
end, {
    desc = "Install the default set of treesitter parsers",
})
