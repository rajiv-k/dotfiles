local opt = vim.opt

opt.encoding = "utf8"
opt.fileencoding = "utf8"
opt.syntax = "ON"
opt.termguicolors = true
opt.cursorline = true
opt.listchars = "trail:~"
opt.list = false

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.splitright = true
opt.laststatus = 2
-- opt.statusline = [%n]\ %<%F\ %m\ \ \ \ [%R%H%W%Y][%{&ff}]\ [%3b\ 0x%2B]\ %=\ line:%l/%L\ col:%-2c\ \ \ %3p%%\ \ ")}}]]

vim.cmd.colorscheme("onedark")
vim.api.nvim_set_hl(0, 'Comment', {fg = "cyan"})

vim.wo.number = true

-- vim.g.nvim_tree_show_icons = {
--   git = 0,
--   folders = 0,
--   files = 0,
--   folder_arrows = 0,
-- }

vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

