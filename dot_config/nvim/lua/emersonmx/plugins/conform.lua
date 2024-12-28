-- check formatters at: https://github.com/stevearc/conform.nvim/blob/master/doc/conform.txt

vim.api.nvim_create_user_command("ToggleAutoFormat", function()
    local value = not (vim.b.disable_autoformat or vim.g.disable_autoformat)
    vim.b.disable_autoformat = value
    vim.g.disable_autoformat = value
    print("Auto format", value and "disabled" or "enabled")
end, {
    desc = "Toggle autoformat-on-save",
})

return {
    "stevearc/conform.nvim",
    opts = {
        notify_on_error = false,
        format_on_save = function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end
            return { timeout_ms = 500, lsp_format = "fallback" }
        end,
        formatters_by_ft = {
            bash = { "shfmt" },
            css = { "biome" },
            gdscript = { "gdformat" },
            go = { "goimports", "gofumpt" },
            html = { "biome" },
            javascript = { "biome" },
            json = { "biome" },
            lua = { "stylua" },
            python = function(bufnr)
                if
                    require("conform").get_formatter_info("ruff_format", bufnr).available
                then
                    return { "ruff_format" }
                else
                    return { "isort", "black" }
                end
            end,
            rust = { "rustfmt", lsp_format = "fallback" },
            sh = { "shfmt" },
            templ = { "templ" },
            typescript = { "biome" },
        },
    },
}
