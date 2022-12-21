local zen_mode = require('zen-mode')
zen_mode.setup()

vim.keymap.set('n', '<leader>zz', zen_mode.toggle)
