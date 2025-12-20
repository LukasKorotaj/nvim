-- Keymaps
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local keymap = vim.keymap.set

local diagwin = function()
  local editor_width = vim.o.columns
  local win_width = math.floor(editor_width * 0.3)
  local win_height = math.floor(vim.o.lines * 0.3)

  vim.diagnostic.open_float {
    -- DATA SOURCE: Explicitly target the line we checked
    scope = 'line',
    zindex = 200,

    -- UI / VISUALS
    focusable = false,
    close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost' },
    border = 'rounded',
    prefix = '🤓 ',
    source = 'if_many',

    -- WINDOW POSITIONING (The HUD Logic)
    relative = 'editor',
    offset_x = vim.o.columns,

    max_width = win_width,
    max_height = win_height,
  }
end

-- Clear highlights
keymap('n', '<Esc>', ':nohlsearch<CR>', { desc = 'Clear highlights' })

-- Better vertical movement
keymap('n', 'j', 'gj')
keymap('n', 'k', 'gk')

-- Change markings
keymap('n', 'mm', 'm', { desc = 'Set Mark' })

-- Window navigation
keymap('n', '<C-h>', '<C-w>h')
keymap('n', '<C-j>', '<C-w>j')
keymap('n', '<C-k>', '<C-w>k')
keymap('n', '<C-l>', '<C-w>l')

-- Diagnostics
keymap('n', '<leader>o', diagwin, { desc = 'Line Diagnostics' })

-- Tabs
keymap('n', '<tab><tab>', '<cmd>tabnew<cr>', { desc = 'New Tab' })

-- cycle Neovim tabs with Ctrl-Shift-H/L
keymap('n', '<C-S-h>', '<cmd>tabprevious<CR>', { noremap = true, silent = true })
keymap('n', '<C-S-l>', '<cmd>tabnext<CR>', { noremap = true, silent = true })

-- Move visual selection
keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
