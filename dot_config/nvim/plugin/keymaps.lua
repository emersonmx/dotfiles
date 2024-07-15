local opt = vim.opt
local set = vim.keymap.set

set("n", "<Esc>", vim.cmd.nohlsearch)
set("n", "<leader>n", function()
    local value = opt.number:get() or opt.relativenumber:get()
    opt.number = not value
    opt.relativenumber = not value
end, { desc = "Toggle line numbers" })

set(
    "n",
    "[d",
    vim.diagnostic.goto_prev,
    { desc = "Go to previous Diagnostic message" }
)
set(
    "n",
    "]d",
    vim.diagnostic.goto_next,
    { desc = "Go to next Diagnostic message" }
)
set(
    "n",
    "<leader>e",
    vim.diagnostic.open_float,
    { desc = "Show diagnostic Error messages" }
)
set(
    "n",
    "<leader>q",
    vim.diagnostic.setloclist,
    { desc = "Open diagnostic Quickfix list" }
)

set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

set("i", "jk", "<Esc>")
set("n", "J", "mzJ`z")
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")
