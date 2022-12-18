require('lf').setup({
    escape_quit = false,
    border = 'rounded',
})

vim.keymap.set('n', '-', vim.cmd.Lf)
vim.keymap.set('n', '_', function()
    vim.cmd.Lf('.')
end)
