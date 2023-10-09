vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>n", function()
    local value = vim.opt.number:get() or vim.opt.relativenumber:get()
    vim.opt.number = not value
    vim.opt.relativenumber = not value
end)

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

local function move_up()
    return vim.fn.wildmenumode() == 1 and "<C-p>" or "<Up>"
end

local function move_down()
    return vim.fn.wildmenumode() == 1 and "<C-n>" or "<Down>"
end

vim.keymap.set("c", "<C-p>", move_up, { noremap = true, expr = true })
vim.keymap.set("c", "<C-n>", move_down, { noremap = true, expr = true })
vim.keymap.set("c", "<C-k>", move_up, { noremap = true, expr = true })
vim.keymap.set("c", "<C-j>", move_down, { noremap = true, expr = true })
