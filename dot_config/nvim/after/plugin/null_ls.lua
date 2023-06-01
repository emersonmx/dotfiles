local null_ls = require("null-ls")
local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local venv_bin = ".venv/bin"

null_ls.setup({
    sources = {
        code_actions.gitsigns,
        diagnostics.ruff.with({ prefer_local = venv_bin }),
        diagnostics.mypy.with({ prefer_local = venv_bin }),
        formatting.ruff.with({ prefer_local = venv_bin }),
        formatting.black.with({ prefer_local = venv_bin }),
        formatting.prettier,
        formatting.taplo,
    }
})
