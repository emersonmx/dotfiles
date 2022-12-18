local opts = { silent = true, noremap = true }

vim.g.tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_disable_when_zoomed = 1

vim.keymap.set('n', '<A-h>', vim.cmd.TmuxNavigateLeft, opts)
vim.keymap.set('n', '<A-j>', vim.cmd.TmuxNavigateDown, opts)
vim.keymap.set('n', '<A-k>', vim.cmd.TmuxNavigateUp, opts)
vim.keymap.set('n', '<A-l>', vim.cmd.TmuxNavigateRight, opts)
vim.keymap.set('n', '<A-p>', vim.cmd.TmuxNavigatePrevious, opts)
