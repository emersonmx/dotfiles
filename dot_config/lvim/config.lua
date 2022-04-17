--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
vim.opt.number = false
vim.opt.colorcolumn = "80,120"
vim.opt.showtabline = 1

lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"

vim.g.tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_disable_when_zoomed = 1

vim.g.lf_map_keys = 0
vim.g.lf_replace_netrw = 1

vim.g["asterisk#keeppos"] = 1

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = ","
lvim.localleader = "\\"

vim.api.nvim_set_keymap("", ";", ":", { noremap = true })
vim.api.nvim_set_keymap("", ":", ";", { noremap = true })
vim.api.nvim_set_keymap("c", "w!!", "w suda://%", {})

lvim.keys.normal_mode["<C-h>"] = false
lvim.keys.normal_mode["<C-j>"] = false
lvim.keys.normal_mode["<C-k>"] = false
lvim.keys.normal_mode["<C-l>"] = false
lvim.keys.normal_mode["H"] = false
lvim.keys.visual_mode["J"] = false
lvim.keys.visual_mode["K"] = false
lvim.keys.normal_mode["L"] = false

lvim.keys.normal_mode["<A-h>"] = ":TmuxNavigateLeft<cr>"
lvim.keys.normal_mode["<A-j>"] = ":TmuxNavigateDown<cr>"
lvim.keys.normal_mode["<A-k>"] = ":TmuxNavigateUp<cr>"
lvim.keys.normal_mode["<A-l>"] = ":TmuxNavigateRight<cr>"
lvim.keys.normal_mode["<A-p>"] = ":TmuxNavigatePrevious<cr>"

lvim.keys.normal_mode["*"] = "<Plug>(asterisk-z*)"
lvim.keys.normal_mode["#"] = "<Plug>(asterisk-z#)"
lvim.keys.normal_mode["g*"] = "<Plug>(asterisk-gz*)"
lvim.keys.normal_mode["g#"] = "<Plug>(asterisk-gz#)"

lvim.keys.normal_mode["<space>"] = "za"

lvim.keys.normal_mode["<leader>zz"] = ":BetterZoom<cr>"
lvim.keys.normal_mode["<leader>za"] = ":BetterZoomToggle<cr>"
lvim.keys.normal_mode["<leader>ze"] = "<C-w>="
lvim.keys.normal_mode["<leader>zw"] = "<C-w>T"

lvim.keys.normal_mode["<leader>o"] = ":only<cr>"

for i = 1, 9 do
    lvim.keys.normal_mode["<leader>" .. i] = i .. "gt"
end
lvim.keys.normal_mode["<leader>tq"] = ":tabclose<cr>"

lvim.keys.normal_mode["-"] = ":LfCurrentFile<cr>"
lvim.keys.normal_mode["_"] = ":LfWorkingDirectory<cr>"

-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.bufferline.active = false
lvim.builtin.nvimtree.active = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "rust",
    "java",
    "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.which_key.mappings["e"] = nil
-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
    { "christoomey/vim-tmux-navigator" },
    { "editorconfig/editorconfig-vim" },
    { "emersonmx/vim-better-zoom" },
    { "godlygeek/tabular" },
    { "haya14busa/vim-asterisk" },
    { "kana/vim-textobj-indent" },
    { "kana/vim-textobj-line" },
    { "kana/vim-textobj-user" },
    { "lambdalisue/suda.vim" },
    { "ptzz/lf.vim" },
    { "tommcdo/vim-exchange" },
    { "tpope/vim-abolish" },
    { "tpope/vim-dispatch" },
    { "tpope/vim-eunuch" },
    { "tpope/vim-repeat" },
    { "tpope/vim-unimpaired" },
    { "voldikss/vim-floaterm" },
    {
        "tpope/vim-surround",
        keys = { "S", "c", "d", "y" }
    },
    {
        "tpope/vim-fugitive",
        cmd = {
            "G",
            "Git",
            "Gdiffsplit",
            "Gread",
            "Gwrite",
            "Ggrep",
            "GMove",
            "GDelete",
            "GBrowse",
            "GRemove",
            "GRename",
            "Glgrep",
            "Gedit"
        },
        ft = { "fugitive" }
    },
    {
        "phaazon/hop.nvim",
        event = "BufRead",
        config = function()
            require("hop").setup()
            local set_keymap = vim.api.nvim_set_keymap
            set_keymap("", "<leader>m", "<cmd>HopChar2<cr>", { silent = true })
            set_keymap("", "<leader>j", "<cmd>HopLineAC<cr>", { silent = true })
            set_keymap("", "<leader>k", "<cmd>HopLineBC<cr>", { silent = true })
        end,
    },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
