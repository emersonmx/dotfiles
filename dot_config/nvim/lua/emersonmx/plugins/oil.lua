local function parse_output(proc)
    local result = proc:wait()
    local ret = {}
    if result.code == 0 then
        for line in
            vim.gsplit(result.stdout, "\n", { plain = true, trimempty = true })
        do
            line = line:gsub("/$", "")
            ret[line] = true
        end
    end
    return ret
end

local function new_git_status()
    return setmetatable({}, {
        __index = function(self, key)
            local ignore_proc = vim.system({
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
            local tracked_proc = vim.system(
                { "git", "ls-tree", "HEAD", "--name-only" },
                {
                    cwd = key,
                    text = true,
                }
            )
            local ret = {
                ignored = parse_output(ignore_proc),
                tracked = parse_output(tracked_proc),
            }

            rawset(self, key, ret)
            return ret
        end,
    })
end
local git_status = new_git_status()

return {
    "stevearc/oil.nvim",
    config = function()
        local oil = require("oil")

        local refresh = require("oil.actions").refresh
        local orig_refresh = refresh.callback
        refresh.callback = function(...)
            git_status = new_git_status()
            orig_refresh(...)
        end

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
                is_hidden_file = function(name, bufnr)
                    local dir = require("oil").get_current_dir(bufnr)
                    local is_dotfile = vim.startswith(name, ".")
                    if not dir then
                        return is_dotfile
                    end
                    if is_dotfile then
                        return not git_status[dir].tracked[name]
                    else
                        return git_status[dir].ignored[name]
                    end
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
