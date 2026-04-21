vim.g.mapleader = ' '

vim.opt.termguicolors = true
vim.cmd("colorscheme habamax")

-- Options
vim.opt.number = true
vim.opt.relativenumber = false 
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 2
vim.opt.signcolumn = 'yes'
vim.opt.clipboard = 'unnamedplus'
vim.opt.scrolloff = 8
vim.opt.updatetime = 250

-- Telescope keymaps
--local tb = require('telescope.builtin')
--vim.keymap.set('n', '<leader>ff', tb.find_files)
--vim.keymap.set('n', '<leader>fg', tb.live_grep)
--vim.keymap.set('n', '<leader>fb', tb.buffers)

-- Clear search highlight
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

