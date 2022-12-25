local navigator = require('Navigator')

navigator.setup()

vim.keymap.set({ 'n', 't' }, '<A-h>', navigator.left)
vim.keymap.set({ 'n', 't' }, '<A-l>', navigator.right)
vim.keymap.set({ 'n', 't' }, '<A-k>', navigator.up)
vim.keymap.set({ 'n', 't' }, '<A-j>', navigator.down)
vim.keymap.set({ 'n', 't' }, '<A-p>', navigator.previous)
