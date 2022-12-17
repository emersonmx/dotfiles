vim.g.tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_disable_when_zoomed = 1

vim.keymap.set('n', '<A-h>', vim.cmd.TmuxNavigateLeft, {silent = true, noremap = true})
vim.keymap.set('n', '<A-j>', vim.cmd.TmuxNavigateDown, {silent = true, noremap = true})
vim.keymap.set('n', '<A-k>', vim.cmd.TmuxNavigateUp, {silent = true, noremap = true})
vim.keymap.set('n', '<A-l>', vim.cmd.TmuxNavigateRight, {silent = true, noremap = true})
vim.keymap.set('n', '<A-p>', vim.cmd.TmuxNavigatePrevious, {silent = true, noremap = true})
