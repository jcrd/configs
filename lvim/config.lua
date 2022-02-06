-- general
lvim.log.level = "warn"
lvim.format_on_save = true

-- colorscheme
require("onedarkpro").setup {
    theme = "onelight",
    styles = {
        comments = "italic",
    },
}
lvim.colorscheme = "onedarkpro"

-- keymappings [view defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- options
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = true

-- builtin
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "css",
    "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- plugins
lvim.plugins = {
    {"olimorris/onedarkpro.nvim"},
}
