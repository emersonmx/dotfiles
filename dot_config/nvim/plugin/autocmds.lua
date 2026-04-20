vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    group = vim.api.nvim_create_augroup("custom-highlight-yank", {}),
    pattern = "*",
    callback = function()
        vim.hl.on_yank()
    end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "*.h" },
    command = "set filetype=c",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "*.h" },
    command = "set filetype=c",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    callback = function(args)
        local home = vim.fn.expand("$HOME")
        local target_dir = home .. "/.cache/zsh/completions/"
        if vim.startswith(args.file, target_dir) then
            vim.bo.filetype = "zsh"
        end
    end,
})
