local set = vim.keymap.set

set("n", "<Esc>", vim.cmd.nohlsearch)
set("n", "<leader>n", function()
    local value = vim.o.number or vim.o.relativenumber
    vim.o.number = not value
    vim.o.relativenumber = not value
end, { desc = "Toggle line numbers" })

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
set(
    "x",
    "g/",
    "<Esc>/\\%V",
    { silent = false, desc = "Search inside visual selection" }
)
set(
    "n",
    "<leader>rf",
    "<cmd>read <cfile><cr>",
    { desc = "Read file from current line" }
)

set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

set("i", "jk", "<Esc>")
set("n", "J", "mzJ`z")
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")
