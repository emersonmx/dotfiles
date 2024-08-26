-- check formatters at: https://github.com/stevearc/conform.nvim/blob/master/doc/conform.txt
local prettier_formatter = { "prettierd", "prettier", stop_after_first = true }

return {
    "stevearc/conform.nvim",
    opts = {
        notify_on_error = false,
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
        formatters_by_ft = {
            bash = { "shfmt" },
            css = prettier_formatter,
            gdscript = { "gdformat" },
            go = { "goimports", "gofumpt" },
            html = prettier_formatter,
            javascript = prettier_formatter,
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
        },
    },
}
