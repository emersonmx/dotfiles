local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    "eslint",
    "gopls",
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "taplo",
    "tsserver",
})

local cmp = require("cmp")
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I"
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set({ "n", "v" }, "<leader>cf", vim.lsp.buf.format, opts)
    vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "gs", vim.lsp.buf.workspace_symbol, opts)
end)

lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
