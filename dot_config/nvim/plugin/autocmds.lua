vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    group = vim.api.nvim_create_augroup("custom-highlight-yank", {}),
    pattern = "*",
    callback = function()
        vim.hl.on_yank()
    end,
})

local custom_ft_group = vim.api.nvim_create_augroup("custom-file-types", {})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = custom_ft_group,
    pattern = { "*.h" },
    command = "set filetype=c",
})
