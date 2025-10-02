-- Create autocommand groups
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Hghlight yank
autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Disable indentscope for certain filetypes
local indentscope = augroup('IndentScope', { clear = true })
autocmd('FileType', {
  group = indentscope,
  pattern = {
    'help',
    'alpha', -- For alpha-nvim
    'dashboard', -- For dashboard-nvim
    'neo-tree',
    'Trouble',
    'trouble',
    'notify',
    'lazy',
    'mason',
    'startup',
  },
  desc = 'Disable indentscope for specific filetypes',
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})

-- Restore cursor position
local restore_cursor = augroup('RestoreCursor', { clear = true })
autocmd('BufReadPost', {
  group = restore_cursor,
  pattern = '*',
  desc = 'Restore cursor position when opening files',
  callback = function()
    local ignore_ft = { 'gitcommit', 'gitrebase', 'xxd' }
    local buf_ft = vim.bo.filetype

    if vim.tbl_contains(ignore_ft, buf_ft) then
      return
    end

    local mark_line = vim.fn.line '\'"'
    local last_line = vim.fn.line '$'

    if mark_line > 1 and mark_line <= last_line then
      pcall(vim.cmd, 'normal! g`"')
    end
  end,
})

local theme_file = vim.fn.stdpath 'config' .. '/lua/config/theme.txt'

-- Function to read theme and apply it
local function apply_theme()
  vim.schedule(function() -- defer to avoid timing issues
    local theme = vim.fn.readfile(theme_file)[1]
    local mode = vim.fn.readfile(theme_file)[2]
    if theme and theme ~= '' then
      vim.o.background = mode
      vim.cmd.colorscheme(theme)
    end
  end)
end

-- Watcher using luv.fs_event
local watcher = vim.loop.new_fs_event()
watcher:start(
  theme_file,
  {},
  vim.schedule_wrap(function(err, filename, status)
    if err then
      vim.notify('Error watching theme file: ' .. err, vim.log.levels.ERROR)
      return
    end
    apply_theme()
  end)
)
