-- check formatters at: https://github.com/stevearc/conform.nvim/blob/master/doc/conform.txt

local prettier_formatter = { "prettierd", "prettier", stop_after_first = true }
local web_formatter = function(bufnr)
    if require("conform").get_formatter_info("prettierd", bufnr).available then
        return { "rustywind", "prettierd" }
    else
        return { "rustywind", "prettier" }
    end
end

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
            css = prettier_formatter,
            gdscript = { "gdformat" },
            go = { "goimports", "gofumpt" },
            html = web_formatter,
            javascript = prettier_formatter,
            javascriptreact = web_formatter,
            json = prettier_formatter,
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
            typescript = prettier_formatter,
            typescriptreact = web_formatter,
        },
    },
}
