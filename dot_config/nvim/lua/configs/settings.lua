local set_keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ','
vim.g.maplocalleader = '\\'
set_keymap('', '\\', ',', {noremap = true})

vim.opt.colorcolumn = {81, 121}
vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.smartcase = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 8
vim.opt.shiftwidth = 4

vim.opt.mouse = 'a'
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.autowrite = true
vim.opt.hidden = true
