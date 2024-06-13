-- check formatters at: https://github.com/stevearc/conform.nvim/blob/master/doc/conform.txt
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
            css = { { "prettierd", "prettier" } },
            gdscript = { "gdformat" },
            go = { "goimports", "gofumpt" },
            javascript = { { "prettierd", "prettier" } },
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
            rust = { "rustfmt" },
            sh = { "shfmt" },
            typescript = { { "prettierd", "prettier" } },
        },
    },
}
