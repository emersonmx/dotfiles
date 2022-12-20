vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set('i', 'jk', '<Esc>')

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', '<leader>n', function()
    local value = vim.opt.nu:get() or vim.opt.relativenumber:get()
    vim.opt.nu = not value
    vim.opt.relativenumber = not value
end)

vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])
