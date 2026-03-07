vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    group = vim.api.nvim_create_augroup("custom-highlight-yank", {}),
    pattern = "*",
    callback = function()
        vim.hl.on_yank()
    end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = vim.api.nvim_create_augroup("custom-file-types", {}),
    pattern = { "*.h" },
    command = "set filetype=c",
})

vim.api.nvim_create_autocmd("WinEnter", {
    callback = function()
        if vim.api.nvim_win_get_config(0).relative ~= "" then
            vim.wo.wrap = true
        end
    end,
})
