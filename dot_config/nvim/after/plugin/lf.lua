vim.g.lf_map_keys = 0
vim.g.lf_replace_netrw = 1

local opts = {silent = true, noremap = true}

vim.keymap.set('n', '-', vim.cmd.LfCurrentFile, opts)
vim.keymap.set('n', '_', vim.cmd.LfWorkingDirectory, opts)
