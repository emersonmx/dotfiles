local git_ignored = setmetatable({}, {
    __index = function(self, key)
        local proc = vim.system({
            "git",
            "ls-files",
            "--ignored",
            "--exclude-standard",
            "--others",
            "--directory",
        }, {
            cwd = key,
            text = true,
        })
        local result = proc:wait()
        local ret = {}
        if result.code == 0 then
            for line in
                vim.gsplit(
                    result.stdout,
                    "\n",
                    { plain = true, trimempty = true }
                )
            do
                line = line:gsub("/$", "")
                table.insert(ret, line)
            end
        end

        rawset(self, key, ret)
        return ret
    end,
})

return {
    "stevearc/oil.nvim",
    config = function()
        local oil = require("oil")

        oil.setup({
            columns = { "icon" },
            keymaps = {
                ["gl"] = {
                    desc = "Open the entry under the cursor, skipping single-child directories",
                    callback = function()
                        local entry = oil.get_cursor_entry()
                        local dir = oil.get_current_dir()
                        if
                            not entry
                            or entry.type ~= "directory"
                            or not dir
                        then
                            return oil.select()
                        end
                        local path = dir .. entry.name
                        while true do
                            local children = {}
                            for name, type in vim.fs.dir(path) do
                                table.insert(
                                    children,
                                    { name = name, type = type }
                                )
                                if #children > 1 then
                                    break
                                end
                            end
                            if
                                #children ~= 1
                                or children[1].type ~= "directory"
                            then
                                break
                            end
                            path = path .. "/" .. children[1].name
                        end
                        oil.open(path)
                    end,
                },
            },
            view_options = {
                is_hidden_file = function(name, _)
                    if vim.startswith(name, ".") then
                        return true
                    end
                    local dir = oil.get_current_dir()
                    if not dir then
                        return false
                    end
                    return vim.list_contains(git_ignored[dir], name)
                end,
            },
        })

        vim.keymap.set(
            "n",
            "<leader>f",
            vim.cmd.Oil,
            { desc = "Open parent directory" }
        )
    end,
}
