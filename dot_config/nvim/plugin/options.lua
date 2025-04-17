local opt = vim.opt

opt.mouse = "a"

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.breakindent = true

opt.wrap = false
opt.colorcolumn = "81"

opt.formatexpr = "v:lua.require('conform').formatexpr()"

opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.stdpath("state") .. "/undodir"
opt.undofile = true

opt.showmode = false

opt.clipboard = "unnamedplus"

opt.ignorecase = true
opt.smartcase = true

opt.updatetime = 250
opt.timeoutlen = 300

opt.splitright = true
opt.splitbelow = true

opt.inccommand = "split"

opt.cursorline = true

opt.scrolloff = 10

opt.hlsearch = true

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]]

vim.g.python3_host_prog = vim.fn.stdpath("config") .. "/.venv/bin/python"
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    group = vim.api.nvim_create_augroup("custom-highlight-yank", {}),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank()
    end,
})

local custom_ft_group = vim.api.nvim_create_augroup("custom-file-types", {})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = custom_ft_group,
    pattern = { "*.h" },
    command = "set filetype=c",
})
