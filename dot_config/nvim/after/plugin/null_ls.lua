local null_ls = require('null-ls')
local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    sources = {
        code_actions.gitsigns,
        diagnostics.flake8,
        diagnostics.mypy,
        formatting.black,
        formatting.isort,
        formatting.prettier,
        formatting.taplo,
    }
})
