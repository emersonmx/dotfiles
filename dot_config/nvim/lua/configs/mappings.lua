local set_keymap = vim.api.nvim_set_keymap

set_keymap('', ';', ':', {noremap = true})
set_keymap('', ':', ';', {noremap = true})
set_keymap('i', 'jk', '<esc>', {})

set_keymap('n', '<leader>o', ':only<cr>', {silent = true, noremap = true})
set_keymap('n', '<leader>q', ':q<cr>', {silent = true, noremap = true})
set_keymap('n', '<Space>', 'za', {noremap = true})

-- better whitespace
vim.g.better_whitespace_enabled = 1
vim.g.strip_whitespace_on_save = 1
vim.g.strip_whitelines_at_eof = 1
vim.g.strip_whitespace_confirm = 0

-- lf
vim.g.lf_map_keys = 0
vim.g.lf_replace_netrw = 1

set_keymap('n', '-', ':LfCurrentFile<CR>', {silent = true, noremap = true})
set_keymap('n', '_', ':LfWorkingDirectory<CR>', {silent = true, noremap = true})

-- suda
set_keymap('c', 'w!!', 'w suda://%', {})

-- tmux navigator
vim.g.tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_disable_when_zoomed = 1

set_keymap('n', '<A-h>', ':TmuxNavigateLeft<cr>', {silent = true, noremap = true})
set_keymap('n', '<A-j>', ':TmuxNavigateDown<cr>', {silent = true, noremap = true})
set_keymap('n', '<A-k>', ':TmuxNavigateUp<cr>', {silent = true, noremap = true})
set_keymap('n', '<A-l>', ':TmuxNavigateRight<cr>', {silent = true, noremap = true})
set_keymap('n', '<A-p>', ':TmuxNavigatePrevious<cr>', {silent = true, noremap = true})
