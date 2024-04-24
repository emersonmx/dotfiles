vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.mouse = "a"

vim.opt.number = true
vim.opt.relativenumber = true
vim.keymap.set("n", "<leader>n", function()
    local value = vim.opt.number:get() or vim.opt.relativenumber:get()
    vim.opt.number = not value
    vim.opt.relativenumber = not value
end, { desc = "Toggle line numbers" })

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.wrap = false
vim.opt.colorcolumn = "81"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("state") .. "/undodir"
vim.opt.undofile = true

vim.opt.showmode = false

if vim.fn.has("wsl") == 1 then
    vim.g.clipboard = {
        copy = {
            ["+"] = "win32yank.exe -i --crlf",
            ["*"] = "win32yank.exe -i --crlf",
        },
        paste = {
            ["+"] = "win32yank.exe -o --lf",
            ["*"] = "win32yank.exe -o --lf",
        },
    }
end

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.inccommand = "split"

vim.opt.cursorline = true

vim.opt.scrolloff = 10

vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]]

vim.g.python3_host_prog = vim.fn.stdpath("config") .. "/.venv/bin/python"
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.keymap.set(
    "n",
    "[d",
    vim.diagnostic.goto_prev,
    { desc = "Go to previous [D]iagnostic message" }
)
vim.keymap.set(
    "n",
    "]d",
    vim.diagnostic.goto_next,
    { desc = "Go to next [D]iagnostic message" }
)
vim.keymap.set(
    "n",
    "<leader>e",
    vim.diagnostic.open_float,
    { desc = "Show diagnostic [E]rror messages" }
)
vim.keymap.set(
    "n",
    "<leader>q",
    vim.diagnostic.setloclist,
    { desc = "Open diagnostic [Q]uickfix list" }
)

vim.keymap.set(
    "t",
    "<Esc><Esc>",
    "<C-\\><C-n>",
    { desc = "Exit terminal mode" }
)

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup(
        "custom-highlight-yank",
        { clear = true }
    ),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>f", vim.cmd.Ex, { desc = "Open File Explorer" })
