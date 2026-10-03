local M = {}

local function import_range(bufnr)
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local first, last
    for i, l in ipairs(lines) do
        if l:match("^import%s") then
            first = first or i
            last = i
        elseif first and not l:match("^%s*$") then
            break
        end
    end
    return first, last
end

local function fold_imports()
    local first, last = import_range(0)
    if not first or first == last then
        return
    end

    vim.opt_local.foldmethod = "manual"
    vim.opt_local.foldenable = true
    if vim.fn.foldlevel(first) == 0 then
        vim.cmd(("silent! %d,%dfold"):format(first, last))
    else
        vim.cmd(("silent! %dfoldclose"):format(first))
    end
end

function M.setup()
    local group = vim.api.nvim_create_augroup("fold_imports", { clear = false })
    vim.api.nvim_clear_autocmds({ group = group, buffer = 0 })
    vim.api.nvim_create_autocmd("BufWinEnter", {
        group = group,
        buffer = 0,
        callback = fold_imports,
    })
end

return M
