require('lf').setup({
    escape_quit = false,
    border = 'rounded',
})

vim.keymap.set('n', '<leader>ll', vim.cmd.Lf)
vim.keymap.set('n', '<leader>lf', function()
    vim.cmd.Lf('.')
end)
