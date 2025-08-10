-- Keymaps
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local keymap = vim.keymap.set

-- Clear highlights
keymap('n', '<Esc>', ':nohlsearch<CR>', { desc = 'Clear highlights' })

-- Open diagnostics
keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', { desc = 'Open diagnostics' })

-- Better vertical movement
keymap('n', 'j', 'gj')
keymap('n', 'k', 'gk')

-- Window navigation
keymap('n', '<C-h>', '<C-w>h')
keymap('n', '<C-j>', '<C-w>j')
keymap('n', '<C-k>', '<C-w>k')
keymap('n', '<C-l>', '<C-w>l')

-- Diagnostics
keymap('n', '<leader>o', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })

-- Tabs
keymap('n', '<tab><tab>', '<cmd>tabnew<cr>', { desc = 'New Tab' })

-- cycle Neovim tabs with Ctrl-Shift-H/L
keymap('n', '<C-S-h>', '<cmd>tabprevious<CR>', { noremap = true, silent = true })
keymap('n', '<C-S-l>', '<cmd>tabnext<CR>', { noremap = true, silent = true })

-- Move visual selection
keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
