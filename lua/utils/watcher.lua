local utils = require 'utils.functions'

local watcher = vim.loop.new_fs_event()
local theme_file = vim.fn.stdpath 'config' .. '/lua/config/theme.txt'

watcher:start(
  theme_file,
  {},
  vim.schedule_wrap(function(err, filename, status)
    if err then
      vim.notify('Error watching theme file: ' .. err, vim.log.levels.ERROR)
      return
    end
    utils.apply_theme()
  end)
)
